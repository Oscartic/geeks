class Author < ApplicationRecord
  has_many :books
  #Validaciones con test rspec
  validates :email, :first_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
