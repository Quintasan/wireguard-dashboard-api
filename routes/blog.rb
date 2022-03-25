class App
  hash_branch("hello") do |r|
    r.get String do |name|
      "Hello #{name}"
    end
  end
end
