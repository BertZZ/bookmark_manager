ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_manager_setup'
require_relative 'models/link'
require_relative 'models/user'
require 'pry'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/links' do
    @links = Link.all
    @user = User.last.email
    @usercount = User.all.count
    erb :'links/links'
  end

  get '/tags' do
    @tags = Tag.all
    erb :'links/tags'
  end

  get '/links/new' do
    erb :'links/form'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/links'
  end

  post '/links' do
    name = params[:site_name]
    url = params[:site_url]
    link = Link.create(url: url, title: name)
    tag = params[:tag].split(', ')
    tag.each do |tagz|
      tag = Tag.first_or_create(name: tagz)
      link.tags << tag
      link.save
    end
    redirect '/links'
  end

  get '/new_user' do
    erb :'links/new_user'
  end

  post '/create_user' do
  email = params[:email]
  password = params[:password]
  user = User.first_or_create(email: email, password: password)
  redirect ('/links')
  end
end
