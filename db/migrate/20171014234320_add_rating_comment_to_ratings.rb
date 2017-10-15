class AddRatingCommentToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :rating_comment, :text
  end
end
