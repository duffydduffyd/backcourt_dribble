#get login page, reading
get "/sessions/new" do
  erb :"/sessions/new"
end

# authentication if true
post "/sessions" do
  #@user = User.find_by(params[:user][:email])
  @user = User.find_by(email:params[:user][:email]) #finding by the email and see if any users match the email entered, two levels deep in user hash. {user {username: tom, password: tomtom}}
  # p "*" *  80
  # p "I am here in the sessions controller"
  # p params[:user]
  # p @user.authenticate(params[:user][:password])
  # p "*" *  80
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    # one error, users.full_messages
    @errors = ["Please input valid user information"]
    # @errors = @users.errors.full_messages, this would say what the problem is but it's fraud prevention. #@users.errors is calling the errors array, hash that is created by active record
    erb :"/sessions/new"
  end
end

# sign out
delete "/sessions" do
  #session[:id].destroy
  session[:id] = nil
  redirect "/"
end
