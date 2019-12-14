class UsersController < ApplicationController
    get '/signup' do 
        erb :"users/new"
    end
    
    get '/users/new' do
    @books = Book.all
    erb :'/users/new'
  end

    post '/users' do 
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/welcome'
        else 
            erb :"/new"
        end
    end
end