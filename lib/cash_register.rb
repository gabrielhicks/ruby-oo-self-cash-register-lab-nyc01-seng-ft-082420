require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount=nil)
        self.total = 0
        self.discount = discount
        self.items = []
    end

    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
        @last_item = price * quantity
        quantity.times{@items << title}
    end
    
    def apply_discount
        if self.discount
            @discount = self.discount/100.to_f
            @total = self.total - (total * discount)
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @last_item
    end
end
