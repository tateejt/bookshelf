class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/welcome'
    end

    post '/sessions' do 
        login(params[:email], params[:password])
        redirect '/books'
    end

    get '/logout' do 
        logout!
    end
end