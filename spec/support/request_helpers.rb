module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module HeadersHelpers
    def api_header(version = 1)
      request.headers['Accept'] = "application/vnd.marketplace.v#{version}"
    end

    def api_response_format(format = Mime[:json])
      request.headers['Accept'] = "#{request.headers['Accept']}, #{format}"
      request.headers['Content-Type'] = format.to_s
    end

    def login(user)
      # headers = { 'Accept' => 'application/vnd.marketplace.v1' }
      # request.headers['Accept'] = 'application/vnd.marketplace.v1'
      # request.headers['Content-Type'] = Mime[:json]
      post api_auth_user_path, params: { email: user.email, password: '12345678' }
      json_response['auth_token']
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
