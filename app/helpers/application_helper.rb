module ApplicationHelper
	def app_revision
		revision_file = File.join(Rails.root, "VERSION")
		if File.readable?(revision_file)
			IO.read(revision_file)
		else
			"unknown"
		end
	end
end
