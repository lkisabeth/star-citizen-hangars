require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "citizen_of_the_stars"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_citizen
    end

    def current_citizen
      @current_citizen ||= Citizen.find(session[:id]) if session[:id]
    end
  end

end
