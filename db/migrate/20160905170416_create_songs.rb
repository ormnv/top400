class CreateSongs < ActiveRecord::Migration[5.0]
  def up
    create_table :songs do |t|
      t.string     :artist
      t.string     :title
      t.string     :album
      t.decimal    :bpm
      t.string     :key
      t.integer    :play_count, default: 0
      t.timestamps
    end
    add_index :songs, [:artist, :title, :album, :bpm, :key], :unique => true
  end

  def down
    drop_table :songs
  end
end
