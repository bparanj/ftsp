Setup

rails g model article name content:text published_at:datetime author_id:integer
rails g model author name
rails g model comment name content:text article_id:integer



