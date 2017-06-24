class CitizensController < ApplicationController

  get '/citizens/:slug' do
    authenticate_user
    @citizen = Citizen.find_by_slug(params[:slug])
    erb :'citizens/show'
  end

  get '/citizens/:slug/edit' do
    authenticate_user
    @citizen = Citizen.find_by_slug(params[:slug])
    if @citizen == current_citizen
      erb :'citizens/edit'
    elsif
      redirect to '/'
    end
  end

  put '/citizens/:slug/edit' do
    @citizen = Citizen.find_by_slug(params[:slug])
    if logged_in? && @citizen.id == current_citizen.id
      @citizen.username = params[:username] if params[:username] != ""
      @citizen.password = params[:password] if params[:password] != ""
      @citizen.save
      redirect to "/citizens/#{@citizen.slug}"
    else
      redirect to '/'
    end
  end

  get '/signup' do
    if !logged_in?
      @citizen = Citizen.new
      erb :'citizens/new'
    else
      redirect to '/citizens/show'
    end
  end

  post '/signup' do
    @citizen = Citizen.new(params)
    if @citizen.save
      session[:user_id] = @citizen.id
      redirect to '/'
    else
      erb :'citizens/new'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'citizens/login'
    else
      redirect '/'
    end
  end

  post '/login' do
    citizen = Citizen.find_by(:username => params[:username])
    if citizen && citizen.authenticate(params[:password])
      session[:user_id] = citizen.id
      redirect "/"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    authenticate_user
    session.destroy
    redirect to '/login'
  end

end
