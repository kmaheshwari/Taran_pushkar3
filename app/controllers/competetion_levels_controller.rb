class CompetetionLevelsController < ApplicationController
	# GET /competetion_levels
  # GET /competetion_levels.json
  def index
    @competetion_levels = CompetetionLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @competetion_levels }
    end
  end

  # GET /competetion_levels/1
  # GET /competetion_levels/1.json
  def show
    @competetion_level = CompetetionLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @competetion_level }
    end
  end

  # GET /competetion_levels/new
  # GET /competetion_levels/new.json
  def new
    @competetion_level = CompetetionLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @competetion_level }
    end
  end

  # GET /competetion_levels/1/edit
  def edit
    @competetion_level = CompetetionLevel.find(params[:id])
  end

  # POST /competetion_levels
  # POST /competetion_levels.json
  def create
    @competetion_level = CompetetionLevel.new(params[:competetion_level])

    respond_to do |format|
      if @competetion_level.save
        format.html { redirect_to @competetion_level, notice: 'CompetetionLevel was successfully created.' }
        format.json { render json: @competetion_level, status: :created, location: @competetion_level }
      else
        format.html { render action: "new" }
        format.json { render json: @competetion_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /competetion_levels/1
  # PUT /competetion_levels/1.json
  def update
    @competetion_level = CompetetionLevel.find(params[:id])

    respond_to do |format|
      if @competetion_level.update_attributes(params[:competetion_level])
        format.html { redirect_to @competetion_level, notice: 'CompetetionLevel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @competetion_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competetion_levels/1
  # DELETE /competetion_levels/1.json
  def destroy
    @competetion_level = CompetetionLevel.find(params[:id])
    @competetion_level.destroy

    respond_to do |format|
      format.html { redirect_to competetion_levels_url }
      format.json { head :no_content }
    end
  end
end
