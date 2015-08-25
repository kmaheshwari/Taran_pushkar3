class EventWinnersController < ApplicationController
  # GET /event_winners
  # GET /event_winners.json
  def index
    @event_winners = EventWinner.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_winners }
    end
  end

  # GET /event_winners/1
  # GET /event_winners/1.json
  def show
    @event_winner = EventWinner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_winner }
    end
  end

  # GET /event_winners/new
  # GET /event_winners/new.json
  def new
    #for finding winners
    @eid=Event.pluck(:id)
    
    @age_id = RaceTimingIndEvnt.pluck(:age_group).uniq!
    
    @final = []
    @eid.each do |el|
      @ename =Event.where("id in (?)", el).pluck(:event_name)
      @age_id.each do |ag|
        @r_list =  []
        @r_list.push(@ename).flatten!
        @age_group=CompetetionLevel.where("id in (?)",@age_id).pluck(:age_group)
        @r_list.push(@age_group)
        @res_mid = RaceTimingIndEvnt.where("event_id in (?) AND age_group in (?)",el,ag).group("minute,second,micro_second").limit(5).pluck(:member_id)
        @list = []
        @res_mid.each do |rm|
          @result = Member.where("id in (?)", rm).pluck(:name)
          @list.push(@result).flatten! 
        end
        @r_list.push(@list).flatten!
        @final.push(@r_list)
      end
    end

    @event_winner = EventWinner.new
    @race_timing_ind_evnt=RaceTimingIndEvnt.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_winner }
    end
  end

  # GET /event_winners/1/edit
  def edit
    @event_winner = EventWinner.find(params[:id])
  end

  # POST /event_winners
  # POST /event_winners.json
  def create
    @event_winner = EventWinner.new(params[:event_winner])

    respond_to do |format|
      if @event_winner.save
        format.html { redirect_to @event_winner, notice: 'Event winner was successfully created.' }
        format.json { render json: @event_winner, status: :created, location: @event_winner }
      else
        format.html { render action: "new" }
        format.json { render json: @event_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_winners/1
  # PUT /event_winners/1.json
  def update
    @event_winner = EventWinner.find(params[:id])

    respond_to do |format|
      if @event_winner.update_attributes(params[:event_winner])
        format.html { redirect_to @event_winner, notice: 'Event winner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_winners/1
  # DELETE /event_winners/1.json
  def destroy
    @event_winner = EventWinner.find(params[:id])
    @event_winner.destroy

    respond_to do |format|
      format.html { redirect_to event_winners_url }
      format.json { head :no_content }
    end
  end
end
