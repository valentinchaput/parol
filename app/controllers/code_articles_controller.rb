require "legifranceparser/summary"
require "legifranceparser/parser"
require "legifranceparser/crawler"


class CodeArticlesController < ApplicationController
  #method "main" parser
  def self.parse_all_articles_from_code(code_url)
    crawler = Crawler.new(code_url)
    articles_url = crawler.run!
    #tableau d'url de tous les articles d'un code

    articles_url.each do |page|
      parser = Parser.new(page)
      parser.run!
    end
  end

  def show
    @code_article = CodeArticle.find(params[:id])
  end
end
