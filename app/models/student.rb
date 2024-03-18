class Student < ApplicationRecord
  attribute :enrollment_date, :date, default: -> { Date.today }

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :enrollment_date, presence: true

  # getter
  def full_name
    "#{first_name} #{last_name}"
  end

  def first_name
    read_attribute(:first_name).to_s
  end

  def last_name
    read_attribute(:last_name).to_s
  end

  def email
    read_attribute(:email).to_s
  end

  def student_id
    read_attribute(:id).to_s
  end

  def enrollment_date
    read_attribute(:enrollment_date)
  end


  # setter
  def first_name=(value)
    write_attribute(:first_name, value.to_s.titleize)
  end

  def last_name=(value)
    write_attribute(:last_name, value.to_s.titleize)
  end

  def email=(value)
    write_attribute(:email, value.to_s.downcase)
  end

  def enrollment_date=(value)
    write_attribute(:enrollment_date, value.to_s)
  end
end
