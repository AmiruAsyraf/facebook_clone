get '/signup' do
erb :signup
end


get '/login' do
erb :login
end

post '/signup/user' do
  @user = User.create(params[:post])
  session[:id] = @user.id

  redirect to ('/post/' + @user.name)
end


post '/login/user' do
  @user = User.authenticate(params[:post])

  if @user
    session[:id] = @user.id
    p session[:id]
    redirect to('/post/' + @user.name)
  else
    redirect to ("/")
  end

end
