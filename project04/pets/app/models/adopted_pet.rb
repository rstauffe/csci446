class AdoptedPet < ActiveRecord::Base
	belongs_to :cat
	belongs_to :selection
end
