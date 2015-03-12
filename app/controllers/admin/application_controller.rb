class Admin::ApplicationController < ApplicationController
	before_action :authenticate_user!
	before_action :set_locale
	layout 'admin/application'

	def set_locale
		I18n.locale = 'en'
	end
end