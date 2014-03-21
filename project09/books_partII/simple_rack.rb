require 'sinatra'
require 'data_mapper'

require_relative 'book'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/books.sqlite3.db")

get '/' do
  erb :form
end

post '/list' do
  @books = Book.all(:order => params[:sort])
  "Books length: #{@books.length}"
  erb :list
end