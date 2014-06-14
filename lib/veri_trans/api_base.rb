module VeriTrans
  require 'json'
  require 'active_model'
  require 'active_model/serializers/json'
  require_relative 'setting'
  require_relative 'http_request.rb'


  class ApiBase

    attr_accessor :ca_cert_file_path, :verify_ssl, :port, :use_ssl, :host, :server_key
    attr_reader :http_request

    # @param [Setting] setting
    def initialize(setting)
      @server_key = setting.server_key
      @ca_cert_file_path = setting.ca_cert_path
      @host = setting.request_host
      @use_ssl = setting.use_https_request
      @port = setting.request_host_port
      @verify_ssl = setting.verify_ssl

      @http_request = HttpRequest.new(
        server_key: @server_key,
        host: @host,
        use_ssl: @use_ssl,
        port: @port,
        verify_ssl: @verify_ssl,
        ca_cert_file_path: @ca_cert_file_path,
      )

    end

    # @param [String] path
    # @param [Object] entity
    def do_request_post(path, entity)
      result_body = @http_request.send_post_request(path: path, body: ActiveSupport::JSON.encode(entity))
      begin
        JSON.parse(result_body)
      rescue
        raise VtdException::VtDirectError("Could not decode from JSON to ruby object.\r\n#{result_body}")
      end

    end

    # @param [String] path
    # @param [Array] params
    # @return [Object] Json decoded object
    def do_request_get(path, params)
      result_body = @http_request.send_get_request(path: path, params: params)
      begin
        JSON.parse(result_body)
      rescue
        raise VtdException::VtDirectError("Could not decode from JSON to ruby object.\r\n#{result_body}")
      end

    end

  end
end
