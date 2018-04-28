class Suit < ApplicationRecord
  belongs_to :author
  belongs_to :lawyer

  validates_presence_of :descricao, :author_id
end
