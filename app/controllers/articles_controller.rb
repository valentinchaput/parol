require_relative "../legifranceparser/summary"
require_relative "../legifranceparser/parser"
require_relative "../legifranceparser/crawler"


class ArticlesController < ApplicationController
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
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
end
