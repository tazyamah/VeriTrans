module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './Request/charges_parameter'

  class Charges < ApiBase

    API_PATH = '/vtdirect/v1/charges'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::ChargesParameter] param
    def charge_with_token(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
