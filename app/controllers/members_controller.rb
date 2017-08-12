class MembersController < ApplicationController
	def index #Shows the Noosphere, all members
		render "index"
	end

	def create #After new info is entered, validated, and saved, sends the now member to the general info page to learn about the network
		render "welcome#info"
	end

	def new #Shows the two forms
		render "signuplogin"
	end

	def edit #Actually points to members/:id/edit
		@member = Member.find(params[:id])
		redirect_to @member
		render "edit"
	end

	def show #Shows the member page
		render "show"
	end

	def update #After edited info is entered, validated, and saved, send the member to their member page
		render "index"
	end

	def destroy #Shows delete warning page
		render "index"
	end
end