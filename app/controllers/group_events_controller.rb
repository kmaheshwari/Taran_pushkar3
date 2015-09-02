class GroupEventsController < ApplicationController
  # GET /group_events
  # GET /group_events.json
  def index
    @group_events = GroupEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_events }
    end
  end

  # GET /group_events/1
  # GET /group_events/1.json
  def show
    @group_event = GroupEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_event }
    end
  end

  # GET /group_events/new
  # GET /group_events/new.json
  def new
    @group_event = GroupEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_event }
    end
  end

  # GET /group_events/1/edit
  def edit
    @group_event = GroupEvent.find(params[:id])
  end

  # POST /group_events
  # POST /group_events.json
  def create
    @group_event = GroupEvent.new(params[:group_event])

    respond_to do |format|
      if @group_event.save
        format.html { redirect_to @group_event, notice: 'Group event was successfully created.' }
        format.json { render json: @group_event, status: :created, location: @group_event }
      else
        format.html { render action: "new" }
        format.json { render json: @group_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_events/1
  # PUT /group_events/1.json
  def update
    @group_event = GroupEvent.find(params[:id])

    respond_to do |format|
      if @group_event.update_attributes(params[:group_event])
        format.html { redirect_to @group_event, notice: 'Group event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_events/1
  # DELETE /group_events/1.json
  def destroy
    @group_event = GroupEvent.find(params[:id])
    @group_event.destroy

    respond_to do |format|
      format.html { redirect_to group_events_url }
      format.json { head :no_content }
    end
  end

#for listing students
def gfind_stud
end
def gstud_list
  @e=GroupEvent.where("id in (?)",params[:group_event][:group_event_id]).pluck(:grp_event_name)
  @ag=CompetetionLevel.where("id in (?)",params[:group_event][:age]).pluck(:age_group)
  @mid=MemberGroup.where("group_event_id in (?)",params[:group_event][:group_event_id]).pluck(:member_id)
  @mname=Member.where("id IN (?) AND competetion_level_id IN (?)",@mid,params[:group_event][:age]).pluck(:name)
  

end
end
