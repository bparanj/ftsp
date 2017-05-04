class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.datetime :published_at
      t.integer :author_id

      t.timestamps
    end
  end
end
