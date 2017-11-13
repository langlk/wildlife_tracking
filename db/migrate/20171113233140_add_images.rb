class AddImages < ActiveRecord::Migration[5.0]
  def change
    add_column :animals, :image, :string
  end
end
