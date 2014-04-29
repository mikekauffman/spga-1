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

  post '/dogs/create' do
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

  get '/dogs/:id' do
    dog = @dogs_table[id: params[:id]]
    erb :edit, locals: {dog: dog}
  end

  post '/dogs/edit/:id' do
    @dogs_table.where(id: params[:id]).update(
      breed: params[:dog_breed],
      color: params[:dog_color],
      size: params[:dog_size]
    )
    redirect '/dogs'
  end

  get '/dogs/delete/:id' do
    @dogs_table.where(id: params[:id]).delete
    redirect '/dogs'
  end

end