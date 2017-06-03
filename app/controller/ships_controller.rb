class ShipsController < ApplicationController

  get '/ships' do
    if logged_in?
      @ships = Ship.all
      erb :'ships/index'
    else
      redirect to '/login'
    end
  end

  get '/ships/new' do
    if logged_in?
      erb :'ships/new'
    else
      redirect to '/login'
    end
  end

  post '/ships' do
    if params[:model] == "" || params[:manufacturer] == ""
      redirect to "/ships/new"
    else
      citizen = Citizen.find_by_id(session[:id])
      @ship = current_citizen.ships.create(model: params[:model], manufacturer: params[:manufacturer], description: params[:description], role: params[:role], production_state: params[:production_state], citizen_id: citizen.id)
      redirect to "/ships"
    end
  end

  get '/ships/:id' do
    if logged_in?
      @ship = Ship.find_by_id(params[:id])
      erb :'ships/show'
    else
      redirect to '/login'
    end
  end

  get '/ships/:id/edit' do
    if logged_in?
      @ship = Ship.find_by_id(params[:id])
      if @ship.citizen_id == current_citizen.id
       erb :'ships/edit'
      else
        redirect to '/ships'
      end
    else
      redirect to '/login'
    end
  end

  patch '/ships/:id' do
    if params[:name] == ""
      redirect to "/ships/#{params[:id]}/edit"
    else
      @ship = Ship.find_by_id(params[:id])
      @ship.name = params[:name]
      @ship.save
      redirect to "/ships/#{@ship.id}"
    end
  end

  delete '/ships/:id/delete' do
    if logged_in?
      @ship = Ship.find_by_id(params[:id])
      if @ship.citizen_id == current_citizen.id
        @ship.delete
        redirect to '/ships'
      else
        redirect to '/ships'
      end
    else
      redirect to '/login'
    end
  end

end
