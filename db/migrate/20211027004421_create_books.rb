class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.date :published_at
      t.string :country

      t.timestamps
    end
  end
end
