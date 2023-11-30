class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.references :band, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, default: false

      t.timestamps
    end
    
    add_index :albums, [:title, :band_id]
  end
end
