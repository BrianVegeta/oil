class Product  < ActiveRecord::Base
  serialize :applicable_types

  belongs_to :photo

  validates :top_rate,                    numericality: { greater_than_or_equal_to: 1 }, unless: :not_top_rate?
  validates :zh_TW_title,                 presence: true
  validates :zh_TW_content,               presence: true
  validates :applicable_types_string,     presence: true

  def cover_src(size)
    if self.photo.nil?
      Photo::DEFAULT_IMG_SRC
    else
      self.photo.avatar.url(size)
    end
  end

  def applicable_types_string
    return '' if self.applicable_types.nil?
    self.applicable_types.join(', ')
  end

  def applicable_types_string=(value)
    self.applicable_types = value.split(",").map { |t| t.strip }
  end

  def trans_title
    if send(locale_prefix('title')).present?
      send(locale_prefix('title'))
    else
      zh_TW_title
    end
  end

  def trans_content
    if send(locale_prefix('content')).present?
      send(locale_prefix('content'))
    else
      zh_TW_content
    end
  end

  def trans_description
    if send(locale_prefix('description')).present?
      send(locale_prefix('description'))
    else
      zh_TW_description
    end
  end

  private
  def locale_prefix(column_name)
    # I18n.locale.to_s.downcase.gsub('-', '_') + '_' + column_name
    I18n.locale.to_s.gsub('-', '_') + '_' + column_name
  end

  def not_top_rate?
    self.top_rate.nil? || self.top_rate.blank?
  end
end