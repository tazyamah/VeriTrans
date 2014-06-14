module VeriTrans
  require 'rest-client'
  require 'uri'
  require 'openssl'
  require 'active_support/core_ext/object/to_query'
  require 'base64'

  class HttpRequest
    attr_accessor :server_key, :host, :use_ssl, :port

    def initialize(server_key: nil, host: nil, use_ssl: true, port: 443, verify_ssl: true, ca_cert_file_path: nil)
      @server_key = server_key
      @host = host
      @port = port
      @use_ssl = use_ssl
      @verify_ssl = verify_ssl
      @ca_cert_file_path = ca_cert_file_path
    end

    def send_get_request(path: nil, params: nil)
      full_url = generate_api_url(path: path)
      full_url += '?' + params.to_query(nil) if params
      begin
        resource = RestClient::Resource.new(full_url, generate_resource_option)
        response = resource.get
        if response.code == 200
          response.to_str
        else
          raise(VtdException::VtDirectNetworkError, 'Http status error occurred.')
        end
      rescue => e
        raise(VtdException::VtDirectNetworkError, e.message)
      end
    end

    def send_post_request(path: nil, body: nil)
      full_url = generate_api_url(path: path)
      begin
        resource = RestClient::Resource.new(full_url, generate_resource_option)
        header =
          {
            :content_type => :json,
            :accept => :json,
            'User-Agent' => "VTDirect/v1 RubyBindings/#{Setting::VERSION}",
            'Authorization' => "Basic #{Base64.strict_encode64(@server_key)}"
          }
        response = resource.post(
          body,
          header
        )
        if response.code == 200
          response.to_str
        else
          raise(VtdException::VtDirectNetworkError, 'Http status error occurred.')
        end
      rescue => e
        raise(VtdException::VtDirectNetworkError, e.message)
      end

    end

    def generate_resource_option
      {
        :timeout => 130,
        :verify_ssl => (@verify_ssl) ? OpenSSL::SSL::VERIFY_PEER : OpenSSL::SSL::VERIFY_NONE,
        :ssl_ca_file => @ca_cert_file_path
      }
    end

    def generate_api_url(path: nil)
      ((@use_ssl) ? 'https' : 'http') + "://#{@host}:#{@port}#{path}"
    end

    private :generate_api_url

  end
end
