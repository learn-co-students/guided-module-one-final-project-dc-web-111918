class Event < ActiveRecord::Base
  belongs_to :museum
  belongs_to :neighborhood
end
