require "legifranceparser/summary"
require "legifranceparser/parser"
require "legifranceparser/crawler"

class CodeArticleController < ApplicationController
  #method "main" parser
  skip_before_action :authenticate_user!, only: [ :index ]

  def self.parse_all_articles_from_code(code_url)
    crawler = Crawler.new(code_url)
    articles_url = crawler.run!
    #tableau d'url de tous les articles d'un code

    articles_url.each do |page|
      parser = Parser.new(page)
      parser.run!
    end
  end

  # def initialize(repo, path, latest_sha)
  #   @repo = repo
  #   @path = path
  #   @latest_sha = latest_sha || "master"
  #   @token = ENV['GITHUB_TOKEN']
  # end

  def index
    @code = Code.find(params[:code_id])
    @code_article = CodeArticle.find(@code.github_path, params[:path])
  end

#   def show
#     @code_article = CodeArticle.find(params[:id]) #remplacer par URL
#   end

end
