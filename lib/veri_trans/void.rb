module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './Request/void_parameter'

  class Void < ApiBase

    API_PATH = '/vtdirect/v1/void'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::VoidParameter] param
    def void_order(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
