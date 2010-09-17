# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'toto'
#run LSite::Application

#point to your rails apps /public directory
use Rack::Static, :urls => ['/stylesheets', '/javascripts', '/images', '/favicon.ico'], :root => 'public'

use Rack::ShowExceptions
use Rack::CommonLogger

#run the toto application
toto = Toto::Server.new do
    #override the default location for the toto directories
    Toto::Paths = {
        :templates => "blogs/itblog/templates",
        :pages => "blogs/itblog/templates/pages",
        :articles => "blogs/itblog/articles"
    }

    #set your config variables here
    set :title, "IT Blog"
    set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
    set :summary,   :max => 500
    set :root, "blogs/itblog"
    if RAILS_ENV != 'production'
        set :url, "http://localhost:9292/blogs/itblog/"
    else
        set :url, "http://your-blog.heroku.com/blog/"
    end
end

#create a rack app
app = Rack::Builder.new do
    use Rack::CommonLogger

    #map requests to /blog to toto
    map '/blogs/itblog' do
        run toto
    end
    #map all the other requests to rails
    map '/' do
        if Rails.version.to_f >= 3.0
        ActionDispatch::Static
        run Rails.application
    else # Rails 2
        use Rails::Rack::Static
        run ActionController::Dispatcher.new
    end
end

end.to_app

run app
