# make sure site doesn't break, this is now handled in the index_controller.rb
# get "/" do
#   erb :'index'
# end

# Form to create new users
get '/users/new' do
  erb :"/users/new"
end

# Post to create new user
post '/users' do
  @user = User.new(params[:user]) # key called user or pass in params directly
  # p "*" * 50 # p's out {params: {user: user }
  # p params[:user]
  # p "*" * 50
  if @user.save #if model validations pass
    p session
    session[:id] = @user.id #a simple cookie in browser
    redirect "/users/#{@user.id}" #redirect to personalized page, their show page
  else
    @errors = @user.errors.full_messages #retrieves errors, an active record method, and full_message, an active record method, from active record validations. Array because it's errors, plural,  an errors hashs.
    # if we redirect, we loose the message and instance variables
    erb :"/users/new"
  end
end

# make sure at the bottom
get '/users/:id' do #show action
  @user = User.find(params[:id])
  # this was for stack overflow
  # @questions = Question.where(user_id: current_user.id)
  erb :"users/show" #takes to personalized show page
end




# display user profile, partial to show one question
# get '/users/:id' do
#   erb: "_questions/show"
# end
