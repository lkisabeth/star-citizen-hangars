require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "citizen_of_the_stars"
  end

  get '/' do
    if !logged_in?
      redirect to '/login'
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!current_citizen
    end

    def current_citizen
      @current_citizen ||= Citizen.find(session[:user_id]) if session[:user_id]
    end

    def authenticate_user
      redirect_to '/login' if !logged_in?
    end
  end

end
