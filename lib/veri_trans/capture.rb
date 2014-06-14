module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './request/capture_parameter'

  class Capture < ApiBase

    API_PATH = '/vtdirect/v1/capture'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::CaptureParameter] param
    def capture_order(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
