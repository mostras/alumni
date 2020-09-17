# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Diploma.destroy_all

diplomas = ["BAC",
            "PREPA ATS",
            "PREPA IEP/DROIT",
            "PREPA BL",
            "PREPA ECE",
            "PREPA ECS",
            "PREPA CPE/PC",
            "PREPA CPE/PSI",
            "BACHELOR ICS-CPE",
            "BTS SIO",
            "MASTER ICS-CPE",
            "DSCG",
            "BTS CG",
            "DSCG FSE",
            "DCG",
            "BTS IG",
            "BTS I",
            "DPECF",
            "DECF"
          ]

diplomas.each do |diploma|
  Diploma.create(name: diploma)
end

["BAC",
"PREPA ATS",
"PREPA IEP/DROIT",
"PREPA BL",
"PREPA ECE",
"PREPA ECS",
"PREPA CPE/PC",
"PREPA CPE/PSI",
"BACHELOR ICS-CPE",
"BTS SIO",
"MASTER ICS-CPE",
"DSCG",
"BTS CG",
"DSCG FSE",
"DCG",
"BTS IG",
"BTS I",
"DPECF",
"DECF"]
