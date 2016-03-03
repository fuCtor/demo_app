module ImportService
  def self.run(user, repo)
    uri = URI("https://api.github.com/repos/#{user}/#{repo}/commits")
    res = Net::HTTP.get_response(uri)

    return unless res.code == '200'
    commits = MultiJson.load res.body

    user_cash = {}

    Commit.transaction do
      Commit.truncate
      User.truncate

      #- commits (поля: дата коммита, пользователь, хеш коммита, описание коммита)
      #- users (поля: имя, email)

      commits.each do |commit|
        Commit.create sha: commit['sha'], message: commit['commit']['message'] do |new_commit|
          commit['commit'].tap do |commit|
            new_commit.commited_at = Time.parse(commit['committer']['date'])
            email = commit['committer']['email']
            new_commit.user = user_cash[email]
            unless new_commit.user
              new_commit.user = User.create(email: email, name: commit['committer']['name'])
              user_cash[email] = new_commit.user
            end
          end
        end
      end

    end
  end
end