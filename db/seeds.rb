# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


laws = Law.create [
    {
  id:           1,
  title:        "Loi éducation 2013",
  description:  "Blablablabla",
  },
    {
  id:           2,
  title:        "Loi santé",
  description:  "Blablablablabla",
  },
    {
  id:           3,
  title:        "Loi transition énergétique",
  description:  "Blablablablablabla",
  }]


law = laws.first
amendment = law.amendments.create({
  id:           132,
  title:        "Article 132",
  content:      "et à lutter contre les inégalités sociales et territoriales en matière de réussite scolaire et éducative. Il reconnaît que tous les enfants partagent la capacité d'apprendre et de progresser. Il veille à l'inclusion scolaire de tous les enfants, sans aucune distinction. Il veille également à la mixité sociale des publics scolarisés au sein des établissements d'enseignement. Pour garantir la réussite de tous, l'école se construit avec la participation des parents, quelle que soit leur origine sociale. Elle s'enrichit et se conforte par le dialogue et la coopération entre tous les acteurs de la communauté éducative.",
  description:  "modifier le texte alinéa 1",
})