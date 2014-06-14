module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './Request/credit_card_list_parameter'

  class CreditCardList < ApiBase

    API_PATH = '/vtdirect/v1/creditcard/list'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::CreditCardListParameter] param
    def list_credit_card_bind(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
