class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

      t.string :title, null: false
      t.integer :pagecount
      t.string :description
      t.string :imageURL
      t.references :user

      t.timestamps null: false
    end
  end
end
