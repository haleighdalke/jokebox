class UpdateColumnNamesOnJokesAndRatingsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :jokes, :created_by_user_id, :user_id 
    rename_column :ratings, :rated_by_user_id, :user_id
  end
end
