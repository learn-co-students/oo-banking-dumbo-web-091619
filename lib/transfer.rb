require "pry"

class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  def initialize(sender, receiver, amount) 
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end


  def valid?
   sender.valid? && receiver.valid?
  
   #  binding.pry
  end
  
  def execute_transaction
   if sender.balance > amount && valid? && self.status == 'pending'
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
   else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
   end

  end
  
  def reverse_transfer
    if receiver.balance > amount && valid? && self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      self.status = "rejected"
   end
  end
end
