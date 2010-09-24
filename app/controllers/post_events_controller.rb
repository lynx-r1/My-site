class PostEventsController < ApplicationController
  # GET /post_events
  # GET /post_events.xml
  def index
    @post_events = PostEvent.title_like_all(params[:search].to_s.split)
    @post_events |= PostEvent.content_like_all(params[:search].to_s.split)

    session[:blogs_path] = request.fullpath
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_events }
    end
  end

  # GET /post_events/1
  # GET /post_events/1.xml
  def show
    @post_event = PostEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_event }
    end
  end

  # GET /post_events/new
  # GET /post_events/new.xml
  def new
    @post_event = PostEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_event }
    end
  end

  # GET /post_events/1/edit
  def edit
    @post_event = PostEvent.find(params[:id])
  end

  # POST /post_events
  # POST /post_events.xml
  def create
    @post_event = PostEvent.new(params[:post_event])

    respond_to do |format|
      if @post_event.save
        format.html { redirect_to(@post_event, :notice => 'Post event was successfully created.') }
        format.xml  { render :xml => @post_event, :status => :created, :location => @post_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_events/1
  # PUT /post_events/1.xml
  def update
    @post_event = PostEvent.find(params[:id])

    respond_to do |format|
      if @post_event.update_attributes(params[:post_event])
        format.html { redirect_to(@post_event, :notice => 'Post event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_events/1
  # DELETE /post_events/1.xml
  def destroy
    @post_event = PostEvent.find(params[:id])
    @post_event.destroy

    respond_to do |format|
      format.html { redirect_to(post_events_url) }
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
