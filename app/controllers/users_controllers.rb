get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  @user=User.new(params[:user])
  p "*" * 50
  p params[:user]
  p "*" * 50
  if @user.save #if validations pass
    session[:id]=@user.id #a simple cookie
    redirect "/users/#{@user.id}" #redirect to personalized page
  else
    @errors=@user.errors.full_messages #retrieves errors from active record validations
    erb :"/users/new"
  end
end
