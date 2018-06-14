require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :"../views/super_hero"
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:hero].each do |hero|
        Hero.new(hero)
      end

      @hero = Hero.all

      erb :"../views/team"
    end


end
