class CreateArticlesRolesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_roles, id: false do |t|
      t.belongs_to :article
      t.belongs_to :role
    end
  end
end
