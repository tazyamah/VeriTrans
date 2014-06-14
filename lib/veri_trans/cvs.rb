module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './Request/cvs_parameter'

  class Cvs < ApiBase

    API_PATH = '/vtdirect/v1/cvs'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::CvsParameter] param
    def payment_at_cvs(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
