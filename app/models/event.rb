# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class Event < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
	
  validates_presence_of :title, :city, :location, :date_time, :person_limit, :on => :create
  validates_presence_of :title, :city, :location, :date_time, :person_limit, :on => :update
  
  validates :person_limit, :numericality => true
  
  validates_inclusion_of :date_time.to_s[0..9],
      :in => Time.now..2.month.from_now, 
      :message => "must be today or in the next two month"  
  
  attr_accessible :title, :city, :location, :date_time, :person_limit, :description
  
  self.per_page = 10
  
  delegate :first_name, :to => :user
  
  def owner?(user_id, event_user_id)
    if(user_id == event_user_id)
      return true  
    end  
  end
  
end