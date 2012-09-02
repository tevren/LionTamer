class Machine 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
      puts "#{name}=#{value}"
    end
  end

  def persisted?
    false
  end

  def get_server_name(server)
    name = %x[ssh #{server} hostname]
  end

  def get_full_info(server_name)
    server = LionAdmin::Base.new(server_name)
    name = server.hostname
    machine_serial = server.serialnumber
    services = server.services
    warranty = OSXwarranty::Base.new
    warranty_info = warranty.info(machine_serial)
    return {:name => name, :serial => machine_serial, :services => services, :warranty_info => warranty_info}
  end

  def activate(server_name, service)
    server = LionAdmin::Base.new(server_name)
    server.start_service(service)
  end

  def deactivate(server_name, service)
    server = LionAdmin::Base.new(server_name)
#    raise service.to_s
    server.stop_service(service)
  end
end