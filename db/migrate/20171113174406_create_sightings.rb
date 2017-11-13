class CreateSightings < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.column :animal_id, :integer
      t.column :date_sighted, :datetime
      t.column :location, :string

      t.timestamps
    end
  end
end
