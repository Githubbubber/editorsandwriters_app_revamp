class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string  :acct_type,        limit: 1
      t.string  :first_name,       limit: 20
      t.string  :last_name,        limit: 20
      t.string  :alter_ego,        limit: 20
      t.string  :password_digest,  limit: 20
      t.string  :email
      t.string  :tagline,          limit: 160
      t.text    :aboutme,          limit: 320
      t.string  :avatar
      t.string  :location
      t.string  :fav_style_manual
      t.string  :education
      t.string  :fav_advice,       limit: 160

      t.timestamps
    end
    add_index :members, :alter_ego, unique: true
    add_index :members, :email, unique: true
  end
end