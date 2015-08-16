class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @list=[]
    @mid=Member.pluck(:id)
    @mid.each do |m|
      @elist=[]
      @eid = MemberEvent.where("member_id IN (?)",m).pluck(:event_id)
      @geid = MemberGroup.where("member_id IN (?)",m).pluck(:group_event_id)
      @ename = Event.where("id IN (?)",@eid).pluck(:event_name)
      @gename = GroupEvent.where("id IN (?)",@geid).pluck(:grp_event_name)
      @elist.push(@ename)
      @elist.push(@gename)
      @list.push(@elist)
      
    end
    @grp_evnt = GroupEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    @mid=@member.id
    @elist=[]
      @eid = MemberEvent.where("member_id IN (?)",@mid).pluck(:event_id)
      @geid = MemberGroup.where("member_id IN (?)",@mid).pluck(:group_event_id)
      @ename = Event.where("id IN (?)",@eid).pluck(:event_name)
      @gename = GroupEvent.where("id IN (?)",@geid).pluck(:grp_event_name)
      @elist.push(@ename)
      @elist.push(@gename)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])

  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
	
    params[:events][:id].each do |e|
      if !e.empty?
        @member.member_events.build(:event_id => e)
        @member.member_groups.build(:group_event_id => e)
      end
    end
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end

