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
  description:  "L’avenir de la jeunesse, le redressement de notre pays, son développement culturel, social et économique dépendent largement de notre capacité collective à refonder l’école de la République.
Cette refondation porte non seulement un projet éducatif, mais également un projet de société. La France, avec la refondation de son école, se donne les moyens de répondre aux grands défis auxquels elle est confrontée : élever le niveau de connaissances, de compétence et de culture de tous les enfants, accroître son niveau de croissance avec des jeunes mieux formés et dotés de hautes compétences, lutter contre le chômage des jeunes, réduire les inégalités sociales et territoriales, promouvoir l’égalité entre les femmes et les hommes, recréer une cohésion nationale et un lien civique autour de la promesse républicaine de la réussite éducative pour tous.",
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