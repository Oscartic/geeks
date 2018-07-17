class Author < ApplicationRecord
  # Relacion polimorfica con review:
  has_many :reviews, as: :reviewable
  has_many :books
  #Validaciones con test rspec
  #validates :email, :first_name, presence: true

  REDIRECTED_AUTHORS = { '14' => 7, '25' => 2 }

  def to_s
    "#{first_name} #{last_name}"
  end
end
