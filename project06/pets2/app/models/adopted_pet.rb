class AdoptedPet < ActiveRecord::Base
	belongs_to :cat
	belongs_to :selection
  
  attr_accessible :cat_id, :selection_id
end
