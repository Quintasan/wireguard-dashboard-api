require "roda"

class WireguardDashboard < Roda
  plugin :hash_routes

  Dir["routes/**/*.rb"].each do |route_file|
    load route_file
  end

  route do |r|
    r.hash_routes('')
  end
end
