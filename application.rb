require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    @dogs_table = DB[:dogs]

  end

  get '/' do
    erb :index
  end

  get '/dogs/new' do
    erb :new
  end

  post '/dogs' do
    @dogs_table.insert(
      breed: params[:dog_breed],
      color: params[:dog_color],
      size: params[:dog_size]
    )
    redirect '/dogs'
  end

  get '/dogs' do
    all_dogs = @dogs_table.to_a
    erb :dogs, locals: {all_dogs: all_dogs}
  end

end