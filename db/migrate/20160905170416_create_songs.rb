class CreateSongs < ActiveRecord::Migration[5.0]
  def up
    create_table :songs do |t|
      t.string     :artist
      t.string     :title
      t.string     :album
      t.decimal    :bpm
      t.string     :key
      t.integer    :order
      # t.references :show, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :songs
  end
end
