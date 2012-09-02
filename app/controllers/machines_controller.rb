class MachinesController < ApplicationController
	before_filter :require_user
	def index
		@machines = Array.new
		@machines_fullinfo = Array.new
		APP_CONFIG['servers'].each do |server|
			mac = Machine.new
			fullinfo = mac.get_full_info(server)
			@machines_fullinfo.push(fullinfo)
		end
	end

	def activate_service
		server = Machine.new
		server.activate(params[:server_name],params[:service])
		respond_to do |format|
	  		format.html { redirect_to root_path, notice: "#{params[:service]} was activated" }
		end
	end

	def deactivate_service
		server = Machine.new
		server.deactivate(params[:server_name],params[:service])
		respond_to do |format|
	  		format.html { redirect_to root_path, notice: "#{params[:service]} was deactivated" }
		end
	end
end
