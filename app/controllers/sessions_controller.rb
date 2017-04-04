#get login page, reading
get "/sessions/new" do
  erb :"/sessions/new"
end

# authentication if true
post "/sessions" do
  @user=User.find_by(email:params[:user][:email]) #finding by the email and see if any users match the email entered
  if @user&&@user.authenticate(params[:user][:password])
    session[:id]=@user.id
    redirect "/users/#{@user.id}"
  else
    @errors=["Please input valid user information"]
    erb :"/sessions/new"
  end
end

# sign out
delete "/sessions" do
  #session[:id].destroy
  session[:id]=nil
  redirect "/"
end
