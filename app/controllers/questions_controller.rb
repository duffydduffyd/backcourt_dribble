
get '/sports' do
  @sports = Sport.all #define instance variable for view
  erb :'sports/index' #show all sports view (index)
end


get '/sports/:id' do
  #gets params from url
  @sport = Sport.find(params[:id]) #define instance variable for view
  erb :'sports/show' #show single sport view
end

# display a list of all subcategory for a specific category
# why isn't there a @category.subcategory.all
get '/category/:category_id/subcategory' do
  @category = Category.find(params[:category_id])
  @subcategory = @category.subcategory
  erb :'subcategory/index'
end

# display a specific subcategory belonging to a specific category
get '/category/:category_id/subcategory/:id' do
  @category = Category.find(params[:category_id])
  @subcategory = @category.subcategory.find(params[:id])
  erb :'subcategory/show'
end

# display question
# get "/questions/:id" do
#   erb :"/users/show"
# end
