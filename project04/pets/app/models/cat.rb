class Cat < ActiveRecord::Base
	validates :name, :breed, :description, :image_url, presence: true
	validates :description, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
	
	has_one :adopted_pets
	
	before_destroy :ensure_not_referenced_by_any_adopted_pet
	
  private
  
	def ensure_not_referenced_by_any_adopted_pet
		if adopted_pets.empty?
			return true
		else
			errors.add(:base, 'Adopted pets present')
			return false
		end
	end
end
