require 'csv'
class Gossip

	attr_accessor :author, :content

	def initialize(author_name, gossip_content)
		@author = author_name
		@content = gossip_content
	end

	#Méthode permettant la sauvegarde des potins dans un fichier .csv
	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]
	  	end
	end

	#Méthode me permettant d'avoir tout les potins sous forme d'un array
	#Cette méthode récupère chacune des lignes de notre CSV
	#En fait un objet Gossip avec son author et content
	#Puis ressort un array avec tous nos potins
	def self.all
  		all_gossips = []
  	  	CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  		return all_gossips
	end

	def self.find(id)
		#La méthode take permet de récupérer les id éléments de l'array
		#la méthode last permet de récupérer le dernier éléments de l'array
		CSV.read("./db/gossip.csv").take(id.to_i).last
	end

end
