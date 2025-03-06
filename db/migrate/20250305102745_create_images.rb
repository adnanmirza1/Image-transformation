class CreateImages < ActiveRecord::Migration[7.2]
  def change
    create_table :images do |t|
      t.string :name
      t.text :file_data

      t.timestamps
    end
  end
end
