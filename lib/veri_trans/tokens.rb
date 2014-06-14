module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'

  class Tokens < ApiBase

    API_PATH = '/vtdirect/v1/tokens'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [String] client_key
    # @param [String] card_number
    # @param [String] card_exp_year
    # @param [String] card_exp_month
    # @param [String] card_cvv
    def get_token(client_key, card_number, card_exp_year, card_exp_month, card_cvv)
      params = {:card_number => card_number, :card_exp_month => card_exp_month,
                :card_exp_year => card_exp_year, :card_cvv => card_cvv,
                :client_key => client_key}
      self.do_request_get(API_PATH, params)
    end

  end
end
