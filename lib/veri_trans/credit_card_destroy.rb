module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './request/credit_card_destroy_parameter'

  class CreditCardDestroy < ApiBase

    API_PATH = '/vtdirect/v1/creditcard/destroy'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::CreditCardDestroyParameter] param
    def destroy_credit_card_bind(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
