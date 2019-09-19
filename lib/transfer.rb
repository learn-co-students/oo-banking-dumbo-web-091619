class Transfer
  attr_reader :name, :toname, :amount, :sender, :receiver, :pre_balance, :pre_balance2
  attr_accessor :status
  def initialize(name, toname, amount)
    @name = name 
    @toname = toname
    @amount = amount
    @sender = self.name
    @receiver = toname
    @status = "pending"
    @pre_balance = name.balance
    @pre_balance2 = toname.balance
  end
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  def execute_transaction
    if self.sender.balance == @pre_balance && self.valid? && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.sender.balance != @pre_balance
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    else
    end
  end

end

