class Billboard < ApplicationRecord
  has_many :artists, dependent: :destroy
end
