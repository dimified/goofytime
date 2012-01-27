class Event < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :users
	
  validates_presence_of :title, :city, :location, :date_time, :person_limit, :on => :create
  validates_presence_of :title, :city, :location, :date_time, :person_limit, :on => :update
  
  validates :person_limit, :numericality => true
  
  validates_inclusion_of :date_time.to_s[0..9],
      :in => Time.now..2.month.from_now, 
      :message => "must be today or in the next two month"  
  
  attr_accessible :title, :city, :location, :date_time, :person_limit, :description
  
  self.per_page = 1
  
end
