# To change this template, choose Tools | Templates
# and open the template in the editor.

load "callfire.rb"
call_fire = Callfire::Client.new("c6da6a66a25ee44071ff49db722c9f8c1ebd2315")
response = call_fire.set_callback_url("http://franchisesforsale.org/leads", true)
puts response.to_json
puts Callfire::VERSION
