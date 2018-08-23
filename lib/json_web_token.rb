#
class JsonWebToken
  KEY = Rails.application.secrets.key_name || ENV["JWT_KEY"]

  class << self
    def encode(payload)
      JWT.encode payload, KEY, 'HS256'
    end

    def decode(token)
      JWT.decode token, KEY, true, algorithm: 'HS256'
    rescue StandardError
      nil
    end
  end
end
