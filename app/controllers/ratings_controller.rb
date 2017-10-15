class RatingsController < ApplicationController
  # http_basic_authenticate_with_name: "BigBertha", password: "BigBertha", only: :destroy

	def create
    	@member = Member.find(params[:member_id])
    	@rating = @member.ratings.create(rating_params)
    	redirect_to member_path(@member)
  	end
 
 	def destroy
 		@member = Member.find(params[:member_id])
    	@rating = @member.ratings.find(params[:id])
    	@rating.destroy
    	redirect_to member_path(@member)
 	end

  	private
    	def rating_params
      		params.require(:rating).permit(:rater, :rank, :rating_comment)
    	end
end
