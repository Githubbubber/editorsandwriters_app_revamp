class WelcomeController < ApplicationController
  def index
  end

  def info
  	render "info"
  end

  def terms
  	render "terms"
  end
end
