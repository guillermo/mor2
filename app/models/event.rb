class Event < ActiveRecord::Base
  serialize :dates, Array
  
  validates_presence_of(:email, :name)
  
  def validate    
     puts "XXX #{dates} #{dates.empty?} #{dates.class.name}"
     errors.add("dates", "can't be blank") if dates.reject{|d| d.blank?}.blank?
  end
end
