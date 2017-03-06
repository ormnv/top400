class CreateShowSongs < ActiveRecord::Migration[5.0]
  def up
    create_table :show_songs do |t|
      t.integer :dj_id
      t.integer	:show_id
      t.integer :song_id
      t.integer :track_order 
      t.timestamps
    end

    add_index :show_songs, [:dj_id, :show_id, :song_id, :track_order], unique: true, name: 'show_songs_index'
  end

   def down
   	drop_table :show_songs
  end
end