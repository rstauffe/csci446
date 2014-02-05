class CreateAdoptedPets < ActiveRecord::Migration
  def change
    create_table :adopted_pets do |t|
      t.integer :pet_id
      t.integer :selection_id

      t.timestamps
    end
  end
end
