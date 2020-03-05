class ChangeImageToUseUrls < ActiveRecord::Migration
  def change
    rename_column :products, :image, :img_url
  end
end
