class Code < ActiveRecord::Base
  # has_many :code_articles

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  def code_articles
    (octokit_client.contents(ENV['GITHUB_LAW_REPO'], path: github_path).map(&:path).map do |path|
      CodeArticle.find(path)
    end).sort
  end

  def octokit_client
    @octokit_client ||= Octokit::Client.new access_token: ENV['GITHUB_TOKEN']
  end
end



#   attr_accessor :title, :description, :github_path

#   def self.find(path)
#     serialized_content = (octokit_client.contents ENV['GITHUB_LAW_REPO'], path: path).content
#     content = Base64.decode64(serialized_content).force_encoding("UTF-8")

#     # match = HEADER_PATTERN.match(content)
#     # begin
#     #   header = YAML.load(match[:header]).with_indifferent_access
#     # rescue Psych::SyntaxError
#     #   header = {}
#     # end

#     code = Code.new
#     code.title = header[:code]
#     code.description = header[:part]
#     code.github_path = path
#     # code_article.book = header[:book]
#     # code_article.title = header[:title]
#     # code_article.chapter = header[:chapter]
#     # code_article.article_number = header[:article_number]
#     # code_article.section = header[:section]
#     # code_article.content = match[:content]

#     return code
#   end

#   private

#   def self.octokit_client
#     @octokit_client ||= Octokit::Client.new access_token: ENV['GITHUB_TOKEN']
#   end
# end