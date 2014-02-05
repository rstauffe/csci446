class Selection < ActiveRecord::Base
	has_one :adopted_pets, dependent: :destroy
end
