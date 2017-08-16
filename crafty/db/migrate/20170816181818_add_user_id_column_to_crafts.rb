class AddUserIdColumnToCrafts < ActiveRecord::Migration[5.0]
  def change
    add_column :crafts, :user_id, :integer
  end
end
