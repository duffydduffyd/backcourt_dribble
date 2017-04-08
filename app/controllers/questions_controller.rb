# display question
get "/questions/:id" do
  erb :"/users/show"
end

# eventually this route will allow someone to add a question to the database
# get "/questions/new" do
#   erb: :"/questions/new"
# end
