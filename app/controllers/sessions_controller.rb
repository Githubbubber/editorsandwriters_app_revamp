class SessionsController < ApplicationController
  def new
  end

  def create
    @member = Member.find_by(alter_ego: params[:session][:alter_ego].downcase)
    if @member && @member.authenticate(params[:session][:password])
    	# login_num = member.login_num + 1
		  # member.update(:login_num, login_num)
		  log_in @member
    else
    	flash.now[:danger] = 'Invalid alter_ego/password combination'
    end
      redirect_to params[:welcome] || "http://localhost:3000/info"
  end

  def destroy
    log_out @member
    redirect_to root_url
  end
end
