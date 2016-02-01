# Homepage (Root path)


helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  session[:user_id]
  @all_items = Item.all.where(user_id: session[:user_id]).order(created_at: :desc).limit(10)
  erb :index
end

get '/results' do
  @item = Item.last
  if @item.googlecoffee
    redirect '/coffee'
  else
    erb :result
  end
end

get '/results/:id' do
  @items = Item.where(id: params[:id])
    erb :'results/old'
end

get '/coffee' do
  erb :coffee
end

get '/login' do
  erb :login
end

# post '/login' do
#   @user = User.find_by(
#     name: params[:name]
#     )
#   if @user
#     session[:user_id] = @user.id
#     redirect '/'
#   else
#     erb :'login'
#   end
# end

post '/log_in' do
  user = User.find { |u| u[:name] == params[:name] }
  if user && user[:password] == params[:password]
    session[:user_id] = user[:id] 
  end
  redirect '/'
end

get '/log_out' do
  session[:user_id] = nil
  session.clear
  redirect '/'
end

post '/results' do
  @items = Item.new(
    user_id: current_user.id,
    desired_name: params[:desired_name],
    desired_price: params[:desired_price],
    base_name: params[:base_name],
    base_price: params[:base_price]
    )

    if @items.save
      redirect '/results'
    else
      @items.errors.full_messages
      erb :'index'
    end
  end


