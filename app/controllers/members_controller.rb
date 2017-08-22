class MembersController < ApplicationController
	def index #Shows the Noosphere, all members
		@members = Member.all
		render :index
	end

	def create #After new info is entered, validated, and saved, sends the new member to the general info page to learn about the network
		@new_member = Member.new(member_params)
		@new_member.save
		redirect_to params[:welcome] || "http://localhost:3000/info"
		# render "members/rookie"
	end

	def new #Shows the two forms
		@member = Member.new
		render "signuplogin"
	end

	def edit #Actually points to members/:id/edit
		@member = Member.find(params[:id])
		redirect_to @member
		render "edit"
	end

	def show #Shows the member page
		@member = Member.find(params[:id])
		# redirect_to @member
		render "show"
	end

	def update #After edited info is entered, validated, and saved, send the member to their member page
		render "index"
	end

	def destroy #Shows delete warning page
		render "index"
	end

	def search
	  @member = Member.search(params[:email])
	end

	private
		def member_params
			params.require(:member).permit(:first_name, :last_name, :email, :alter_ego, :password, :acct_type, :password_digest, :tagline, :aboutme, :avatar, :location, :fav_style_manual, :education, :fav_advice)
		end
end