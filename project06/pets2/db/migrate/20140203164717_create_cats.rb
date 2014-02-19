class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :breed
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
