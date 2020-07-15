class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|

      t.references :user,     null: false
      t.references :article,  null: false
      t.string :comment,      null: false

      t.timestamps
    end
  end
end
