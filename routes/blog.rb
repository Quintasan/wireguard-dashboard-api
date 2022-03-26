class WireguardDashboard
  hash_branch("hello") do |r|
    r.get String do |name|
      "Hello #{name} lol"
    end
  end
end
