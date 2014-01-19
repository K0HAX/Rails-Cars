class Car < ActiveRecord::Base
   has_many :maintenances
   has_many :refuels
end
