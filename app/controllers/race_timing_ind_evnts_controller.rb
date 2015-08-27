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
  
  
  #to filter data
  def search
    #@race_timing_ind_evnt = RaceTimingIndEvnt.new
    @events=Event.all
    @members=Member.all

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
    @member=Member.all
    
    #@temp=MemberEvent.where("event_id IN (?)", MemberEvent.event_id)
    #@itemlist = Member.where(['age_group=? AND event_id=?', @race_timing_ind_evnt.age, @race_timing_ind_evnt.evnt])
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

    if params[:event_type] == 'Hit'
        
        hit_round

      end
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

  def hit_round
    @hmem = RaceTimingIndEvnt.group("minute,second,micro_second").limit(8).pluck(:member_id)
    @mname = Member.where("id in (?)", @hmem)
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
      end   
    end 

 end
end
