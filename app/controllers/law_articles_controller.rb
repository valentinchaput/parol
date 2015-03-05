class LawArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :next_article ]

  def show
    @law        = Law.find(params[:law_id])
    @article    = @law.law_articles.find(params[:id])
    @amendments = @article.amendments.order('position asc')
  end

  def edit
    @law         = Law.find(params[:law_id])
    @law_article = LawArticle.find(params[:id])
  end

  def update
    raise "TODO"
  end

  def next_article
    articles      = @law_article.law.law_articles
    index         = articles.index(@law_article) + 1
    @next_article = articles[index]
  end
end
