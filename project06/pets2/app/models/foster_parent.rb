class FosterParent < ActiveRecord::Base
  validates :name, :address, :email, presence: true
end
