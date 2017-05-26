class CitizensController < ApplicationController

  get '/citizens/:slug' do
    @citizen = Citizen.find_by_slug(params[:slug])
    erb :'citizens/show'
  end

  get '/citizens/:slug/edit' do
    @citizen = Citizen.find_by_slug(params[:slug])
    erb :'citizens/edit'
  end

  get '/signup' do
    if !logged_in?
      erb :'citizens/new'
    else
      redirect to '/citizens/show'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @citizen = Citizen.new(:username => params[:username],  :password => params[:password])
      @citizen.save
      session[:id] = @citizen.id
      redirect to '/ships'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'citizens/login'
    else
      redirect '/ships'
    end
  end

  post '/login' do
    citizen = Citizen.find_by(:username => params[:username])
    if citizen && citizen.authenticate(params[:password])
      session[:id] = citizen.id
      redirect "/ships"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
