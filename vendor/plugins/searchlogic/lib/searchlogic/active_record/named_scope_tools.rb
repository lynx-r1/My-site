module Searchlogic
  module ActiveRecord
    # Adds methods that give extra information about a classes named scopes.
    module NamedScopeTools
      # Retrieves the options passed when creating the respective named scope. Ex:
      #
      #   named_scope :whatever, :conditions => {:column => value}
      #
      # This method will return:
      #
      #   :conditions => {:column => value}
      #
      # ActiveRecord hides this internally in a Proc, so we have to try and pull it out with this
      # method.
      def named_scope_options(name)
        key = scopes.key?(name.to_sym) ? name.to_sym : condition_scope_name(name)
        
        if key
          #TODO: recover the find options from relation
          eval("options", scopes[key].binding)
        else
          nil
        end
      end
      
      # The arity for a named scope's proc is important, because we use the arity
      # to determine if the condition should be ignored when calling the search method.
      # If the condition is false and the arity is 0, then we skip it all together. Ex:
      #
      #   User.named_scope :age_is_4, :conditions => {:age => 4}
      #   User.search(:age_is_4 => false) == User.all
      #   User.search(:age_is_4 => true) == User.all(:conditions => {:age => 4})
      #
      # We also use it when trying to "copy" the underlying named scope for association
      # conditions. This way our aliased scope accepts the same number of parameters for
      # the underlying scope.
      def named_scope_arity(name)
        options = named_scope_options(name)
        options.respond_to?(:arity) ? options.arity : nil
      end
      
      # When searchlogic calls a named_scope on a foreigh model it will execute that scope and then call scope(:find).
      # When we get these options we want this to be in an exclusive scope, especially if we are calling a condition on
      # the same originating model:
      #
      #   Company.users_company_name_equals("name")
      #
      # If we aren't in an exclusive scope we will get unexpected results for the :joins option. Lastly, we want the named_scopes
      # generated by searchlogic to be symbols whenever possible. The reason for this is so that we can allow
      # ActiveRecord to leverage its joins library that automatically aliases joins if they appear more than once in a query.
      # If the joins are strings, AtiveRecord can't do anything. Because the code that does this in ActiveRecord is pretty bad
      # when it comes to being consisitent, searchlogic had to fix this in Searchloigc::ActiveRecord::Consistency. That said,
      # part of this fix is to normalize joins into strings. We do not want to do this if we are calling scopes on foreigh models.
      # Only when we are performing an action on it. This is what the searchlogic_delegation thread variable is all about. A
      # flag to let search logic know not to convert joins to strings.
      def in_searchlogic_delegation(&block)
        old = Thread.current["searchlogic_delegation"]
        Thread.current["searchlogic_delegation"] = true
        with_exclusive_scope(&block)
        Thread.current["searchlogic_delegation"] = old
      end
      
      # A convenience method for creating inner join sql to that your inner joins
      # are consistent with how Active Record creates them. Basically a tool for
      # you to use when writing your own named scopes. This way you know for sure
      # that duplicate joins will be removed when chaining scopes together that
      # use the same join.
      #
      # Also, don't worry about breaking up the joins or retriving multiple joins.
      # ActiveRecord will remove dupilicate joins and Searchlogic assists ActiveRecord in
      # breaking up your joins so that they are unique.
      def inner_joins(association_name)
        ::ActiveRecord::Associations::ClassMethods::InnerJoinDependency.new(self, association_name, nil).join_associations.collect { |assoc| assoc.association_join }
      end
      
      # A convenience methods to create a join on a polymorphic associations target.
      # Ex:
      #
      # Audit.belong_to :auditable, :polymorphic => true
      # User.has_many :audits, :as => :auditable
      #
      # Audit.inner_polymorphic_join(:user, :as => :auditable) # =>
      #   "INNER JOINER users ON users.id = audits.auditable_id AND audits.auditable_type = 'User'"
      #
      # This is used internally by searchlogic to handle accessing conditions on polymorphic associations.
      def inner_polymorphic_join(target, options = {})
        options[:on] ||= table_name
        options[:on_table_name] ||= connection.quote_table_name(options[:on])
        options[:target_table] ||= connection.quote_table_name(target.to_s.pluralize)
        options[:as] ||= "owner"
        postgres = ::ActiveRecord::Base.connection.adapter_name == "PostgreSQL"
        "INNER JOIN #{options[:target_table]} ON #{options[:target_table]}.id = #{options[:on_table_name]}.#{options[:as]}_id AND " +
          "#{options[:on_table_name]}.#{options[:as]}_type = #{postgres ? "E" : ""}'#{target.to_s.camelize}'"
      end
      
      # See inner_joins. Does the same thing except creates LEFT OUTER joins.
      def left_outer_joins(association_name)
        ::ActiveRecord::Associations::ClassMethods::JoinDependency.new(self, association_name, nil).join_associations.collect { |assoc| assoc.association_join }
      end
    end
  end
end