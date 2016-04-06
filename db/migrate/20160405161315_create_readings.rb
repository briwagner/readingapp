class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|

      t.references :book, null: false
      t.integer :startpage, null: false
      t.datetime :starttime, null: false
      t.integer :endpage
      t.datetime :endtime

      t.timestamps null: false
    end
  end
end
