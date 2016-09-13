class CreateDjShows < ActiveRecord::Migration[5.0]
  def up
    create_table :dj_shows do |t|
      t.integer :dj_id
      t.integer	:show_id
      t.timestamps
    end
  end

   def down
   	drop_table :dj_shows
  end
end