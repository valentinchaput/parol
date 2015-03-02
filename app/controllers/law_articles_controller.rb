class LawArticlesController < ApplicationController
  def show
    @law_article = LawArticle.find(params[:id])
  end
end
