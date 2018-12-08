class Translation < ActiveRecord::Base
  has_many :categories_translations
  has_many :categories, through: :categories_translations

  # def self.languages_list
  #   list = self.column_names
  #   list.delete("id")
  #   list.map {|language| language.capitalize}
  # end

end
