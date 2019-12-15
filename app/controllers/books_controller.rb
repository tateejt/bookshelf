class BooksController < ApplicationController

    get '/books' do 
        erb :'books/book'
    end
    
    post '/books' do
      @book = Book.create(params[:book])
  
      if params["name"]
        @book.user = User.create(name: params["name"])
      end
  
      @book.save
  
      redirect to "books/#{@book.id}"
    end

    get '/books/new' do 
        if !logged_in?
            redirect '/welcome'
        else
            redirect '/books'
        end
    end
    
    get '/books/:id' do
      erb :'books/show'
    end

    get '/books/:id/edit' do 
        if !logged_in?
            redirect '/welcome'
        else
            book = current_user.books.find(params[:id])
            "An edit books form #{current_user.id} is editing #{book.id}"
        end
    end

end
