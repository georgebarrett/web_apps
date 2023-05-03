# file: app.rb
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  # get '/hello' do
  #   name = params[:name]
 
  #   return "Hello #{name}"
  # end

  # get "/hello" do
  #   name = params[:name]
  #   return "Hello #{name}"
  # end

  get "/names" do
    return "Julia, Mary, Karim"
  end

  post '/submit' do
    artist_name = params[:artist_name]
    the_number = params[:the_number]

    return "Thanks #{artist_name}, you sent this message: #{the_number}"
  end

  post '/sort-names' do
    names = params[:names]

    return names.split(", ").sort.join(", ")
  end

  get '/hello' do
    return erb(:hello)
  end

end