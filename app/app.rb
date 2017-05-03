ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_manager_setup'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/form'
  end

  post '/links' do
    name = params[:site_name]
    url = params[:site_url]
    tag = params[:tag]
    link = Link.create(url: url, title: name)
    tag = Tag.first_or_create(tag: tag)
    link.tags << tag
    link.save
    redirect '/links'
  end
end
