class GrpEventWinnersController < ApplicationController
  # GET /grp_event_winners
  # GET /grp_event_winners.json
  def index
    @grp_event_winners = GrpEventWinner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grp_event_winners }
    end
  end

  # GET /grp_event_winners/1
  # GET /grp_event_winners/1.json
  def show
    @grp_event_winner = GrpEventWinner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grp_event_winner }
    end
  end

  # GET /grp_event_winners/new
  # GET /grp_event_winners/new.json
  def new
    #for finding winners
    @eid=GroupEvent.pluck(:id)
    
    @age_id = RaceTimingGrpEvnt.pluck(:competetion_level_id).uniq!

    @final = []
    @eid.each do |el|
      @ename =GroupEvent.where("id in (?)", el).pluck(:grp_event_name)
      @age_id.each do |ag|
        @r_list =  []
        @r_list.push(@ename).flatten!
        @age_group=CompetetionLevel.where("id in (?)",@age_id).pluck(:age_group)
        @r_list.push(@age_group)
        @res_mid = RaceTimingGrpEvnt.where("group_event_id in (?) AND competetion_level_id in (?)",el,ag).group("gminute,gsecond,gmicro_second").limit(5).pluck(:member_id)
        @list = []
        @res_mid.each do |rm|
          @result = Member.where("id in (?)", rm).pluck(:name)
          @list.push(@result).flatten! 
        end
        @r_list.push(@list).flatten!
        @final.push(@r_list)
      end
    end
    @grp_event_winner = GrpEventWinner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grp_event_winner }
    end
  end

  # GET /grp_event_winners/1/edit
  def edit
    @grp_event_winner = GrpEventWinner.find(params[:id])
  end

  # POST /grp_event_winners
  # POST /grp_event_winners.json
  def create
    @grp_event_winner = GrpEventWinner.new(params[:grp_event_winner])

    respond_to do |format|
      if @grp_event_winner.save
        format.html { redirect_to @grp_event_winner, notice: 'Grp event winner was successfully created.' }
        format.json { render json: @grp_event_winner, status: :created, location: @grp_event_winner }
      else
        format.html { render action: "new" }
        format.json { render json: @grp_event_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grp_event_winners/1
  # PUT /grp_event_winners/1.json
  def update
    @grp_event_winner = GrpEventWinner.find(params[:id])

    respond_to do |format|
      if @grp_event_winner.update_attributes(params[:grp_event_winner])
        format.html { redirect_to @grp_event_winner, notice: 'Grp event winner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grp_event_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grp_event_winners/1
  # DELETE /grp_event_winners/1.json
  def destroy
    @grp_event_winner = GrpEventWinner.find(params[:id])
    @grp_event_winner.destroy

    respond_to do |format|
      format.html { redirect_to grp_event_winners_url }
      format.json { head :no_content }
    end
  end

  

end
