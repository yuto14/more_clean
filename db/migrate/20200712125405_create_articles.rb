class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      
      t.references :user, null: false
      t.string :title,    null: false
      t.text :text,       null: false
      t.string :article_image_id

      t.timestamps
    end
  end
end
