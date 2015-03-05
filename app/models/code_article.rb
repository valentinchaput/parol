# class CodeArticle < ActiveRecord::Base
#   belongs_to :code
#   has_many :law_articles

#   validates :article_number, presence: true
#   validates :content, presence: true, uniqueness: true
# end

class CodeArticle
  include Comparable
  HEADER_PATTERN = /---\n(?<header>.*)---\n(?<content>.*)/m

  attr_accessor :raw_header_content, :article_path, :article_number, :title, :content, :code, :part, :sub_part, :book, :chapter, :section

  def self.find(article_path, ref = "master")
    serialized_content = (octokit_client.contents ENV['GITHUB_LAW_REPO'], path: article_path, ref: ref).content
    content = Base64.decode64(serialized_content).force_encoding("UTF-8")

    match = HEADER_PATTERN.match(content)
    begin
      header = YAML.load(match[:header]).with_indifferent_access
    rescue Psych::SyntaxError
      header = {}
    end

    code_article = CodeArticle.new
    code_article.article_path = article_path
    code_article.raw_header_content = match[:header]
    code_article.code = header[:code]
    code_article.part = header[:part]
    code_article.sub_part = header[:sub_part]
    code_article.book = header[:book]
    code_article.title = header[:title]
    code_article.chapter = header[:chapter]
    code_article.article_number = header[:article_number]
    code_article.section = header[:section]
    code_article.content = match[:content]

    return code_article
  end

  def raw_header
    "---\n#{raw_header_content}---\n"
  end

  def <=>(other)
    self.article_number <=> other.article_number
  end

  # def self.sanitize_content(content)
  #   content.split("\n").reject!(&:blank?).join("\n")
  # end

  private

  def self.octokit_client
    @octokit_client ||= Octokit::Client.new access_token: ENV['GITHUB_TOKEN']
  end
end