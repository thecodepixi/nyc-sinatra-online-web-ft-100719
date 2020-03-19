require 'pry'
class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @titles = Title.all 
    @landmarks = Landmark.all 
    erb :'figures/new'
  end 

  post '/figures/new' do
    @figure = Figure.create(params[:figure])

    # for title_id in params[:figure][:title_ids] do @figure.titles.push(Title.find(title_id)) end 

    # for landmark_id in params[:figure][:landmark_ids] do @figure.landmarks.push(Landmark.find(landmark_id)) end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end 

    if !params[:landmark][:name].empty? 
      landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      @figure.landmarks << landmark 
    end 

    @figure.save 

    redirect "/figures/#{@figure.id}"
  end 

  get '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])

    erb :'figures/show'
  end 

  get '/figures' do 
    @figures = Figure.all 

    erb :'figures/index'
  end 

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @titles = Title.all 
    @landmarks = Landmark.all 

    erb :'figures/edit'
  end 

  patch '/figures/:id/edit' do 
    figure = Figure.find(params[:id])
    figure.update(params[:figure])

    if !params[:title][:name].empty?
      figure.titles << Title.create(name: params[:title][:name])
    end 

    if !params[:landmark][:name].empty? 
      landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      figure.landmarks << landmark 
    end 

    figure.save 

    redirect "/figures/#{figure.id}"
  end 

end
