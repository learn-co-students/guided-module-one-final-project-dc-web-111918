class Category < ActiveRecord::Base
  has_many :categories_translations
  has_many :translations, through: :categories_translations
end
