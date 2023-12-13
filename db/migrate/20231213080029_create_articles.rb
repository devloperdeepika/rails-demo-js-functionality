class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string "title"
      t.string "description"
      t.text "body"
      t.string "list_items"
      t.string "status"
      t.string "position"

      t.timestamps
    end
  end
end
