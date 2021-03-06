class SessionsController < ApplicationController
  def new
  end

  def create
    @member = Member.find_by(alter_ego: params[:session][:alter_ego])
    if @member && @member.authenticate(params[:session][:password])
    	# login_num = member.login_num + 1
		  # member.update(:login_num, login_num)
		  log_in @member
      redirect_to params[:welcome] || "http://localhost:3000/info"
    else
    	flash.now[:danger] = 'Invalid alter_ego/password combination'
      render "members/signuplogin"
    end
  end

  def destroy
    log_out @member
    redirect_to root_url
  end
end
