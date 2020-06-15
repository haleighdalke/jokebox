class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :joke_id
      t.integer :rated_by_user_id
      t.integer :score
    end
  end
end