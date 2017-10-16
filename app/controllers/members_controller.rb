class MembersController < ApplicationController
	# http_basic_authenticate_with name: "BigBertha", password: "BigBertha", except: [:index, :terms, :info] 

	def index #Shows the Noosphere, all members
		@members = Member.all
	end

	def create #After new info is entered, validated, and saved, sends the new member to the general info page to learn about the network
		@member = Member.new(member_params)
		if @member.save
			@info = true
	      	log_in @member
			redirect_to params[:welcome] || "http://localhost:3000/info"
			# render "members/rookie"
		else 
			render "signuplogin"
		end
	end

	def new #Shows the two forms
		@member = Member.new
		render "signuplogin"
	end

	def show #Shows the member page
		@member = Member.find(params[:id])
	end

	# def login 
	# 	@member = Member.find_by(params[:alter_ego])
	# 	if @member.password == params[:password]
	# 		redirect_to params[:welcome] || "http://localhost:3000/info"
	# 	else
	# 		@member = 'null'
	# 		render "signuplogin"
	# 	end
	# end

	def edit #Actually points to members/:id/edit
		@member = Member.find(params[:id])
		render "edit"
	end

	def update #After edited info is entered, validated, and saved, send the member to their member page
		@member = Member.find(params[:id])
		@member.update(member_params)
		@members = Member.all
		render "index"
		# else
		# 	render "edit"
		# end
	end

	def destroy #Shows delete warning page
		@member = Member.find(params[:id])
		@member.destroy
		redirect_to members_path
	end

	# def search
	#   @member = Member.search(params[:email])
	# end

	private
		def member_params
			params.require(:member).permit(	
				:acct_type, 
				:first_name, 
				:last_name, 
				:alter_ego, 
				:email, 
				:password_digest, 
				:password, 
				:tagline, 
				:aboutme, 
				:avatar, 
				:location, 
				:fav_style_manual, 
				:education, 
				:fav_advice)
		end
end