class AddCategoryIdToWebpage < ActiveRecord::Migration
  def change
    add_reference :webpages, :category, index: true, foreign_key: true
  end
end
