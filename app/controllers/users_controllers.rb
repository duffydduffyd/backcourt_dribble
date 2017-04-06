get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  @user = User.new(params[:user]) # key called user or pass in params directly
  # p "*" * 50 # p's out {params: {user: user }
  # p params[:user]
  # p "*" * 50
  if @user.save #if validations pass
    p session
    session[:id] = @user.id #a simple cookie in browser
    p "💩 " * 30
    p session
    p "💩 " * 30
    redirect "/users/#{@user.id}" #redirect to personalized page, their show page
  else
    @errors = @user.errors.full_messages #retrieves errors from active record validations
    erb :"/users/new"
  end
end

# make sure at the bottom
get '/users/:id' do #show action
  @user = User.find(params[:id])
  erb :"/users/show" #takes to personalized show page
end
