# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Diploma.destroy_all
puts 'Diplomas destruction OK'

bac = ['BAC']
bac.each do |diploma|
  Diploma.create(name: diploma, color: 'red')
end

prepa = ['PREPA ATS',
          'PREPA IEP/DROIT',
          'PREPA BL',
          'PREPA ECE',
          'PREPA ECS',
          'PREPA CPE/PC',
          'PREPA CPE/PSI'
          ]
prepa.each do |diploma|
  Diploma.create(name: diploma, color: 'yellow')
end

cpe = ['BACHELOR ICS-CPE',
        'BTS SIO',
        'MASTER ICS-CPE'
      ]
cpe.each do |diploma|
  Diploma.create(name: diploma, color: 'blue')
end

compta = ['DSCG',
            'BTS CG',
            'DSCG FSE',
            'DCG'
          ]
compta.each do |diploma|
  Diploma.create(name: diploma, color: 'green')
end

anciens = ['BTS IG',
            'BTS I',
            'DPECF',
            'DECF'
          ]
anciens.each do |diploma|
  Diploma.create(name: diploma, color: 'grey')
end

puts 'Diplomas creation OK'


Sector.destroy_all

sectors = ['Administration publique','Administration scolaire et universitaire','Aéronautique et aérospatiale','Affaires étrangères','Agriculture','Agro-alimentaire','Architecture et urbanisme','Armée','Articles de luxe et bijouterie','Articles de sport','Arts','Arts et artisanat','Arts vivants','Associations et organisations sociales et syndicales','Assurances','Automatismes industriels','Avocats','Banques','Bibliothèques','Biens de consommation',"Biens et équipements pour les entreprises","Biotechnologie","Bureau exécutif","Capital-risque et fonds LBO","Centres de recherches","Chantiers navals","Chimie","Collectivités publiques et territoriales","Commerce de détail","Commerce de gros","Commerce et développement international","Compagnie aérienne/Aviation","Comptabilité","Confection et mode","Conseil en management","Construction","Contenus rédactionnels","Cosmétiques","Défense et espace","Design","Design graphique","Divertissements","Édition","Élaboration de programmes","Élevage","Emballages et conteneurs","Enseignement supérieur","Entreposage, stockage","Environnement et énergies renouvelables","Équipements collectifs","Équipements et services de loisirs","Équipements ferroviaires","Équipements médicaux","Études/recherche","Études de marché","Externalisation/délocalisation","Films d’animation","Formation à distance","Formation primaire/secondaire","Formation professionnelle et coaching","Génie civil","Gestion de portefeuilles","Gestion des associations et fondations ","Grande distribution","Hôpitaux et centres de soins","Hôtellerie et hébergement","Humanitaire","Immobilier","Immobilier commercial","Import et export","Imprimerie, reproduction","Industrie automobile","Industrie bois et papiers","Industrie composants électriques/électroniques","Industrie du cinéma","Industrie pharmaceutique","Industrie textile","Ingénierie du mécénat","Ingénierie mécanique ou industrielle","Institutions judiciaires","Institutions religieuses","Internet","Jeux d’argent et casinos","Jeux électroniques","Logiciels informatiques","Logistique et chaîne d’approvisionnement","Loisirs, voyages et tourisme","Machines et équipements","Marchés des capitaux","Marketing et publicité","Matériaux de construction","Matériel informatique","Matières premières","Médecines alternatives","Médias en ligne","Médias radio et télédiffusés","Messageries et fret","Meubles","Mines et métaux","Musées et institutions culturelles","Musique","Nanotechnologies","Organisation d’événements","Parti politique","Pêche","Pétrole et énergie","Photographie","Plastiques","Police/gendarmerie","Politiques publiques","Presse écrite","Production audiovisuelle","Produits électroniques grand public","Professions médicales","Recrutement","Règlement extrajudiciaire de conflits","Relations publiques et communication","Réseaux informatiques","Ressources humaines","Restaurants","Restauration collective","Santé, forme et bien-être","Secteur laitier","Secteur médico-psychologique","Sécurité civile","Sécurité et enquêtes","Sécurité informatique et des réseaux","Semi-conducteurs","Services à la personne","Services aux consommateurs","Services d’information","Services d’investissement","Services financiers","Services juridiques","Services pour l’environnement","Sports","Tabac","Technologies et services de l’information","Technologies sans fil","Télécommunications","Traduction et adaptation","Transports maritimes","Transports routiers et ferroviaires","Verres, céramiques et ciments","Vétérinaire","Vins et spiritueux "]

sectors.each do |sector|
  Sector.create(name: sector)
end



























































































































