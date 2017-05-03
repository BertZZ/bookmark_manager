ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_manager_setup'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
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
    erb :'links/index'
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
end
