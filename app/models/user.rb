class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  protected

 	def self.find_for_database_authentication(conditions)
   	if user=User.find_by_email(conditions[:email]) and not user.omniauth_type.blank?
   		#提示第三方认证登录
   		flash.notice
   	else
   		find_for_authentication(conditions)
   	end
 	end
 	
end
