class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :postvotes
  has_many :commentvotes

   def self.authenticate(validate = {})

     account =  User.find_by_email(validate[:email])
     if account.nil? == false && account.password == validate[:password]
       return account
     else
      return nil
     end

   end

end
