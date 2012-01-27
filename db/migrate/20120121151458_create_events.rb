# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
			t.string :title
			t.text :description
			t.datetime :date_time
			t.string :location
			t.integer :person_limit
			
      t.timestamps
    end
  end
end
