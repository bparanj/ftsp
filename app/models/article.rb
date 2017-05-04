class Article < ApplicationRecord
  belongs_to :author
  has_many :comments

  def self.text_search(query)
    if query.present?
      where("name ilike :q or content ilike :q", q: "%#{query}%")
    else
      where(nil)
    end
  end
  
end
