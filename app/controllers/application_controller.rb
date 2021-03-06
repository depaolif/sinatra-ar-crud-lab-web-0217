require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
  	#
  end

  get '/posts/new' do
  	erb :new
  end

  post '/posts' do
  	Post.create(params)
  	@posts = Post.all
  	erb :index
  end

  get '/posts' do
  	@posts = Post.all
  	erb :index
  end

  get '/posts/:id' do
  	@post = Post.find_by(id: params[:id])
  	erb :show
  end

  get '/posts/:id/edit' do
  	@post = Post.find_by(id: params[:id])
  	erb :edit
  end

  patch '/posts/:id' do
  	@post = Post.find_by(id: params[:id])
  	@post.name = params[:name]
  	@post.content = params[:content]
  	@post.save
  	erb :show
  end

  delete '/posts/:id/delete' do
  	@post = Post.find_by(id: params[:id])
  	@deleted_name = @post.name
  	@post.delete
  	erb :deleted
  end
end