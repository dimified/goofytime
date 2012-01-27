# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class AddCityToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :city, :string
  end
end
