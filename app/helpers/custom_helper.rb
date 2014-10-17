module CustomHelper
  def autolink body
    body_link_usernames = link_username(body)
    link_hashtag(body_link_usernames)
  end

  def link_username(body)
    username_pattern = /@\w+/i

    body.gsub(username_pattern) do |username|
      username_without_at = username.downcase[1..-1]
      bolded ="<strong>#{username}</strong>".html_safe
      if User.find_by(username: username_without_at)
        link_to bolded, user_path(username_without_at)
      else
        bolded
      end
    end
  end

  def link_hashtag(body)
    hashtag_pattern = /#\w+/i

    body.gsub(hashtag_pattern) do |hashtag|
      hashtag_without_hash = hashtag[1..-1]
      link_to hashtag, search_path(query: hashtag_without_hash)
    end
  end

  def avatar email
    hashed_email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{hashed_email}"
  end
end
