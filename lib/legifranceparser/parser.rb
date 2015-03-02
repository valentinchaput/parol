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
    code_article = CodeArticle.new
    # article.code = @html_doc.xpath('//*[@class="data"]/div/div/a/strong').text
    code_article.part = @html_doc.xpath('//*[@class="data"]/div/ul/li/a').text
    code_article.sub_part = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/a').text
    code_article.book = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/a').text
    code_article.title = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/a').text
    code_article.chapter = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/ul/li/a').text
    code_article.section = @html_doc.xpath('//*[@class="data"]/div/ul/li/ul/li/ul/li/ul/li/ul/li/ul/li/a').text
    code_article.article_number = @html_doc.search('.titreArt').text
    code_article.content = @html_doc.search('.corpsArt').text
    code_article.code_id = "1" #code education!!!
    code_article.save
  end

end

#parses an article page

#TEST
# url_article = "http://www.legifrance.gouv.fr/affichCodeArticle.do;jsessionid=90FC28081E4A0791C848921D31417751.tpdila13v_3?idArticle=LEGIARTI000027682584&cidTexte=LEGITEXT000006071191&dateTexte=20150225"
# parser = Parser.new(url_article)
# article_path = parser.run!
# p article_path
