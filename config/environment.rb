require 'bundler'
Bundler.require

require_all 'models'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/jokebox.db"
)


ActiveRecord::Base.logger = nil