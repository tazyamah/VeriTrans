module VeriTrans::Request
  class ReChargesParameter
    def initialize
    end
    attr_accessor :order_id, :gross_amount, :with_capture, :register_id
  end
end
