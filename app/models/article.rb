class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true,length:{minimun:3,maximum:35}
    validates :description,presence: true,length:{minimum:6,maximum:300}
end