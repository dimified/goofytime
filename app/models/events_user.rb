# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class EventsUser < ActiveRecord::Base
  scope :attending_count, lambda { |event_id| { :conditions => ["event_id = ?", event_id] } }
end