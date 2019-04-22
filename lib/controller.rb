require 'sinatra'
require 'rubygems'
require 'shotgun'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/'do
  	erb :new_gossip
  end

  post '/gossips/new/' do
  	#Gossip.new("super_author", "super_content").save
  	#ON STOCKE LES PARAMETRES AUTEUR ET CONTENU DANS DES VARIABLES
  	author = params["gossip_author"]
  	content = params["gossip_content"]
  	Gossip.new(author,content).save

  	#Pour rediriger l'user après la sauvegarde du gossip => rediriger vers la page d'acceuil
  	redirect '/'
  end

  get '/gossips/:id/' do
  	erb :show, locals: {gossip_id: Gossip.find(params["id"])}
  end

end