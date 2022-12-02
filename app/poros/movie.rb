class Movie
  attr_reader :title,
              :image_path,
              :vote
  def initialize(attributes)
     @title = attributes[:title]
     @image_path = attributes[:image_path]
     @vote = attributes[:vote]
  end
end
