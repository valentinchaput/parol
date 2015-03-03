class LawArticlesController < ApplicationController
  def show
    @law_article = LawArticle.find(params[:id])
  end

  def next_article
    articles = @law_article.law.law_articles
    index = articles.index(@law_article) + 1
    @next_article = articles[index]
  end
end
