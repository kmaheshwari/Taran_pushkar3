class RaceTimingIndEvntsController < ApplicationController
  respond_to :html, :json
  # GET /race_timing_ind_evnts
  # GET /race_timing_ind_evnts.json
  def index
    @race_timing_ind_evnts = RaceTimingIndEvnt.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @race_timing_ind_evnts }
    end
  end
  
  
  #to filter data
  def search
    #@race_timing_ind_evnt = RaceTimingIndEvnt.new
    @events=Event.all
    @members=Member.all
    param1 = params[:age] # "value1"
    param2 = params[:event_id] # "value2"
    
  end
  # GET /race_timing_ind_evnts/1
  # GET /race_timing_ind_evnts/1.json
  def show
    @race_timing_ind_evnt = RaceTimingIndEvnt.find(params[:id])

    respond_to do |format|
      format.html{redirect_to search_path}
      format.json { render json: @race_timing_ind_evnt }
    end
  end

  # GET /race_timing_ind_evnts/new
  # GET /race_timing_ind_evnts/new.json
  def new
    @race_timing_ind_evnt = RaceTimingIndEvnt.new
    @events=Event.all
    @member=Member.all
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
    #@race_timing_ind_evnt = RaceTimingIndEvnt.new(params[:race_timing_ind_evnt])

    params[:member_id].zip(params[:mem]).each do |mid,tm|
        @race_timing_ind_evnt = RaceTimingIndEvnt.new(params[:race_timing_ind_evnt])
        @race_timing_ind_evnt.member_id = mid.to_i
        @race_timing_ind_evnt.time = tm
        @race_timing_ind_evnt.save  
    end

    
    respond_to do |format|
      
      if @race_timing_ind_evnt.save
       
        format.html { redirect_to @race_timing_ind_evnt, notice: 'Race timing ind evnt was successfully created.',:age =>  params[:race_timing_ind_evnt][:age], :eid => params[:race_timing_ind_evnt][:event_id] }
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

  def hit_round
    @race_timing_ind_evnt = RaceTimingIndEvnt.new
    @hmid = RaceTimingIndEvnt.where("event_id in (?) AND age_group in(?)",params[:event_id],params[:age]).group("minute,second,micro_second").limit(8).pluck(:member_id)
    @mname = Member.where("id in (?)", @hmid).pluck(:name)
    @final_names = [@mname[6],@mname[4],@mname[2],@mname[0],@mname[1],@mname[3],@mname[5],@mname[7]]
  end

  def result
    #@event=Event.find_by_event_name(params[:event_id])
    @mid = MemberEvent.where("event_id IN (?)", params[:race_timing_ind_evnt][:event_id]).pluck(:member_id)
    #@mid=MemberEvents.find_by_event_id(params[:event_id]).pluck(:member_id)
    @midlst=Member.where("id IN (?) AND competetion_level_id IN (?)",@mid,params[:race_timing_ind_evnt][:age]).pluck(:id)
    #@meid=MemberEvent.where(@mname.id).pluck(:id)
    @mname=[]
    @midlst.each do |i|
      @fmn=Member.where("id IN (?)", i).pluck( :name)
      @mname.push(@fmn).flatten!
    end
    @race_timing_ind_evnt = RaceTimingIndEvnt.new
    @pagin = Kaminari.paginate_array(@mname).page(params[:page]).per(8)

    
        if @mname.nil?
      respond_to do |format|
        format.html { redirect_to "/search", notice: 'No Record Found'}
      end 
    else  
      respond_to do |format|
        #format.html { render "/race_timing_ind_evnts/result", :layout => false}
        format.html { render action: "new"}
        format.html { redirect_to action: "new", :age => params[:race_timing_ind_evnt][:age], :event_id => params[:race_timing_ind_evnt][:event_id]}
      end   
    end 

 end

def find
end
# for display timing of every participant
 def show_timing
  @mid = RaceTimingIndEvnt.where("event_id IN (?)", params[:race_timing_ind_evnt][:event_id]).pluck(:member_id)
  @midlst=RaceTimingIndEvnt.where("member_id IN (?) AND age_group IN (?)",@mid,params[:race_timing_ind_evnt][:age]).pluck(:member_id)
  
  @mname=[]
  @ftime=[]
  @midlst.each do |m|
    @time=[]
    @min=RaceTimingIndEvnt.where("member_id in (?)",m).pluck(:minute)
    @sec=RaceTimingIndEvnt.where("member_id in (?)",m).pluck(:second)
    @ms=RaceTimingIndEvnt.where("member_id in (?)",m).pluck(:micro_second)
    @fmn=Member.where("id IN (?)", m).pluck( :name)
    @mname.push(@fmn).flatten!
    @time.push(@min)
    @time.push(@sec)
    @time.push(@ms).flatten!
    @ftime.push(@time)
  end

  if @mname.nil?
      respond_to do |format|
        format.html { redirect_to "/find", notice: 'No Record Found'}
      end 
    else  
      respond_to do |format|
        #format.html { render "/race_timing_ind_evnts/result", :layout => false}
        format.html { render action: "show_timing"}
        format.html { redirect_to action: "show_timing", :age => params[:race_timing_ind_evnt][:age], :event_id => params[:race_timing_ind_evnt][:event_id]}
      end   
    end 
end
end


