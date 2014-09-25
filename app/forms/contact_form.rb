class ContactForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :sender_name, :sender_addr, :sender_message

  validates :sender_name, :sender_addr, :sender_message,
    presence: true
  validates :sender_name,
    format: {
      with: /[[:alpha:][-][\s][\.]]+/i,
      message: 'can only contain letters, spaces, dots and “-”'
    },
    length: {
      minimum: 2,
      message: 'must be at least 2 characters long'
      }
  validates :sender_addr,
    format: {
      with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i,
      message: 'is invalid'
    }

  def initialize attributes = {}
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
