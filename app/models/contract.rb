class Contract < ApplicationRecord
    has_many :comments, dependent: :destroy
end
