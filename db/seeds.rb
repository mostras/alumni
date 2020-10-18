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
Ghost.destroy_all
puts 'Ghost destruction OK'
List.destroy_all
puts 'Lists destruction OK'
Assignement.destroy_all
puts 'Assignement destruction OK'


#_________________________________________________
#Diploma Creation

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

#_________________________________________________
#Sector Creation

sectors = ['Professions paramédicales','Administration publique','Administration scolaire et universitaire','Aéronautique et aérospatiale','Affaires étrangères','Agriculture','Agro-alimentaire','Architecture et urbanisme','Armée','Articles de luxe et bijouterie','Articles de sport','Arts','Arts et artisanat','Arts vivants','Associations et organisations sociales et syndicales','Assurances','Automatismes industriels','Avocats','Banques','Bibliothèques','Biens de consommation',"Biens et équipements pour les entreprises","Biotechnologie","Bureau exécutif","Capital-risque et fonds LBO","Centres de recherches","Chantiers navals","Chimie","Collectivités publiques et territoriales","Commerce de détail","Commerce de gros","Commerce et développement international","Compagnie aérienne/Aviation","Comptabilité","Confection et mode","Conseil en management","Construction","Contenus rédactionnels","Cosmétiques","Défense et espace","Design","Design graphique","Divertissements","Édition","Élaboration de programmes","Élevage","Emballages et conteneurs","Enseignement supérieur","Entreposage, stockage","Environnement et énergies renouvelables","Équipements collectifs","Équipements et services de loisirs","Équipements ferroviaires","Équipements médicaux","Études/recherche","Études de marché","Externalisation/délocalisation","Films d’animation","Formation à distance","Formation primaire/secondaire","Formation professionnelle et coaching","Génie civil","Gestion de portefeuilles","Gestion des associations et fondations ","Grande distribution","Hôpitaux et centres de soins","Hôtellerie et hébergement","Humanitaire","Immobilier","Immobilier commercial","Import et export","Imprimerie, reproduction","Industrie automobile","Industrie bois et papiers","Industrie composants électriques/électroniques","Industrie du cinéma","Industrie pharmaceutique","Industrie textile","Ingénierie du mécénat","Ingénierie mécanique ou industrielle","Institutions judiciaires","Institutions religieuses","Internet","Jeux d’argent et casinos","Jeux électroniques","Logiciels informatiques","Logistique et chaîne d’approvisionnement","Loisirs, voyages et tourisme","Machines et équipements","Marchés des capitaux","Marketing et publicité","Matériaux de construction","Matériel informatique","Matières premières","Médecines alternatives","Médias en ligne","Médias radio et télédiffusés","Messageries et fret","Meubles","Mines et métaux","Musées et institutions culturelles","Musique","Nanotechnologies","Organisation d’événements","Parti politique","Pêche","Pétrole et énergie","Photographie","Plastiques","Police/gendarmerie","Politiques publiques","Presse écrite","Production audiovisuelle","Produits électroniques grand public","Professions médicales","Recrutement","Règlement extrajudiciaire de conflits","Relations publiques et communication","Réseaux informatiques","Ressources humaines","Restaurants","Restauration collective","Santé, forme et bien-être","Secteur laitier","Secteur médico-psychologique","Sécurité civile","Sécurité et enquêtes","Sécurité informatique et des réseaux","Semi-conducteurs","Services à la personne","Services aux consommateurs","Services d’information","Services d’investissement","Services financiers","Services juridiques","Services pour l’environnement","Sports","Tabac","Technologies et services de l’information","Technologies sans fil","Télécommunications","Traduction et adaptation","Transports maritimes","Transports routiers et ferroviaires","Verres, céramiques et ciments","Vétérinaire","Vins et spiritueux "]

sectors.each do |sector|
  Sector.create(name: sector)
end

puts 'Sector creation OK'

# _________________________________________________
# Users Creation

user1 = User.create(email: 'adrien-barbier@hotmail.fr', password: 'password', first_name: 'Adrien', last_name: 'Barbier', phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user1.photo.attach(io: open('seed_images/m19.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user2 = User.create(email: 'romainmostras@icloud.com', password: 'password', first_name: 'Romain', last_name: 'Mostras', phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: true, admin: true)
user2.photo.attach(io: open('seed_images/m20.jpeg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user3 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user3.photo.attach(io: open('seed_images/m1.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user4 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user4.photo.attach(io: open('seed_images/m2.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user5 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user5.photo.attach(io: open('seed_images/m3.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user6 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user6.photo.attach(io: open('seed_images/m4.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user7 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user7.photo.attach(io: open('seed_images/m5.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user8 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user8.photo.attach(io: open('seed_images/m6.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user9 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user9.photo.attach(io: open('seed_images/m7.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user10 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user10.photo.attach(io: open('seed_images/m8.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user11 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user11.photo.attach(io: open('seed_images/m9.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user12 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user12.photo.attach(io: open('seed_images/m10.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user13 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user13.photo.attach(io: open('seed_images/m11.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user14 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user14.photo.attach(io: open('seed_images/m12.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user15 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user15.photo.attach(io: open('seed_images/m13.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user16 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user16.photo.attach(io: open('seed_images/m14.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user17 = User.create!(email:Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user17.photo.attach(io: open('seed_images/m15.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user18 = User.create!(email:Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user18.photo.attach(io: open('seed_images/m16.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user19 = User.create!(email:Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user19.photo.attach(io: open('seed_images/m17.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user20 = User.create!(email:Faker::Internet.email, password: 'password', first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user20.photo.attach(io: open('seed_images/m18.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')

user21 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user21.photo.attach(io: open('seed_images/w1.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user22 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/in/romain-mostras/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: true, admin: true)
user22.photo.attach(io: open('seed_images/w2.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user23 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user23.photo.attach(io: open('seed_images/w3.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user24 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user24.photo.attach(io: open('seed_images/w4.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user25 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user25.photo.attach(io: open('seed_images/w5.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user26 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user26.photo.attach(io: open('seed_images/w6.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user27 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user27.photo.attach(io: open('seed_images/w7.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user28 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: true, looking_for_internship: false)
user28.photo.attach(io: open('seed_images/w8.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user29 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user29.photo.attach(io: open('seed_images/w9.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user30 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user30.photo.attach(io: open('seed_images/w10.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user31 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: false, looking_for_internship: true)
user31.photo.attach(io: open('seed_images/w11.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user32 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user32.photo.attach(io: open('seed_images/w12.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user33 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user33.photo.attach(io: open('seed_images/w13.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user34 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: false)
user34.photo.attach(io: open('seed_images/w14.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user35 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: false, company_hire: true, looking_for_internship: true)
user35.photo.attach(io: open('seed_images/w15.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user36 = User.create(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0634523911', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0634523911', looking_for_job: true, company_hire: false, looking_for_internship: false)
user36.photo.attach(io: open('seed_images/w16.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user37 = User.create!(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user37.photo.attach(io: open('seed_images/w17.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user38 = User.create!(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user38.photo.attach(io: open('seed_images/w18.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user39 = User.create!(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user39.photo.attach(io: open('seed_images/w19.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
user40 = User.create!(email: Faker::Internet.email, password: 'password', first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, phone_number: '0679093818', linkedin_url: 'https://www.linkedin.com/feed/', whatsapp_number: '0679093818', looking_for_job: true, company_hire: true, looking_for_internship: false, admin: true)
user40.photo.attach(io: open('seed_images/w20.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')

puts 'User creation OK'

#_________________________________________________
#Company Creation

company1 = Company.create!(name: Faker::Company.name, city: 'Lyon')
company2 = Company.create!(name: Faker::Company.name, city: 'Paris')
company3 = Company.create!(name: Faker::Company.name, city: 'Paris')
company4 = Company.create!(name: Faker::Company.name, city: 'Marseille')
company5 = Company.create!(name: Faker::Company.name, city: 'Marseille')
company6 = Company.create!(name: Faker::Company.name, city: 'Marseille')
company7 = Company.create!(name: Faker::Company.name, city: 'Paris')
company8 = Company.create!(name: Faker::Company.name, city: 'Paris')
company9 = Company.create!(name: Faker::Company.name, city: 'Grenoble')
company10 = Company.create!(name: Faker::Company.name, city: 'Grenoble')
company11 = Company.create!(name: Faker::Company.name, city: 'Lyon')
company12 = Company.create!(name: Faker::Company.name, city: 'Lyon')
company13 = Company.create!(name: Faker::Company.name, city: 'Paris')
company14 = Company.create!(name: Faker::Company.name, city: 'Paris')
company15 = Company.create!(name: Faker::Company.name, city: 'Bordeau')
company16 = Company.create!(name: Faker::Company.name, city: 'Bordeau')
company17 = Company.create!(name: Faker::Company.name, city: 'Paris')
company18 = Company.create!(name: Faker::Company.name, city: 'Paris')
company19 = Company.create!(name: Faker::Company.name, city: 'Paris')
company20 = Company.create!(name: Faker::Company.name, city: 'Paris')

puts 'Company creation OK'

#_________________________________________________
#WorkExperiences Creation



def company
  company_array = Company.all

  company_id_array = []

  company_array.each do |company|
    company_id_array << company.id
  end

  company_id_array.sample
end

def start_date
  ['2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010'].sample
end

def end_date
  ['2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', "Aujourd'hui"].sample
end

def location
  ['Lyon', 'Marseille', 'Bordeau', 'Paris', 'Grenoble'].sample
end

users = User.all
users.each do |user|
  3.times do
    WorkExperience.create!(title: Faker::Job.title, start_time: start_date, end_time: end_date, location: location, user: user, company_id: company)
  end
end

puts 'Work experience creation OK'

#_________________________________________________
#School Creation

school1 = School.create!(name: 'HEC', city: 'Paris')
school2 = School.create!(name: 'Polytechnique', city: 'Paris')
school3 = School.create!(name: 'ENSMM', city: 'Paris')
school4 = School.create!(name: 'GEM', city: 'Grenoble')
school5 = School.create!(name: 'Chartreux', city: 'Lyon')
school6 = School.create!(name: 'Ecole des mines', city: 'Paris')

puts 'School creation OK'


#_________________________________________________
#SchoolExperience Creation

def school
  school_array = School.all

  school_id_array = []

  school_array.each do |school|
    school_id_array << school.id
  end

  school_id_array.sample
end

def diploma
  ['Master in management', 'DUT Marketing', "Diplôme d'ingénieur", 'BAC STI', 'BAC S' ].sample
end

users.each do |user|
  2.times do
    SchoolExperience.create!(title: diploma, start_time: start_date, end_time: end_date, location: location, user: user, school_id: school)
  end
end

puts 'SchoolExperiences creation OK'

#_________________________________________________
#Tag Creation

def diploma_id_sample
  diploma_array = Diploma.all

  diploma_id_array = []

  diploma_array.each do |diploma|
    diploma_id_array << diploma.id
  end

  diploma_id_array.sample
end

def diploma_year
  (1990..2019).to_a.sample
end

users.each do |user|
  3.times do
    Tag.create!(user: user, diploma_id: diploma_id_sample, year: diploma_year)
  end
end

puts "Tags creation OK"

#_________________________________________________
#UserSector Creation

def sector_id_sample
  sector_array = Sector.all
  sector_id_array = []
  sector_array.each do |sector|
    sector_id_array << sector.id
  end

  sector_id_array.sample
end

users.each do |user|
  4.times do
    UserSector.create!(user: user, sector_id: sector_id_sample)
  end
end

puts "Sector tags creation OK"

#_________________________________________________
#Ghost Creation

Ghost.create!(first_name: 'Kevin', last_name: 'Chabot', email: 'chab@gmail.com')
Ghost.create!(first_name: 'Vincent', last_name: 'Bery')
Ghost.create!(first_name: 'Juliette', last_name: 'Chabot', email: 'ju@gmail.com')
Ghost.create!(first_name: 'Paulette', last_name: 'Malu', email: 'pa@gmail.com')
Ghost.create!(first_name: 'Aurore', last_name: 'Pilou', email: 'au@gmail.com', notification_send: true)
Ghost.create!(first_name: 'Kylian', last_name: 'Pacha', email: 'ky@gmail.com')
Ghost.create!(first_name: 'Joe', last_name: 'Chiko', email: 'joe@gmail.com', notification_send: true)

puts 'Ghost creation OK'

#_________________________________________________
#List Creation

list1 = List.create!(name: 'Tout')

users.each do |user|
  Assignement.create!(user: user, list: list1)
end

puts 'List creation OK'
















































































































