require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:links)
  end

end
