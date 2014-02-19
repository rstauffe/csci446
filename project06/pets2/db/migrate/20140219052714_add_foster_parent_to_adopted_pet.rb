class AddFosterParentToAdoptedPet < ActiveRecord::Migration
  def change
    add_reference :adopted_pets, :foster_parent, index: true
  end
end
