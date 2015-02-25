require_relative 'article'
require 'open-uri'
require 'nokogiri'

class Parser
  attr_accessor :html_doc

  def initialize(page_url)
    html_file = open(page_url)
    @html_doc = Nokogiri::HTML(html_file)
    # return @html_doc
  end

  def run!
  #retourne un array [code, partie, sous_partie, livre, titre, chapitre, section, article, content]
    article = Article.new
    article.code = @html_doc.xpath('//*[@class="data"]/div/div/a/strong').text
    article.part = @html_doc.xpath('//*[@class="data"]/div/ul/li/a').text
    article.sub_part = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/a').text
    # binding.pry
    article.book = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/a').text
    article.title = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/a').text
    article.chapter = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/ul/li/a').text
    article.section = "" # pas de section
    article.article = @html_doc.search('.titreArt').text
    article.content = @html_doc.search('.corpsArt').text
    return article
  end

end

#parses an article page

#TEST
# url_article = "http://www.legifrance.gouv.fr/affichCodeArticle.do;jsessionid=2D20E582ECA85F72A840C5C638A7B98F.tpdila13v_3?idArticle=LEGIARTI000023985192&cidTexte=LEGITEXT000023983208&dateTexte=20110816"
# parser = Parser.new(url_article)
# article_path = parser.run!
# p article_path
