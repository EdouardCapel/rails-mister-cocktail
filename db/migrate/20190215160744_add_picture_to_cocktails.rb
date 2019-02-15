class AddPictureToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :picture, :string, default: "https://images.unsplash.com/photo-1470337458703-46ad1756a187?", null: false
  end
end
