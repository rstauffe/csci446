class Cat < ActiveRecord::Base
  STATUS_TYPES = ['Available', 'Fostered']
	validates :name, :breed, :description, :image_url, :status, presence: true
	validates :description, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
  validates :status, inclusion: STATUS_TYPES
	
	has_many :adopted_pets
	
	before_destroy :ensure_not_referenced_by_any_adopted_pet
	
  def self.latest
    Cat.order(:updated_at).last
  end
  
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
