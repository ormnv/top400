class CreateShows < ActiveRecord::Migration[5.0]
  def up
    create_table :shows do |t|
      t.string   :title
      t.date     :date
      t.string   :tracklist
      t.string   :link_to_soundcloud
      t.string   :link_to_newtown_radio
      t.text     :description
      t.boolean  :is_standalone, default: false 
      t.timestamps
    end
    add_index :shows, [:date, :link_to_newtown_radio], :unique => true
    add_attachment :shows, :flyer
  end

   def down
   	drop_table :shows
  end
end
