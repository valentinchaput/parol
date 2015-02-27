require_relative "crawler"
require_relative "parser"
require_relative "summary"

articles = []  # Array of `Article`

CODE_URL = "http://www.legifrance.gouv.fr/affichCode.do;jsessionid=3DE2A5777BEA33C1568A0997B92CB09E.tpdila13v_3?cidTexte=LEGITEXT000006071191&dateTexte=20150225"

crawler = Crawler.new(CODE_URL)
articles_url = crawler.run!
#tableau d'url de tous les articles d'un code

articles_url.each do |page|
  parser = Parser.new(page)
  articles << parser.run!
end

p articles
