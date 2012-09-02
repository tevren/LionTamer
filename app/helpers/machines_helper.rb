module MachinesHelper
	def check_status(server,service)
		APP_CONFIG['servers'].each do |sr|
			if sr.match("#{server}")
				machine = LionAdmin::Base.new(sr)
				status = machine.check_if_running(service)
				return status
			end
		end
	end

	def fullstatus(server,service)
		APP_CONFIG['servers'].each do |sr|
			if sr.match("#{server}")
				machine = LionAdmin::Base.new(sr)
				fullstatus = machine.fullstatus(service)
				return fullstatus
			end
		end
	end

	def readlog(server,log)
		APP_CONFIG['servers'].each do |sr|
			if sr.match("#{server}")
				logfile = %x[ssh #{sr} tail -50 #{log}]
				return logfile
			end
		end
	end
end
