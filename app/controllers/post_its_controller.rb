class PostItsController < ApplicationController
  # GET /post_its
  # GET /post_its.xml
  def index
    @post_its = PostIt.title_like_all(params[:search].to_s.split)
    @post_its |= PostIt.content_like_all(params[:search].to_s.split)
    @post_its.reverse!

    session[:blogs_path] = request.fullpath
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_its }
    end
  end

  # GET /post_its/1
  # GET /post_its/1.xml
  def show
    @post_it = PostIt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_it }
    end
  end

  # GET /post_its/new
  # GET /post_its/new.xml
  def new
    @post_it = PostIt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_it }
    end
  end

  # GET /post_its/1/edit
  def edit
    @post_it = PostIt.find(params[:id])
  end

  # POST /post_its
  # POST /post_its.xml
  def create
    @post_it = PostIt.new(params[:post_it])

    respond_to do |format|
      if @post_it.save
        format.html { redirect_to(@post_it, :notice => 'Post it was successfully created.') }
        format.xml  { render :xml => @post_it, :status => :created, :location => @post_it }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_it.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_its/1
  # PUT /post_its/1.xml
  def update
    @post_it = PostIt.find(params[:id])

    respond_to do |format|
      if @post_it.update_attributes(params[:post_it])
        format.html { redirect_to(@post_it, :notice => 'Post it was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_it.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_its/1
  # DELETE /post_its/1.xml
  def destroy
    @post_it = PostIt.find(params[:id])
    @post_it.destroy

    respond_to do |format|
      format.html { redirect_to(post_its_url) }
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
