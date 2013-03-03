require 'sinatra'

get '/' do
  haml :index
end

get '/cv.css' do
  scss :cv
end