class Car < ActiveRecord::Base
   belongs_to :users
   has_many :maintenances
   has_many :refuels
end
