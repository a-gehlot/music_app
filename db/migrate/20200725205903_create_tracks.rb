class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.text :lyrics
      t.integer :ord, null: false
      t.boolean :bonus, default: false, null: false
      t.integer :album_id, null: false
    end
    add_index :tracks, :album_id
  end
end
