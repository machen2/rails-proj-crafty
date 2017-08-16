class CreateCrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :crafts do |t|
      t.string :title
      t.string :difficulty
      t.string :description
      t.string :instructions

      t.timestamps
    end
  end
end
