class User < ActiveRecord::Base
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,3}\z/i

    before_save{self.email=email.downcase} #callback function - перед сохранением в БД переводит мыло в нижний регистр

    validates(:name,{:presence=>true,:length=>{:maximum=>50}})#проверка на существование и длину атрибута name
    validates(:email,{presence:true,format:{with: VALID_EMAIL_REGEX},uniqueness:{case_sensitive:false}}) #проверка на существование, формат и уникальность (регистронезависимую) атрибута email
    
    #В следующей строчке спрятана почти вся система аутентификации см. secure_password.rb
    has_secure_password
    validates(:password,{length:{minimum:6}})
end
