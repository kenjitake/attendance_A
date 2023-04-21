class User < ApplicationRecord
  
  before_save { self.email = email.downcase }
  
  validates:name, presence: true
  
  validates:department, presence: true, allow_nil: true
  
  validates:employee_number, presence: true
  
  validates:cardID, presence: true
  
  VALID_EMAIL_REGIX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates:email, presence: true, length: { maximum: 50 },
                 format: { with: VALID_EMAIL_REGIX }
  
  has_secure_password
  validates:password, presence:true, length: { minimum: 6 }

end
