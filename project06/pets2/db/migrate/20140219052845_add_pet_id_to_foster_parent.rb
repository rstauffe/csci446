class AddPetIdToFosterParent < ActiveRecord::Migration
  def change
    add_column :foster_parents, :pet_id, :integer
  end
end
