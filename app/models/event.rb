class Event < ActiveRecord::Base
  serialize :dates, Array
end
