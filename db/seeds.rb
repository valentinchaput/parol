# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Code.destroy_all
codes = Code.create! [
    {
  title:        "Code de l'éducation",
  description:  "Ensemble des lois portant sur l'éducation, de l'école et de la formation.",
  github_path:  "french_law/code_education"
  },
    {
  title:        "Code des transports",
  description:  "Régulations des transports civils, commerciaux et publics",
  },
    {
  title:        "Code de l'environnement",
  description:  "Code des plantes et des fleurs",
  }]

Law.destroy_all
laws = Law.create! [
    {
  title:        "Loi éducation 2013",
  description:  "L’avenir de la jeunesse, le redressement de notre pays, son développement culturel, social et économique dépendent largement de notre capacité collective à refonder l’école de la République.
Cette refondation porte non seulement un projet éducatif, mais également un projet de société. La France, avec la refondation de son école, se donne les moyens de répondre aux grands défis auxquels elle est confrontée : élever le niveau de connaissances, de compétence et de culture de tous les enfants, accroître son niveau de croissance avec des jeunes mieux formés et dotés de hautes compétences, lutter contre le chômage des jeunes, réduire les inégalités sociales et territoriales, promouvoir l’égalité entre les femmes et les hommes, recréer une cohésion nationale et un lien civique autour de la promesse républicaine de la réussite éducative pour tous.",
  status:       "adoptée"
  },
    {
  title:        "Loi santé",
  description:  "Blablablablabla",
  status:       "en discussion à l'Assemblée nationale"
  },
    {
  title:        "Loi transition énergétique",
  description:  "Blablablablablabla",
  status:       "en discussion au Sénat"
  }]

LawArticle.destroy_all
law = laws[0]
law_article = law.law_articles.create!(
  article_number: "Article 2",
  content:        "L'éducation est la première priorité nationale. Le service public de l'éducation est conçu et organisé en fonction des élèves et des étudiants. Il contribue à l'égalité des chances et à lutter contre les inégalités sociales et territoriales en matière de réussite scolaire et éducative. Il reconnaît que tous les enfants partagent la capacité d'apprendre et de progresser. Il veille à l'inclusion scolaire de tous les enfants, sans aucune distinction. Il veille également à la mixité sociale des publics scolarisés au sein des établissements d'enseignement. Pour garantir la réussite de tous, l'école se construit avec la participation des parents, quelle que soit leur origine sociale. Elle s'enrichit et se conforte par le dialogue et la coopération entre tous les acteurs de la communauté éducative.\n\nOutre la transmission des connaissances, la Nation fixe comme mission première à l'école de faire partager aux élèves les valeurs de la République. Le service public de l'éducation fait acquérir à tous les élèves le respect de l'égale dignité des êtres humains, de la liberté de conscience et de la laïcité. Par son organisation et ses méthodes, comme par la formation des maîtres qui y enseignent, il favorise la coopération entre les élèves.\n\nDans l'exercice de leurs fonctions, les personnels mettent en oeuvre ces valeurs.\n\nLe droit à l'éducation est garanti à chacun afin de lui permettre de développer sa personnalité, d'élever son niveau de formation initiale et continue, de s'insérer dans la vie sociale et professionnelle, d'exercer sa citoyenneté.\n\nPour garantir ce droit dans le respect de l'égalité des chances, des aides sont attribuées aux élèves et aux étudiants selon leurs ressources et leurs mérites. La répartition des moyens du service public de l'éducation tient compte des différences de situation, notamment en matière économique et sociale.\n\nElle a pour but de renforcer l'encadrement des élèves dans les écoles et établissements d'enseignement situés dans des zones d'environnement social défavorisé et des zones d'habitat dispersé, et de permettre de façon générale aux élèves en difficulté, quelle qu'en soit l'origine, en particulier de santé, de bénéficier d'actions de soutien individualisé.\n\nL'école garantit à tous les élèves l'apprentissage et la maîtrise de la langue française.\n\nL'acquisition d'une culture générale et d'une qualification reconnue est assurée à tous les jeunes, quelle que soit leur origine sociale, culturelle ou géographique.",
  object:         "Modifie l'article L.111-1 du Code de l'éducation",
  status:         "en discussion"
)

Amendment.destroy_all
law_article.amendments.create!(
  amendment_number: "57",
  author:           "Jules Ferry Jr.",
  chamber:          "Assemblée Nationale",
  content:          "Il veille à l'inclusion scolaire de certains enfants avec distinction.",
  date:             "2015-03-04",
  initial_text:     "Il veille à l'inclusion scolaire de tous les enfants, sans aucune distinction.",
  object:           "Mettre en avant la laïcité et l'égalité de tous les enfants face à l'école.",
  position:         373,
  status:           "en discussion"
)

law_article.amendments.create!(
  amendment_number: "42",
  author:           "Jean-Michel Debré",
  chamber:          "Assemblée",
  content:          "Le service public de l'éducation fait acquérir à tous les élèves le respect de l'égale dignité des êtres humains.",
  date:             "2015-03-15",
  initial_text:     "Le service public de l'éducation fait acquérir à tous les élèves le respect de l'égale dignité des êtres humains, de la liberté de conscience et de la laïcité.",
  object:           "Rajouté dialogue.",
  position:         687,
  status:           "adopté"
)
