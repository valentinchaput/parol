require "octokit"

namespace :github do
  task list_repositories: :environment do
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    client.repositories.each do |repo|
      puts repo.full_name
    end
  end
end
