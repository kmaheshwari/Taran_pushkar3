class RaceTimingGrpEvntsController < ApplicationController
  # GET /race_timing_grp_evnts
  # GET /race_timing_grp_evnts.json
  def index
    @race_timing_grp_evnts = RaceTimingGrpEvnt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @race_timing_grp_evnts }
    end
  end



  # GET /race_timing_grp_evnts/1
  # GET /race_timing_grp_evnts/1.json
  def show
    @race_timing_grp_evnt = RaceTimingGrpEvnt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race_timing_grp_evnt }
    end
  end

  # GET /race_timing_grp_evnts/new
  # GET /race_timing_grp_evnts/new.json
  def new
    @race_timing_grp_evnt = RaceTimingGrpEvnt.new
    events=Event.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @race_timing_grp_evnt }
    end
  end

  # GET /race_timing_grp_evnts/1/edit
  def edit
    @race_timing_grp_evnt = RaceTimingGrpEvnt.find(params[:id])
  end

  # POST /race_timing_grp_evnts
  # POST /race_timing_grp_evnts.json
  def create
    @race_timing_grp_evnt = RaceTimingGrpEvnt.new(params[:race_timing_grp_evnt])

    respond_to do |format|
      if @race_timing_grp_evnt.save
        format.html { redirect_to @race_timing_grp_evnt, notice: 'Race timing grp evnt was successfully created.' }
        format.json { render json: @race_timing_grp_evnt, status: :created, location: @race_timing_grp_evnt }
      else
        format.html { render action: "new" }
        format.json { render json: @race_timing_grp_evnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /race_timing_grp_evnts/1
  # PUT /race_timing_grp_evnts/1.json
  def update
    @race_timing_grp_evnt = RaceTimingGrpEvnt.find(params[:id])

    respond_to do |format|
      if @race_timing_grp_evnt.update_attributes(params[:race_timing_grp_evnt])
        format.html { redirect_to @race_timing_grp_evnt, notice: 'Race timing grp evnt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @race_timing_grp_evnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_timing_grp_evnts/1
  # DELETE /race_timing_grp_evnts/1.json
  def destroy
    @race_timing_grp_evnt = RaceTimingGrpEvnt.find(params[:id])
    @race_timing_grp_evnt.destroy

    respond_to do |format|
      format.html { redirect_to race_timing_grp_evnts_url }
      format.json { head :no_content }
    end
  end



#to filter data
  def gsearch
    
    @events=Event.all
    @members=Member.all
  end

  
  def gresult
      #@event=Event.find_by_event_name(params[:event_id])
      @mid = MemberGroup.where("group_event_id IN (?)", params[:race_timing_grp_evnt][:group_event_id]).pluck(:member_id)
      
      #@mid=MemberEvents.find_by_event_id(params[:event_id]).pluck(:member_id)
      @mname=Member.where("id IN (?) AND competetion_level_id IN (?)",@mid,params[:race_timing_grp_evnt][:gage]).pluck(:name)
      #@meid=MemberEvent.where(@mname.id).pluck(:id)
      @midlst=[]
    @mname.each do |mn|
      @fmid=Member.where("name IN (?)", mn).pluck( :id)
      @midlst.push(@fmid).flatten!.uniq!
    end
      @race_timing_grp_evnt = RaceTimingGrpEvnt.new
      
          if @mname.nil?
        respond_to do |format|
          format.html { redirect_to "/gsearch", notice: 'No Record Found'}
        end 
      else  
        respond_to do |format|
          
          format.html { render action: "new"}
        end   
      end 
          
  end
  

end
