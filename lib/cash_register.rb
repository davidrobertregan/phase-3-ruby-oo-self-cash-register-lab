require 'pry'

class CashRegister 
    attr_accessor :total, :discount, :all

    def initialize discount = 0
        @total = 0
        @discount = discount
        @all = []
    end

    def add_item title, price, quantity = 1
        self.total = total + price * quantity
        quantity.times do 
            self.all << { title: title, price: price.to_f }
        end
    end

    def apply_discount
        if self.discount != 0
            discount_as_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_as_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        self.all.map do |i|
            i[:title]
        end
    end

    def void_last_transaction
        if self.all != []
            last = self.all.last[:price]
            self.total = (total - last)
            self.all.pop
            self.total
        else 
            self.total = 0.0
        end
    end

end

cart = CashRegister.new(0)

carrots = cart.add_item("Carrots", 2.25, 2)
bread = cart.add_item("Bread", 5)
milk = cart.add_item("Milk", 3)

