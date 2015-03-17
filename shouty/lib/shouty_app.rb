require 'sinatra'
require_relative 'shouty'

class ShoutyApp < Sinatra::Application

  set :people, {}
  set :network, Network.new

  get '/locate' do
    person = Person.new(settings.network)
    lat = Float(params[:lat])
    long = Float(params[:long])

    person.location = Location.new(lat, long)
    setting.people[params[:name]] = person
    redirect "/name/#{params[:name]}"
  end

  get '/name/:name' do |name|

  end

end