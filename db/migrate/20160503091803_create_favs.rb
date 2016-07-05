class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :webpage, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
