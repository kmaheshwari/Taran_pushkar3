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
    @hit_eid = RaceTimingGrpEvnt.where("event_type in (?)", "Hit").pluck(:group_event_id).uniq!
    
    @age_id = RaceTimingGrpEvnt.pluck(:age_group).uniq!

    @final = []
    @eid.each do |el|
      @ename =GroupEvent.where("id in (?)", el).pluck(:grp_event_name)
      @age_id.each do |ag|
        if @hit_eid
          if @hit_eid.include?(el)
            @res_mid = RaceTimingGrpEvnt.where("group_event_id in (?) AND age_group in (?) AND event_type in (?)",el,ag,"Hit").order("gminute,gsecond,gmicro_second").limit(5).pluck(:member_id) 
          else
            @res_mid = RaceTimingGrpEvnt.where("group_event_id in (?) AND age_group in (?)",el,ag).order("gminute,gsecond,gmicro_second").limit(5).pluck(:member_id)
          end 
        else
            @res_mid = RaceTimingGrpEvnt.where("group_event_id in (?) AND age_group in (?)",el,ag).order("gminute,gsecond,gmicro_second").limit(5).pluck(:member_id)
        end
          
        @r_list =  []
        @r_list.push(@ename).flatten!
        @age_group=CompetetionLevel.where("id in (?)",ag).pluck(:age_group)
        @r_list.push(@age_group)
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

  def gdownload_pdf
      new
      pdf = render_to_string(pdf: "grp_event_winner.pdf",template: "grp_event_winners/_form.html.erb", encoding: "UTF-8", layout: 'winner')

      send_data pdf ,:disposition => 'inline', filename: 'group_winner.pdf', :type => 'application/pdf'
      save_path = Rails.root.join('pdfs','group_winner.pdf')
        File.open(save_path, 'wb') do |file|
          file << pdf
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
