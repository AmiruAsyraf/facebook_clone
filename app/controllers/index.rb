enable :sessions

get '/' do
  session.clear
  erb :index
end

