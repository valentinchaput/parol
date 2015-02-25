class Summary

  attr_accessor :url, :articles

  def initialize
    @articles = []
  end

  def add_article(article)
    articles << article
  end

end