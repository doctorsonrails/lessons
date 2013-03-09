require 'sinatra'

get '/' do
  haml :index
end

get '/hello' do
  "Hello world, it's #{Time.now} at the server!"
end