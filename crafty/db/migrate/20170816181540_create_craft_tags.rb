class CreateCraftTags < ActiveRecord::Migration[5.0]
  def change
    create_table :craft_tags do |t|
      t.integer :craft_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
