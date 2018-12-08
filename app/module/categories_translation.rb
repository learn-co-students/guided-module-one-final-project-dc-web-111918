class CategoriesTranslation < ActiveRecord::Base
  belongs_to :translation
  belongs_to :category
end
