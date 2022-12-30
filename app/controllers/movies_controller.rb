class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    conn = Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.params["api_key"] = ENV["movie_api_key"]
    end

    if params.include?(:search)
      response = conn.get("search/movie?query=#{params[:search]}")
      json = JSON.parse(response.body, symbolize_names: true)
      @movies = json[:results][0..19]
    else
      response = conn.get("movie/top_rated")
      json = JSON.parse(response.body, symbolize_names: true)
      @movies = json[:results][0..19]
    end
  end

  def show
    movie_id = params[:id]
    conn = Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end

    response = conn.get("movie/#{movie_id}")

    @movie = JSON.parse(response.body, symbolize_names: true)
    @user = User.find(params[:user_id])
  end

end
