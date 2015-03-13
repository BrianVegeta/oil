class Product  < ActiveRecord::Base
  serialize :applicable_types

  belongs_to :photo

  validates :zh_TW_title,                 presence: true
  validates :zh_TW_content,               presence: true
  validates :applicable_types_string,     presence: true

  def applicable_types_string
    return '' if self.applicable_types.nil?
    self.applicable_types.join(', ')
  end

  def applicable_types_string=(value)
    self.applicable_types = value.split(",").map { |t| t.strip }
  end
end