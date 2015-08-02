class RaceTimingIndEvntsController < ApplicationController
  # GET /race_timing_ind_evnts
  # GET /race_timing_ind_evnts.json
  def index
    @race_timing_ind_evnts = RaceTimingIndEvnt.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @race_timing_ind_evnts }
    end
  end

  # GET /race_timing_ind_evnts/1
  # GET /race_timing_ind_evnts/1.json
  def show
    @race_timing_ind_evnt = RaceTimingIndEvnt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race_timing_ind_evnt }
    end
  end

  # GET /race_timing_ind_evnts/new
  # GET /race_timing_ind_evnts/new.json
  def new
    @race_timing_ind_evnt = RaceTimingIndEvnt.new
    @events=Event.all
    @members=Member.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @race_timing_ind_evnt }
    end
  end

  # GET /race_timing_ind_evnts/1/edit
  def edit
    @race_timing_ind_evnt = RaceTimingIndEvnt.find(params[:id])
  end

  # POST /race_timing_ind_evnts
  # POST /race_timing_ind_evnts.json
  def create
    @race_timing_ind_evnt = RaceTimingIndEvnt.new(params[:race_timing_ind_evnt])

    respond_to do |format|
      if @race_timing_ind_evnt.save
        format.html { redirect_to @race_timing_ind_evnt, notice: 'Race timing ind evnt was successfully created.' }
        format.json { render json: @race_timing_ind_evnt, status: :created, location: @race_timing_ind_evnt }
      else
        format.html { render action: "new" }
        format.json { render json: @race_timing_ind_evnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /race_timing_ind_evnts/1
  # PUT /race_timing_ind_evnts/1.json
  def update
    @race_timing_ind_evnt = RaceTimingIndEvnt.find(params[:id])

    respond_to do |format|
      if @race_timing_ind_evnt.update_attributes(params[:race_timing_ind_evnt])
        format.html { redirect_to @race_timing_ind_evnt, notice: 'Race timing ind evnt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @race_timing_ind_evnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_timing_ind_evnts/1
  # DELETE /race_timing_ind_evnts/1.json
  def destroy
    @race_timing_ind_evnt = RaceTimingIndEvnt.find(params[:id])
    @race_timing_ind_evnt.destroy

    respond_to do |format|
      format.html { redirect_to race_timing_ind_evnts_url }
      format.json { head :no_content }
    end
  end

#temporary variables
  def age=(input_data)
  end
  def evnt=(input_data)
  end
  def e_type=(input_data)
  end

end
