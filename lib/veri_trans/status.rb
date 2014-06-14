module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './request/status_parameter'

  class Status < ApiBase

    API_PATH = '/vtdirect/v1/status'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::StatusParameter] param
    def get_order_status(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
