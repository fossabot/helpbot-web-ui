class TriggersController < ApplicationController
  # GET /triggers
  # GET /triggers.xml
  def index
    @triggers = Trigger.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @triggers }
    end
  end

  # GET /triggers/1
  # GET /triggers/1.xml
  def show
    @trigger = Trigger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trigger }
    end
  end

  # GET /triggers/new
  # GET /triggers/new.xml
  #def new
  #  @trigger = Trigger.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.xml  { render :xml => @trigger }
  #  end
  #end

  # GET /triggers/1/edit
  def edit
    @trigger = Trigger.find(params[:id])
    redirect_to(@trigger) unless owns_trigger(@trigger)
  end

  # POST /triggers
  # POST /triggers.xml
  #def create
  #  @trigger = Trigger.new(params[:trigger])

  #  respond_to do |format|
  #    if @trigger.save
  #      flash[:notice] = 'Trigger was successfully created.'
  #      format.html { redirect_to(@trigger) }
  #      format.xml  { render :xml => @trigger, :status => :created, :location => @trigger }
  #    else
  #      format.html { render :action => "new" }
  #      format.xml  { render :xml => @trigger.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /triggers/1
  # PUT /triggers/1.xml
  def update
    @trigger = Trigger.find(params[:id])
    redirect_to(@trigger) if !owns_trigger(@trigger)

    respond_to do |format|
      if @trigger.update_attributes(params[:trigger])
        flash[:notice] = 'Trigger was successfully updated.'
        format.html { redirect_to(@trigger) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trigger.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /triggers/1
  # DELETE /triggers/1.xml
  def destroy
    @trigger = Trigger.find(params[:id])
    return if !owns_trigger(@trigger)
    
    @trigger.destroy

    respond_to do |format|
      format.html { redirect_to(triggers_url) }
      format.xml  { head :ok }
    end
  end
end