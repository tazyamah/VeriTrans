module VeriTrans
  require_relative 'api_base'
  require_relative 'setting'
  require_relative './Request/re_charges_parameter'

  class ReCharges < ApiBase

    API_PATH = '/vtdirect/v1/recharges'

    # @param [Setting] setting
    def initialize(setting)
      super(setting)
    end

    # @param [Request::ReChargesParameter] param
    def re_charge_with_register_id(param)
      self.do_request_post(API_PATH, param)
    end

  end
end
