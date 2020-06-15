class CreateJokes < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.string :joke
      t.integer :created_by_user_id
      t.integer :topic_ic
    end
  end
end