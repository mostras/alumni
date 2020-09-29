require 'faker'


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


user1 = User.create!(email: 'adrien-barbier@hotmail.fr', password: 'password', first_name: 'Adrien', last_name: 'Barbier', phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false)
user2 = User.create(email: 'romainmostras@icloud.com', password: 'password', first_name: 'Romain', last_name: 'Mostras', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: true)
user3 = User.create(email: 'jean@gmail.com', password: 'password', first_name: 'Jean', last_name: 'Paluche', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user4 = User.create(email: 'kevin@gmail.com', password: 'password', first_name: 'Kevin', last_name: 'Saugnier', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user5 = User.create(email: 'marc@gmail.com', password: 'password', first_name: 'Marc', last_name: 'Bernard', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user6 = User.create(email: 'john@gmail.com', password: 'password', first_name: 'John', last_name: 'Picou', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user7 = User.create(email: 'patrick@gmail.com', password: 'password', first_name: 'Patrick', last_name: 'Babi', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user8 = User.create(email: 'matthieu@gmail.com', password: 'password', first_name: 'Matthieu', last_name: 'Cartiller', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user9 = User.create(email: 'richard@gmail.com', password: 'password', first_name: 'Richard', last_name: 'Chouki', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user10 = User.create(email: 'loic@gmail.com', password: 'password', first_name: 'Loic', last_name: 'Bertrand', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user11 = User.create(email: 'bertrand@gmail.com', password: 'password', first_name: 'Bertrand', last_name: 'Canard', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user12 = User.create(email: 'marcel@gmail.com', password: 'password', first_name: 'Marcel', last_name: 'Dujarding', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user13 = User.create(email: 'luc@gmail.com', password: 'password', first_name: 'Romain', last_name: 'Malou', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user14 = User.create(email: 'patrice@gmail.com', password: 'password', first_name: 'Patrice', last_name: 'Qwech', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user15 = User.create(email: 'stephane@gmail.com', password: 'password', first_name: 'Stephane', last_name: 'Ricou', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user16 = User.create(email: 'pierrick@gmail.com', password: 'password', first_name: 'Pierrick', last_name: 'Chalu', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)

puts 'User creation OK'

company1 = Company.create!(name: Faker::Company.name, city: 'Lyon')
company2 = Company.create!(name: Faker::Company.name, city: 'Paris')
company3 = Company.create!(name: Faker::Company.name, city: 'Paris')
company4 = Company.create!(name: Faker::Company.name, city: 'Paris')
company5 = Company.create!(name: Faker::Company.name, city: 'Paris')
company6 = Company.create!(name: Faker::Company.name, city: 'Paris')
company7 = Company.create!(name: Faker::Company.name, city: 'Paris')
company8 = Company.create!(name: Faker::Company.name, city: 'Paris')
company9 = Company.create!(name: Faker::Company.name, city: 'Paris')
company10 = Company.create!(name: Faker::Company.name, city: 'Paris')
company11 = Company.create!(name: Faker::Company.name, city: 'Paris')
company12 = Company.create!(name: Faker::Company.name, city: 'Paris')
company13 = Company.create!(name: Faker::Company.name, city: 'Paris')
company14 = Company.create!(name: Faker::Company.name, city: 'Paris')
company15 = Company.create!(name: Faker::Company.name, city: 'Paris')
company16 = Company.create!(name: Faker::Company.name, city: 'Paris')


puts 'Company creation OK'


WorkExperience.create!(title: Faker::Job.title, start_time: '2019', end_time: "Aujourd'hui", location: 'Lyon', user: user1, company: company1, current: true)
WorkExperience.create!(title: Faker::Job.title, start_time: '2016', end_time: '2019', location: 'Lyon', user: user1, company: company2, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2014', end_time: '2016', location: 'Lyon', user: user1, company: company4, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2019', end_time: "Aujourd'hui", location: 'Lyon', user: user2, company: company4, current: true)
WorkExperience.create!(title: Faker::Job.title, start_time: '2014', end_time: '2019', location: 'Lyon', user: user2, company: company5, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user2, company: company1, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user3, company: company7, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2006', end_time: '2014', location: 'Lyon', user: user4, company: company8, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2000', end_time: '2004', location: 'Lyon', user: user4, company: company9, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Paris', user: user5, company: company4, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Paris', user: user5, company: company10, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: "Aujourd'hui", location: 'Lyon', user: user6, company: company11, current: true)
WorkExperience.create!(title: Faker::Job.title, start_time: '2011', end_time: '2013', location: 'Lyon', user: user6, company: company13, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '1999', end_time: '2003', location: 'Paris', user: user7, company: company7, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2003', end_time: '2014', location: 'Paris', user: user7, company: company12, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user8, company: company9, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user8, company: company14, current: false)
WorkExperience.create!(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user9, company: company13, current: false)


puts 'Work experience creation OK'


school1 = School.create!(name: 'HEC', city: 'Paris')
school2 = School.create!(name: 'Polytechnique', city: 'Paris')
school3 = School.create!(name: 'ENSMM', city: 'Paris')
school4 = School.create!(name: 'GEM', city: 'Grenoble')
school5 = School.create!(name: 'Chartreux', city: 'Lyon')
school6 = School.create!(name: 'Ecole des mines', city: 'Paris')

puts 'School creation OK'

SchoolExperience.create!(title: 'Master in management', start_time: '2019', end_time: "Aujourd'hui", location: 'Lyon', user: user1, school: school1, current: true)
SchoolExperience.create!(title: 'DUT Marketing', start_time: '2016', end_time: '2019', location: 'Lyon', user: user1, school: school2, current: false)
SchoolExperience.create!(title: "Diplôme d'ingénieur", start_time: '2014', end_time: '2016', location: 'Lyon', user: user1, school: school3, current: false)
SchoolExperience.create!(title: 'BTS Marketing', start_time: '2019', end_time: "Aujourd'hui", location: 'Lyon', user: user2, school: school4, current: true)
SchoolExperience.create!(title: 'BAC STI', start_time: '2014', end_time: '2019', location: 'Lyon', user: user2, school: school5, current: false)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', user: user3, school: school5, current: false)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', user: user4, school: school5, current: false)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', user: user5, school: school5, current: false)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: "Aujourd'hui", location: 'Lyon', user: user6, school: school5, current: true)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', user: user7, school: school5, current: false)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', user: user8, school: school5, current: false)
SchoolExperience.create!(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', user: user9, school: school5, current: false)


puts 'SchoolExperiences creation OK'

















































































































