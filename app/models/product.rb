class Product  < ActiveRecord::Base
  CATEGORIES = {
    1 => 'KK機車油',
    2 => 'KK機車油＆副產品',
    3 => 'WT汽車油',
    4 => 'WT汽車油＆副產品',
    5 => '大車專區',
    6 => '其他代理產品'
  }

  def self.cates
    {
      1 => I18n.t('product.category.kk_motor'),
      2 => I18n.t('product.category.kk_motor_others'),
      3 => I18n.t('product.category.wt_car'),
      4 => I18n.t('product.category.wt_car_others'),
      5 => I18n.t('product.category.cart_area'),
      6 => I18n.t('product.category.others')
    }
  end

  serialize :zh_TW_applicables
  serialize :zh_CN_applicables
  serialize :en_applicables

  belongs_to :photo

  # State machine
  state_machine :state, initial: :draft do
    state :draft
    state :public

    event :open do
      transition :draft => :public
    end

    event :close do
      transition :public => :draft
    end
  end

  # callbakcs

  # validates
  validates :top_rate,            numericality: { greater_than_or_equal_to: 1 }, unless: :not_top_rate?
  validates :zh_TW_title,         presence: true
  validates :zh_TW_content,       presence: true
  validates :zh_TW_applicable_s,  presence: true

  def cover_src(size)
    if self.photo.nil?
      Photo::DEFAULT_IMG_SRC
    else
      self.photo.avatar.url(size)
    end
  end

  ['zh_TW', 'zh_CN', 'en'].each do |lang|
    define_method("#{lang}_applicable_s") do
      return '' if self.send("#{lang}_applicables").nil?
      self.send("#{lang}_applicables").join(', ')
    end

    define_method("#{lang}_applicable_s=") do |value|
      self.send("#{lang}_applicables=", value.split(",").map { |t| t.strip })
    end

  end

  ['title', 'content', 'description', 'applicables'].each do |col|
    define_method("trans_#{col}") do
      col_with_lang = self.send locale_prefix(col)
      if col_with_lang.present?
        col_with_lang
      else
        self.send("zh_TW_#{col}")
      end
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
