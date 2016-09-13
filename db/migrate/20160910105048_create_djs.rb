class CreateDjs < ActiveRecord::Migration[5.0]
  def change
    create_table :djs do |t|
      t.string :name
      t.string :string
      t.timestamps
    end
  end
end
