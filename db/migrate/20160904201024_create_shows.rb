class CreateShows < ActiveRecord::Migration[5.0]
  def up
    create_table :shows do |t|
      t.string   :title
      t.date     :date
      t.string   :image
      t.string   :link_to_soundcloud
      t.string   :link_to_newtown_radio
      t.text     :description
      t.timestamps
    end
  end

   def down
   	drop_table :shows
  end
end
