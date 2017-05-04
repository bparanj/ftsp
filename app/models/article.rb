class Article < ApplicationRecord
  belongs_to :author
  has_many :comments

  include PgSearch
  pg_search_scope :search, 
    against: [:name, :content],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {author: :name, comments: [:name, :content]},
    ignoring: :accents

  def self.text_search(query)
    if query.present?
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery('#{ActionController::Base.helpers.sanitize(query)}'))
      RANK
      where("to_tsvector('english', name) @@ :q or to_tsvector('english', content) @@ :q", q: query).order("#{rank} desc")
    else
      where(nil)
    end
  end

end

