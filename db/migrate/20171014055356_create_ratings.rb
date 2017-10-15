class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string 		:rater
      t.integer 	:rank
      t.references 	:member, foreign_key: true

      t.timestamps
    end
  end
end
