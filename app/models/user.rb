class User < ApplicationRecord
  
  validates:name, presence: true
  
  validates:department, presence: true, allow_nil: true
  
  validates:employee_number, presence: true
  
  validates:cardID, presence: true
  
end
