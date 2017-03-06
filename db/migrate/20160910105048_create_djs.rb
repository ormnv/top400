class CreateDjs < ActiveRecord::Migration[5.0]
  def up
    create_table :djs do |t|
      t.string :name
      t.string :string
      t.timestamps
    end
     add_index :djs, [:name], :unique => true
  end

  def down
   	drop_table :djs
  end
end
