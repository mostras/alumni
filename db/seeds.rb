# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Diploma.destroy_all
puts 'Diplomas destruction OK'
Sector.destroy_all
puts 'Sector destruction OK'
User.destroy_all
puts 'Users destruction OK'
Company.destroy_all
puts 'Company destruction OK'
School.destroy_all
puts 'School destruction OK'


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

sectors = ['Administration publique','Administration scolaire et universitaire','Aéronautique et aérospatiale','Affaires étrangères','Agriculture','Agro-alimentaire','Architecture et urbanisme','Armée','Articles de luxe et bijouterie','Articles de sport','Arts','Arts et artisanat','Arts vivants','Associations et organisations sociales et syndicales','Assurances','Automatismes industriels','Avocats','Banques','Bibliothèques','Biens de consommation',"Biens et équipements pour les entreprises","Biotechnologie","Bureau exécutif","Capital-risque et fonds LBO","Centres de recherches","Chantiers navals","Chimie","Collectivités publiques et territoriales","Commerce de détail","Commerce de gros","Commerce et développement international","Compagnie aérienne/Aviation","Comptabilité","Confection et mode","Conseil en management","Construction","Contenus rédactionnels","Cosmétiques","Défense et espace","Design","Design graphique","Divertissements","Édition","Élaboration de programmes","Élevage","Emballages et conteneurs","Enseignement supérieur","Entreposage, stockage","Environnement et énergies renouvelables","Équipements collectifs","Équipements et services de loisirs","Équipements ferroviaires","Équipements médicaux","Études/recherche","Études de marché","Externalisation/délocalisation","Films d’animation","Formation à distance","Formation primaire/secondaire","Formation professionnelle et coaching","Génie civil","Gestion de portefeuilles","Gestion des associations et fondations ","Grande distribution","Hôpitaux et centres de soins","Hôtellerie et hébergement","Humanitaire","Immobilier","Immobilier commercial","Import et export","Imprimerie, reproduction","Industrie automobile","Industrie bois et papiers","Industrie composants électriques/électroniques","Industrie du cinéma","Industrie pharmaceutique","Industrie textile","Ingénierie du mécénat","Ingénierie mécanique ou industrielle","Institutions judiciaires","Institutions religieuses","Internet","Jeux d’argent et casinos","Jeux électroniques","Logiciels informatiques","Logistique et chaîne d’approvisionnement","Loisirs, voyages et tourisme","Machines et équipements","Marchés des capitaux","Marketing et publicité","Matériaux de construction","Matériel informatique","Matières premières","Médecines alternatives","Médias en ligne","Médias radio et télédiffusés","Messageries et fret","Meubles","Mines et métaux","Musées et institutions culturelles","Musique","Nanotechnologies","Organisation d’événements","Parti politique","Pêche","Pétrole et énergie","Photographie","Plastiques","Police/gendarmerie","Politiques publiques","Presse écrite","Production audiovisuelle","Produits électroniques grand public","Professions médicales","Recrutement","Règlement extrajudiciaire de conflits","Relations publiques et communication","Réseaux informatiques","Ressources humaines","Restaurants","Restauration collective","Santé, forme et bien-être","Secteur laitier","Secteur médico-psychologique","Sécurité civile","Sécurité et enquêtes","Sécurité informatique et des réseaux","Semi-conducteurs","Services à la personne","Services aux consommateurs","Services d’information","Services d’investissement","Services financiers","Services juridiques","Services pour l’environnement","Sports","Tabac","Technologies et services de l’information","Technologies sans fil","Télécommunications","Traduction et adaptation","Transports maritimes","Transports routiers et ferroviaires","Verres, céramiques et ciments","Vétérinaire","Vins et spiritueux "]

sectors.each do |sector|
  Sector.create(name: sector)
end

puts 'Sector creation OK'


user1 = User.new(email: 'adrien-barbier@hotmail.fr', password: 'password', first_name: 'Adrien', last_name: 'Barbier', phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true)
user1.save!
user2 = User.create(email: 'romainmostras@icloud.com', password: 'password', first_name: 'Romain', last_name: 'Mostras', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true)
user2.save!

puts 'User creation OK'

company1 = Company.new(name: 'AGICAP', city: 'Lyon')
company1.save!
company2 = Company.new(name: 'Lydia', city: 'Paris')
company2.save!
company3 = Company.new(name: 'TooGoodToGo', city: 'Paris')
company3.save!
company4 = Company.new(name: 'Swile', city: 'Paris')
company4.save!
company5 = Company.new(name: 'Google', city: 'Paris')
company5.save!
company6 = Company.new(name: 'Apple', city: 'Paris')
company6.save!

puts 'Company creation OK'


work_experience1 = WorkExperience.new(title: 'Business manager', start_time: '2019', end_time: '2020', location: 'Lyon', current: true, user: user1, company: company1)
work_experience1.save!
work_experience2 = WorkExperience.new(title: 'Commercial', start_time: '2016', end_time: '2019', location: 'Lyon', current: false, user: user1, company: company2)
work_experience2.save!
work_experience3 = WorkExperience.new(title: 'Ingénieur', start_time: '2014', end_time: '2016', location: 'Lyon', current: true, user: user1, company: company3)
work_experience3.save!
work_experience4 = WorkExperience.new(title: 'Marketing Manager', start_time: '2019', end_time: '2020', location: 'Lyon', current: true, user: user2, company: company4)
work_experience4.save!
work_experience5 = WorkExperience.new(title: 'Growth Marketing Manager', start_time: '2014', end_time: '2019', location: 'Lyon', current: true, user: user2, company: company5)
work_experience5.save!
work_experience6 = WorkExperience.new(title: 'Sales Representative', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user2, company: company6)
work_experience6.save!

puts 'Work experience creation OK'


school1 = School.new(name: 'HEC', city: 'Lyon')
school1.save!
school2 = School.new(name: 'Polytechnique', city: 'Paris')
school2.save!
school3 = School.new(name: 'ENSMM', city: 'Paris')
school3.save!
school4 = School.new(name: 'GEM', city: 'Paris')
school4.save!
school5 = School.new(name: 'Chartreux', city: 'Paris')
school5.save!
school6 = School.new(name: 'Ecole des mines', city: 'Paris')
school6.save!

puts 'School creation OK'

school_experience1 = SchoolExperience.new(title: 'Master in management', start_time: '2019', end_time: '2020', location: 'Lyon', current: true, user: user1, school: school1)
school_experience1.save!
school_experience2 = SchoolExperience.new(title: 'DUT Marketing', start_time: '2016', end_time: '2019', location: 'Lyon', current: false, user: user1, school: school2)
school_experience2.save!
school_experience3 = SchoolExperience.new(title: "Diplôme d'ingénieur", start_time: '2014', end_time: '2016', location: 'Lyon', current: true, user: user1, school: school3)
school_experience3.save!
school_experience4 = SchoolExperience.new(title: 'BTS Marketing', start_time: '2019', end_time: '2020', location: 'Lyon', current: true, user: user2, school: school4)
school_experience4.save!
school_experience5 = SchoolExperience.new(title: 'BAC STI', start_time: '2014', end_time: '2019', location: 'Lyon', current: true, user: user2, school: school5)
school_experience5.save!
school_experience6 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user2, school: school6)
school_experience6.save!

puts 'SchoolExperiences creation OK'

















































































































