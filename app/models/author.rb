class Author < ApplicationRecord
  # Relacion polimorfica con review:
  has_many :reviews, as: :reviewable
  has_many :books
  # Validaciones con test rspec
  # validates :email, :first_name, presence: true
  # Ejemplo de un before_save
  before_save :clean_name

  REDIRECTED_AUTHORS = { '14' => 7, '25' => 2 }

  def to_s
    "#{first_name} #{last_name}".strip
  end

  private
  def clean_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end
