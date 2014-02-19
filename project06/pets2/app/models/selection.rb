class Selection < ActiveRecord::Base
	has_many :adopted_pets, dependent: :destroy
end
