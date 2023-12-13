class Article < ApplicationRecord
  has_and_belongs_to_many :roles, join_table: 'articles_roles'
end
