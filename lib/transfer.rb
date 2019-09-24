class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.status == 'open' && receiver.status == 'open'
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > @amount && self.status == 'pending' && sender.valid? && self.valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
