class AddPictureUrlToCrafts < ActiveRecord::Migration[5.0]
  def change
    add_column :crafts, :picture_url, :string
  end
end
