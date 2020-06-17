class CreateJokesWithSetupAndPunchline < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.string :setup
      t.string :punchline
      t.integer :topic_id
      t.integer :user_id
    end
  end
end
