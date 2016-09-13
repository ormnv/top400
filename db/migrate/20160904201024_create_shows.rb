class CreateShows < ActiveRecord::Migration[5.0]
  def up
    create_table :shows do |t|
      t.string   :title
      # t.integer  :dj_id
      t.date     :date
      t.string   :file
      t.text     :description
      t.timestamps
    end
  end

   def down
   	drop_table :shows
  end
end
