require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'redis'

enable :sessions
redis = Redis.new(:host => "redis")

get '/' do
  @votos_tigre = redis.get("tigre")
  @votos_bolivar = redis.get("bolivar")
  haml :home
end

post '/' do
  redis.incr params[:equipo]
  redirect '/', success: 'Gracias por participar. Puedes votar las veces que quieras.'
end

get '/version' do
  "0.2"
end
