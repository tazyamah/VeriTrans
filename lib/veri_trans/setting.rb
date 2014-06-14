module VeriTrans
  class Setting
    VERSION = '1.0'

    attr_accessor  :server_key, :request_host, :use_https_request, :request_host_port, :verify_ssl, :ca_cert_path

    def initialize
      @request_host = 'air.veritrans.co.jp'
      @use_https_request = true
      @request_host_port = 443
      @verify_ssl = true
    end

  end

end
