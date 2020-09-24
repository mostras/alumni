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


user1 = User.new(email: 'adrien-barbier@hotmail.fr', password: 'password', first_name: 'Adrien', last_name: 'Barbier', phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false)
user1.save!
user2 = User.create(email: 'romainmostras@icloud.com', password: 'password', first_name: 'Romain', last_name: 'Mostras', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: true)
user2.save!
user3 = User.create(email: 'jean@gmail.com', password: 'password', first_name: 'Jean', last_name: 'Paluche', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user3.save!
user4 = User.create(email: 'kevin@gmail.com', password: 'password', first_name: 'Kevin', last_name: 'Saugnier', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user4.save!
user5 = User.create(email: 'marc@gmail.com', password: 'password', first_name: 'Marc', last_name: 'Bernard', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user5.save!
user6 = User.create(email: 'john@gmail.com', password: 'password', first_name: 'John', last_name: 'Picou', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user6.save!
user7 = User.create(email: 'patrick@gmail.com', password: 'password', first_name: 'Patrick', last_name: 'Babi', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user7.save!
user8 = User.create(email: 'matthieu@gmail.com', password: 'password', first_name: 'Matthieu', last_name: 'Cartiller', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user8.save!
user9 = User.create(email: 'richard@gmail.com', password: 'password', first_name: 'Richard', last_name: 'Chouki', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user9.save!
user10 = User.create(email: 'loic@gmail.com', password: 'password', first_name: 'Loic', last_name: 'Bertrand', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user10.save!
user11 = User.create(email: 'bertrand@gmail.com', password: 'password', first_name: 'Bertrand', last_name: 'Canard', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user11.save!
user12 = User.create(email: 'marcel@gmail.com', password: 'password', first_name: 'Marcel', last_name: 'Dujarding', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user12.save!
user13 = User.create(email: 'luc@gmail.com', password: 'password', first_name: 'Romain', last_name: 'Malou', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user13.save!
user14 = User.create(email: 'patrice@gmail.com', password: 'password', first_name: 'Patrice', last_name: 'Qwech', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user14.save!
user15 = User.create(email: 'stephane@gmail.com', password: 'password', first_name: 'Stephane', last_name: 'Ricou', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user15.save!
user16 = User.create(email: 'pierrick@gmail.com', password: 'password', first_name: 'Pierrick', last_name: 'Chalu', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user16.save!


puts 'User creation OK'

company1 = Company.new(name: Faker::Company.name, city: 'Lyon')
company1.save!
company2 = Company.new(name: Faker::Company.name, city: 'Paris')
company2.save!
company3 = Company.new(name: Faker::Company.name, city: 'Paris')
company3.save!
company4 = Company.new(name: Faker::Company.name, city: 'Paris')
company4.save!
company5 = Company.new(name: Faker::Company.name, city: 'Paris')
company5.save!
company6 = Company.new(name: Faker::Company.name, city: 'Paris')
company6.save!
company7 = Company.new(name: Faker::Company.name, city: 'Paris')
company7.save!
company8 = Company.new(name: Faker::Company.name, city: 'Paris')
company8.save!
company9 = Company.new(name: Faker::Company.name, city: 'Paris')
company9.save!
company10 = Company.new(name: Faker::Company.name, city: 'Paris')
company10.save!
company11 = Company.new(name: Faker::Company.name, city: 'Paris')
company11.save!
company12 = Company.new(name: Faker::Company.name, city: 'Paris')
company12.save!
company13 = Company.new(name: Faker::Company.name, city: 'Paris')
company13.save!
company14 = Company.new(name: Faker::Company.name, city: 'Paris')
company14.save!
company15 = Company.new(name: Faker::Company.name, city: 'Paris')
company15.save!
company16 = Company.new(name: Faker::Company.name, city: 'Paris')
company16.save!


puts 'Company creation OK'


work_experience1 = WorkExperience.new(title: Faker::Job.title, start_time: '2019', end_time: '2020', location: 'Lyon', user: user1, company: company1)
work_experience1.save!
work_experience2 = WorkExperience.new(title: Faker::Job.title, start_time: '2016', end_time: '2019', location: 'Lyon', user: user1, company: company2)
work_experience2.save!
work_experience3 = WorkExperience.new(title: Faker::Job.title, start_time: '2014', end_time: '2016', location: 'Lyon', user: user1, company: company3)
work_experience3.save!
work_experience4 = WorkExperience.new(title: Faker::Job.title, start_time: '2019', end_time: '2020', location: 'Lyon', user: user2, company: company4)
work_experience4.save!
work_experience5 = WorkExperience.new(title: Faker::Job.title, start_time: '2014', end_time: '2019', location: 'Lyon', user: user2, company: company5)
work_experience5.save!
work_experience6 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user2, company: company6)
work_experience6.save!
work_experience7 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user3, company: company7)
work_experience7.save!
work_experience8 = WorkExperience.new(title: Faker::Job.title, start_time: '2006', end_time: '2014', location: 'Lyon', user: user4, company: company8)
work_experience8.save!
work_experience9 = WorkExperience.new(title: Faker::Job.title, start_time: '2000', end_time: '2004', location: 'Lyon', user: user4, company: company9)
work_experience9.save!
work_experience10 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Paris', user: user5, company: company4)
work_experience10.save!
work_experience11 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Paris', user: user5, company: company10)
work_experience11.save!
work_experience12 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2020', location: 'Lyon', user: user6, company: company11)
work_experience12.save!
work_experience13 = WorkExperience.new(title: Faker::Job.title, start_time: '2011', end_time: '2013', location: 'Lyon', user: user6, company: company13)
work_experience13.save!
work_experience14 = WorkExperience.new(title: Faker::Job.title, start_time: '1999', end_time: '2003', location: 'Paris', user: user7, company: company7)
work_experience14.save!
work_experience15 = WorkExperience.new(title: Faker::Job.title, start_time: '2003', end_time: '2014', location: 'Paris', user: user7, company: company12)
work_experience15.save!
work_experience16 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user8, company: company9)
work_experience16.save!
work_experience17 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user8, company: company14)
work_experience17.save!
work_experience18 = WorkExperience.new(title: Faker::Job.title, start_time: '2012', end_time: '2014', location: 'Lyon', user: user9, company: company13)
work_experience18.save!


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
school_experience6 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user3, school: school5)
school_experience6.save!
school_experience7 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user4, school: school2)
school_experience7.save!
school_experience8 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user5, school: school1)
school_experience8.save!
school_experience9 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user6, school: school4)
school_experience9.save!
school_experience10 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user7, school: school2)
school_experience10.save!
school_experience11 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user8, school: school5)
school_experience11.save!
school_experience12 = SchoolExperience.new(title: 'BAC S', start_time: '2012', end_time: '2014', location: 'Lyon', current: true, user: user9, school: school6)
school_experience12.save!


puts 'SchoolExperiences creation OK'

















































































































