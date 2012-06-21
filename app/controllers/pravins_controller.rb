class PravinsController < ApplicationController

  layout "radiation"

# GET /pravins
  # GET /pravins.xml
  def index
    @pravins = Pravin.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pravins }
    end
  end

  # GET /pravins/1
  # GET /pravins/1.xml
  def show
    @pravin = Pravin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pravin }
    end
  end

  # GET /pravins/new
  # GET /pravins/new.xml
  def new
    @pravin = Pravin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pravin }
    end
  end

  # GET /pravins/1/edit
  def edit
    @pravin = Pravin.find(params[:id])
  end

  # POST /pravins
  # POST /pravins.xml
  def create
    @pravin = Pravin.new(params[:pravin])

    respond_to do |format|
      if @pravin.save
        format.html { redirect_to(@pravin, :notice => 'Pravin was successfully created.') }
        format.xml  { render :xml => @pravin, :status => :created, :location => @pravin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pravin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pravins/1
  # PUT /pravins/1.xml
  def update
    @pravin = Pravin.find(params[:id])

    respond_to do |format|
      if @pravin.update_attributes(params[:pravin])
        format.html { redirect_to(@pravin, :notice => 'Pravin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pravin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pravins/1
  # DELETE /pravins/1.xml
  def destroy
    @pravin = Pravin.find(params[:id])
    @pravin.destroy

    respond_to do |format|
      format.html { redirect_to(pravins_url) }
      format.xml  { head :ok }
    end
  end
end
