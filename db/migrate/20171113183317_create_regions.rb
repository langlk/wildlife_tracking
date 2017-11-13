class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
