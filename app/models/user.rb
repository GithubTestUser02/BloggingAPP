class User < ApplicationRecord
    has_many :articles
    has_secure_password
    validates :username, presence:true, length:{minimum:3, maximum:25}, uniqueness: true
    VALID_EMAIL_REGEX= /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence:true, length:{maximum:105}, uniqueness: true, format:{with: VALID_EMAIL_REGEX}
    validates :password,confirmation: true,presence: true
end