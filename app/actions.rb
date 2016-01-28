# Homepage (Root path)
# require_relative 'views/_constants.rb'

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
  erb :result
end

post '/' do
  @items = Item.new(
    user_id: 1,
    desired_name: params[:desired_name],
    desired_price: params[:desired_price],
    base_name: params[:base_name],
    base_price: params[:base_price]
    )

    @items.save
    if @items.save
      p "success"
    end
    # if @items.save
    #   redirect '/results'
    # else
    #   redirect '/'
    # end
  end

