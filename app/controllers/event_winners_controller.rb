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
    @event_winner = EventWinner.new

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
