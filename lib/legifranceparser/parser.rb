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
    # article.code = @html_doc.xpath('//*[@class="data"]/div/div/a/strong').text
    article.part = @html_doc.xpath('//*[@class="data"]/div/ul/li/a').text
    article.sub_part = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/a').text
    article.book = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/a').text
    article.title = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/a').text
    article.chapter = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/ul/li/a').text
    article.section = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/ul/li/ul/li/a').text
    article.article = @html_doc.search('.titreArt').text
    article.content = @html_doc.search('.corpsArt').text
    article.code_id = "1" #code education!!!
    article.save
  end

end

#parses an article page

#TEST
# url_article = "http://www.legifrance.gouv.fr/affichCodeArticle.do;jsessionid=90FC28081E4A0791C848921D31417751.tpdila13v_3?idArticle=LEGIARTI000027682584&cidTexte=LEGITEXT000006071191&dateTexte=20150225"
# parser = Parser.new(url_article)
# article_path = parser.run!
# p article_path
