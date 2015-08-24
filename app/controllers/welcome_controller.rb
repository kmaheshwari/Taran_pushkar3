class WelcomeController < ApplicationController
	def index
		@events=Event.all
		@gevents=GroupEvent.all
	end
end
