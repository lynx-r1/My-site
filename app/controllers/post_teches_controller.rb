class PostTechesController < ApplicationController
  # GET /post_teches
  # GET /post_teches.xml
  def index
    @post_teches = PostTech.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_teches }
    end
  end

  # GET /post_teches/1
  # GET /post_teches/1.xml
  def show
    @post_tech = PostTech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_tech }
    end
  end

  # GET /post_teches/new
  # GET /post_teches/new.xml
  def new
    @post_tech = PostTech.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_tech }
    end
  end

  # GET /post_teches/1/edit
  def edit
    @post_tech = PostTech.find(params[:id])
  end

  # POST /post_teches
  # POST /post_teches.xml
  def create
    @post_tech = PostTech.new(params[:post_tech])

    respond_to do |format|
      if @post_tech.save
        format.html { redirect_to(@post_tech, :notice => 'Post tech was successfully created.') }
        format.xml  { render :xml => @post_tech, :status => :created, :location => @post_tech }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_tech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_teches/1
  # PUT /post_teches/1.xml
  def update
    @post_tech = PostTech.find(params[:id])

    respond_to do |format|
      if @post_tech.update_attributes(params[:post_tech])
        format.html { redirect_to(@post_tech, :notice => 'Post tech was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_tech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_teches/1
  # DELETE /post_teches/1.xml
  def destroy
    @post_tech = PostTech.find(params[:id])
    @post_tech.destroy

    respond_to do |format|
      format.html { redirect_to(post_teches_url) }
      format.xml  { head :ok }
    end
  end
end
