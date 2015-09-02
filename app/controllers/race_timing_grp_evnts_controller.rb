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
      format.html{redirect_to gsearch_path} # show.html.erb
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
    #for multiple entries
    params[:member_id].zip(params[:mem]).each do |mid,tm|
        @race_timing_grp_evnt = RaceTimingGrpEvnt.new(params[:race_timing_grp_evnt])
        @race_timing_grp_evnt.member_id = mid.to_i
        @race_timing_grp_evnt.gtime = tm
        @race_timing_grp_evnt.save
    end

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
  def ghit_round
    @race_timing_grp_evnt = RaceTimingGrpEvnt.new
    @hmid = RaceTimingGrpEvnt.where("group_event_id in (?) AND age_group in(?)",params[:group_event_id],params[:gage]).group("gminute,gsecond,gmicro_second").limit(9).pluck(:member_id)
    @mname = Member.where("id in (?)", @hmid).pluck(:name)
    @final_names = [@mname[6],@mname[4],@mname[2],@mname[0],@mname[1],@mname[3],@mname[5],@mname[7]]
  end
  
  def gresult
      #@event=Event.find_by_event_name(params[:event_id])
      @mid = MemberGroup.where("group_event_id IN (?)", params[:race_timing_grp_evnt][:group_event_id]).pluck(:member_id)
      
      #@mid=MemberEvents.find_by_event_id(params[:event_id]).pluck(:member_id)
      @midlst=Member.where("id IN (?) AND competetion_level_id IN (?)",@mid,params[:race_timing_grp_evnt][:gage]).pluck(:id)
      #@meid=MemberEvent.where(@mname.id).pluck(:id)
      @mname=[]
    @midlst.each do |mn|
      @fmid=Member.where("id IN (?)", mn).pluck( :name)
      @mname.push(@fmid).flatten!
    end
      @race_timing_grp_evnt = RaceTimingGrpEvnt.new
      @pagin = Kaminari.paginate_array(@mname).page(params[:page]).per(8)
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
  def gfind
end

 def gshow_timing
  @mid = RaceTimingGrpEvnt.where("group_event_id IN (?)", params[:race_timing_grp_evnt][:group_event_id]).group("gminute,gsecond,gmicro_second").limit(8).pluck(:member_id)
  @midlst=RaceTimingGrpEvnt.where("member_id IN (?) AND age_group IN (?)",@mid,params[:race_timing_grp_evnt][:gage]).pluck(:member_id)
  
  @mname=[]
  @ftime=[]
  @midlst.each do |m|
    @time=[]
    @min=RaceTimingGrpEvnt.where("member_id in (?)",m).pluck(:gminute)
    @sec=RaceTimingGrpEvnt.where("member_id in (?)",m).pluck(:gsecond)
    @ms=RaceTimingGrpEvnt.where("member_id in (?)",m).pluck(:gmicro_second)
    @fmn=Member.where("id IN (?)", m).pluck( :name)
    @mname.push(@fmn).flatten!
    @time.push(@min)
    @time.push(@sec)
    @time.push(@ms).flatten!
    @ftime.push(@time)
  end

  if @mname.nil?
      respond_to do |format|
        format.html { redirect_to "/gfind", notice: 'No Record Found'}
      end 
    else  
      respond_to do |format|
        #format.html { render "/race_timing_ind_evnts/result", :layout => false}
        format.html { render action: "gshow_timing"}
        format.html { redirect_to action: "gshow_timing", :age => params[:race_timing_ind_evnt][:age], :event_id => params[:race_timing_ind_evnt][:event_id]}
      end   
    end 
end

end
