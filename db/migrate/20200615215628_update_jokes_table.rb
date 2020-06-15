class UpdateJokesTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :jokes, :topic_ic, :topic_id
  end
end