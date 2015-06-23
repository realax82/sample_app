class User < ActiveRecord::Base
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,3}\z/i

    before_create(:create_remember_token)

    before_save{email.downcase!} #callback function - перед сохранением в БД переводит мыло в нижний регистр
# before_save{self.email=email.downcase}

    validates(:name,{:presence=>true,:length=>{:maximum=>50}})#проверка на существование и длину атрибута name
    validates(:email,{presence:true,format:{with: VALID_EMAIL_REGEX},uniqueness:{case_sensitive:false}}) #проверка на существование, формат и уникальность (регистронезависимую) атрибута email
    
    #В следующей строчке спрятана почти вся система аутентификации см. secure_password.rb
    has_secure_password
    validates(:password,{length:{minimum:6}})
    
#Идентификатор сессии
    def User.new_remember_token
	SecureRandom.urlsafe_base64
    end
    
    def User.encrypt(token)
	Digest::SHA1.hexdigest(token.to_s) #to_s нужен для того, чтобы обрабатывать nil-значения
    end
    
    private
	def create_remember_token
	    self.remember_token=User.encrypt(User.new_remember_token)
	end
end
