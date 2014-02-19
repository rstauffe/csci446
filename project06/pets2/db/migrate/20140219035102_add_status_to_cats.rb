class AddStatusToCats < ActiveRecord::Migration
  def change
    add_column :cats, :status, :string
  end
end
