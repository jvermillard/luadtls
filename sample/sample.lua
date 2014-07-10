-- update path to make the sample runnable easily
package.path = './?/init.lua;' .. package.path

local dtls = require 'dtls'
local socket = require 'socket'

-- create UDP socket
local udp = socket.udp();
udp:setsockname('*', 5683)

-- change UDP socket in DTLS socket
dtls.wrap(udp,"PSK") -- ECC is managed too. (key is hard coded for now)

-- DTLS handshake in automaticaly do at first connection communicate
udp:sendto("my clear data","127.0.0.1", 5684)
repeat
  local data, host, port, msg = udp:receivefrom()
  -- receive clear data
  print ("receive clear data",data, host, port)
until false
