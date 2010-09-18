class PostOthersController < ApplicationController
  # GET /post_others
  # GET /post_others.xml
  def index
    @post_others = PostOther.all

    session[:blogs_path] = request.url
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_others }
    end
  end

  # GET /post_others/1
  # GET /post_others/1.xml
  def show
    @post_other = PostOther.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_other }
    end
  end

  # GET /post_others/new
  # GET /post_others/new.xml
  def new
    @post_other = PostOther.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_other }
    end
  end

  # GET /post_others/1/edit
  def edit
    @post_other = PostOther.find(params[:id])
  end

  # POST /post_others
  # POST /post_others.xml
  def create
    @post_other = PostOther.new(params[:post_other])

    respond_to do |format|
      if @post_other.save
        format.html { redirect_to(@post_other, :notice => 'Post other was successfully created.') }
        format.xml  { render :xml => @post_other, :status => :created, :location => @post_other }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_other.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_others/1
  # PUT /post_others/1.xml
  def update
    @post_other = PostOther.find(params[:id])

    respond_to do |format|
      if @post_other.update_attributes(params[:post_other])
        format.html { redirect_to(@post_other, :notice => 'Post other was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_other.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_others/1
  # DELETE /post_others/1.xml
  def destroy
    @post_other = PostOther.find(params[:id])
    @post_other.destroy

    respond_to do |format|
      format.html { redirect_to(post_others_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def authorize
    unless params[:action] == "index" || params[:action] == "show"
      super
    end
  end

end
