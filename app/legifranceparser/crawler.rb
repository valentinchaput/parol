require 'mechanize'

class Crawler
  attr_accessor :base_url, :mechanize, :summary_urls, :articles_urls

  def initialize(base_url)
    @mechanize = Mechanize.new
    @base_url = base_url

    @summary_urls = []
    @article_urls = []
  end


  def crawl_code
    # FROM INDEX (code) TO SUMMARY
    starting_page = @mechanize.get(@base_url)
    starting_page.search(".codeLienArt a").first(2).each do |node|
      url = "http://www.legifrance.gouv.fr/#{node[:href]}"
      @summary_urls << url
    end
    #puts "#{@summary_urls.count} SUMMARY URLS FOUND"
    return @summary_urls
  end

  def crawl_summaries
    @summary_urls.each do |url|
      page = @mechanize.get(url)
      page.search(".titreArt a").each do |node|
        url = "http://www.legifrance.gouv.fr/#{node[:href]}"
        @article_urls << url
      end
    end
    #p @article_urls.count
    return @article_urls
  end

  def run!
    crawl_code
    crawl_summaries
  end


end

#returns an array of pages (articles) to parse

#TEST
# url_code = "http://www.legifrance.gouv.fr/affichCode.do;jsessionid=4DB72414E5E607303A33B346F12B51E7.tpdila13v_3?cidTexte=LEGITEXT000023983208&dateTexte=20110816"
# crawler = Crawler.new(url_code)
# articles_url = crawler.run!
# p articles_url
