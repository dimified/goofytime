# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :first_name
			t.string :last_name
			t.string :email
			t.string :password_hash
			t.string :password_salt

      t.timestamps
    end
  end
end
