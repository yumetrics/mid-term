# Homepage (Root path)


# helpers do
#   def current_user
#     User.find { |u| u[:id] == session[:user_id] } if session[:user_id]
#   end
# end

get '/' do
  # session[:user_id]
  erb :index
end

get '/results' do
  @item = Item.last
  erb :result
end

post '/results' do
  @items = Item.new(
    user_id: 1,
    desired_name: params[:desired_name],
    desired_price: params[:desired_price],
    base_name: params[:base_name],
    base_price: params[:base_price]
    )

    # @items.save
    # if @items.save
    #   p "success"
    # end
    if @items.save
      redirect '/results'
    else
      @items.errors.full_messages
      erb :'index' 
    end
  end

