class LawArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :next_article ]

  def show
    @law_article = LawArticle.find(params[:id])
    @amendment = Amendment.new
  end

  def next_article
    articles = @law_article.law.law_articles
    index = articles.index(@law_article) + 1
    @next_article = articles[index]
  end
end
