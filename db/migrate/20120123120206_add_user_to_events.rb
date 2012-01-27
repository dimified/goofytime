# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class AddUserToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :user_id, :integer
  end
end
