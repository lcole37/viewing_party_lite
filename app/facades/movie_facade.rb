class MovieFacade
  def self.movies
    # require "pry"; binding.pry
    conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
        faraday.headers['api_key'] = ENV["tmdb_api_key"]
      end

    response = conn.get("/movie/top_rated")
    json_body = response.body
    parsed_response = JSON.parse(json_body, symbolize_names: true)

    top_20 = parsed_response.map do |movie_data|
      Movie.new(movie_data)

    end
  end
end
