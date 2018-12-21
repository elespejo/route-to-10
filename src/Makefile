
include $(CURDIR)/setting.env

.PHONY: start stop
start:
	ip route add 10.10.10.0/25 via 192.168.0.219 dev $(LAN)
	ip route add 10.10.10.128/25 via 192.168.0.222 dev $(LAN)
	ip route

stop:
	ip route del 10.10.10.0/25 via 192.168.0.219 dev $(LAN)
	ip route del 10.10.10.128/25 via 192.168.0.222 dev $(LAN)
	ip route
