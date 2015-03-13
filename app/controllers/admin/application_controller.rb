class Admin::ApplicationController < ApplicationController
	before_action :authenticate_user!
	before_action :set_locale
	layout 'admin/application'

	def set_locale
		I18n.locale = 'zh-TW'
	end

  def check_super_admin
    redirect_to admin_root_path unless current_user.is_super_admin
  end

  def check_product_admin
    redirect_to admin_root_path unless current_user.is_product_manager
  end
end