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
        @age_group=CompetetionLevel.where("id in (?)",ag).pluck(:age_group)
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

  def download_pdf
      new
      pdf = render_to_string(pdf: "event_winner.pdf",template: "event_winners/_form.html.erb", encoding: "UTF-8", layout: 'winner')

      send_data pdf ,:disposition => 'inline', filename: 'winner.pdf', :type => 'application/pdf'
      save_path = Rails.root.join('pdfs','winner.pdf')
        File.open(save_path, 'wb') do |file|
          file << pdf
        end

    end


  #to add points for each winner
  def winner

    @eid=RaceTimingIndEvnt.pluck(:event_id).uniq!
    @age=RaceTimingIndEvnt.pluck(:age_group).uniq!
    @age_g = CompetetionLevel.where("id in (?)",@age).pluck(:age_group)
    @all_names = []
    @age.each do |a|
      @eid.each do |e|  
           
        @mem=RaceTimingIndEvnt.where("event_id in (?) and age_group in (?)",e,a).group("minute,second,micro_second").limit(3).pluck(:member_id)
        @i=1
        @mem.each do |m|
          @pi=0
          if @i==1
            p=5
          elsif @i==2
            p=3
          else
            p=2
          end
          
          @wid=EventWinner.where("member_id in (?)",m).pluck(:id)
          @event_winn = EventWinner.find(@wid) 
          if EventWinner.where("member_id in (?)",m).exists?
            @pi = EventWinner.where("member_id in (?)",m).pluck(:points).flatten!.to_i
            
            EventWinner.update_counters(@wid, :points => p+@pi)
            @i=@i+1
            
            
           else
            @event_winner = EventWinner.new(params[:event_winner])
            @event_winner.member_id = m
            @event_winner.points = p
            @event_winner.save
            @i=@i+1
            
          end

        end
      end
       @mem=RaceTimingIndEvnt.where("age_group in (?)",a).group("minute,second,micro_second").limit(3).pluck(:member_id)
       @ewid = EventWinner.where("member_id in (?)",@mem).group("points").limit(1).pluck(:member_id)
       @ewname = Member.where("id in (?)",@ewid).pluck(:name)
       @all_names.push(@ewname).flatten!
    end
    @e=EventWinner.all

  end
  # GET /event_winners/1/edit
  def edit
    @event_winner = EventWinner.find(params[:id])
  end

  # POST /event_winners - 
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
