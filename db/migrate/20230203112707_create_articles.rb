class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :createdOn
      t.string :category
      t.text :body
      t.integer :pages
      t.timestamps
    end
  end
end
