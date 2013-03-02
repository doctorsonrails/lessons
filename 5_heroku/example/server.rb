require 'sinatra'

get '/' do
  erb :index
end

get '/hello' do
  "Hello world, it's #{Time.now} at the server!"
end