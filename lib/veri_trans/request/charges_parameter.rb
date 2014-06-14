module VeriTrans::Request
  class ChargesParameter
    def initialize
    end
    attr_accessor :token_id, :order_id, :gross_amount, :with_capture, :register, :customer_id, :test_mode
  end
end
