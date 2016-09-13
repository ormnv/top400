class CreateShowSongs < ActiveRecord::Migration[5.0]
  def up
    create_table :show_songs do |t|
      t.integer :song_id
      t.integer	:show_id
      t.timestamps
    end
  end

   def down
   	drop_table :shows_songs
  end
end