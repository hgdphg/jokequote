class JokeContent < ActiveRecord::Base
  belongs_to :user

  def self.dislike(content_id)
    jokecontent = JokeContent.find(content_id)
    if jokecontent
      jokecontent.dislike_count += 1
      jokecontent.save
    end
  end
end
