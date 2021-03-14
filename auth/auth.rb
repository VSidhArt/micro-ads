class Auth
 def call (env)
    [200, {"Content-Type" => "text/html; charset=utf-8"}, ["Hello World"]]
 end
end
