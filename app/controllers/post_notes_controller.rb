class PostNotesController < ApplicationController
  # GET /post_notes
  # GET /post_notes.xml
  def index
    @post_notes = PostNote.title_like_all(params[:search].to_s.split)
    @post_notes |= PostNote.content_like_all(params[:search].to_s.split)
    @post_notes = @post_notes.sort_by(&:created_at)
    @post_notes.reverse!

    session[:blogs_path] = request.fullpath
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_notes }
    end
  end

  # GET /post_notes/1
  # GET /post_notes/1.xml
  def show
    @post_note = PostNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_note }
    end
  end

  # GET /post_notes/new
  # GET /post_notes/new.xml
  def new
    @post_note = PostNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_note }
    end
  end

  # GET /post_notes/1/edit
  def edit
    @post_note = PostNote.find(params[:id])
  end

  # POST /post_notes
  # POST /post_notes.xml
  def create
    @post_note = PostNote.new(params[:post_note])

    respond_to do |format|
      if @post_note.save
        format.html { redirect_to(@post_note, :notice => 'Post note was successfully created.') }
        format.xml  { render :xml => @post_note, :status => :created, :location => @post_note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_notes/1
  # PUT /post_notes/1.xml
  def update
    @post_note = PostNote.find(params[:id])

    respond_to do |format|
      if @post_note.update_attributes(params[:post_note])
        format.html { redirect_to(@post_note, :notice => 'Post note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_notes/1
  # DELETE /post_notes/1.xml
  def destroy
    @post_note = PostNote.find(params[:id])
    @post_note.destroy

    respond_to do |format|
      format.html { redirect_to(post_notes_url) }
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
