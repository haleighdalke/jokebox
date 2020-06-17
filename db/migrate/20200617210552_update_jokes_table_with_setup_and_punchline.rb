class UpdateJokesTableWithSetupAndPunchline < ActiveRecord::Migration[5.2]
  def change
    drop_table :jokes
  end
end
