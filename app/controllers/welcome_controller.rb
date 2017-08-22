class WelcomeController < ApplicationController
  def index
  end

  def info
	if @new_member
		@member = "true"
	end
  	render "info"
  end

  def terms
  	render "terms"
  end
end
