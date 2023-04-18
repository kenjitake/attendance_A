class User < ApplicationRecord
  
  validates:name, presence: true
  
  validates:department, presence: true, allow_nil: true
  
  validates:employee_number, presence: true
  
  validates:cardID, presence: true
  
  has_secure_password
  validates:password, presence:true, length: { minimum: 6 }

end
