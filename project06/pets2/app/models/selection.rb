class Selection < ActiveRecord::Base
	has_many :adopted_pets, dependent: :destroy
  
  def add_cat(cat_id)
    current_cat = adopted_pets.build(cat_id: cat_id)
    current_cat
  end
end
