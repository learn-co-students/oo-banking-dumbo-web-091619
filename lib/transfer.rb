class Transfer
  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" 
      if self.sender.balance >= self.amount && valid?
        self.receiver.deposit(self.amount)
        self.sender.balance -= self.amount
        self.status = "complete"
      else          
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end


end
