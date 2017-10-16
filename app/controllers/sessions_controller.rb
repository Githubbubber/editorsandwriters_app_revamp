class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(alter_ego: params[:session][:alter_ego].downcase)
    if member && member.authenticate(params[:session][:password])
    	# login_num = member.login_num + 1
		  # member.update(:login_num, login_num)
		  log_in member
      redirect_to params[:welcome] || "http://localhost:3000/info"
    else
    	flash.now[:danger] = 'Invalid email/password combination'
      render 'index'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
