require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post('/new') do
    erb(:add)
  end

  post('/links') do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end
end
