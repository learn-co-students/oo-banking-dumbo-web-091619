class Transfer
  # your code here

  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  

  def initialize(sender,receiver,status="pending",amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status != "complete" && self.valid? == true && self.sender.balance >= self.amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
