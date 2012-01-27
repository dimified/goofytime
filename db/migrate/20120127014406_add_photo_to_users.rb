# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class AddPhotoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :photo_file_name, :string
  	add_column :users, :photo_content_type, :string
  	add_column :users, :photo_file_size, :integer
  	add_column :users, :photo_updated_at, :datetime
  end
end
