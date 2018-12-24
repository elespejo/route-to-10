# route-to-10

# Description
This project redirect data to the subnet on ubuntu 16.04.


# Topology
<p align="center">
  <img src="https://www.lucidchart.com/publicSegments/view/f998d4d1-5beb-424a-b14f-a210db83c3f7/image.png">
</p>


# Dependence
```
sudo apt install make
```

# quick start

### Preparation
1. connect all the devices like the topology above.
2. config `router` and `sub router` as a router.
3. check whether devices get ip.
4. login `Router`.
5. download project.
    ```bash
    git clone https://github.com/elespejo/route-to-10.git
    cd route-to-10/
    ```
6. Modify the `src/setting.env` about LAN 
    ```env
    # src/setting
    LAN=br0
    ```

7. Modify the `src/Makefile`
    ```make
    # src/Makefile
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
    ```
    The ip `192.168.0.219` and `192.168.0.222` is the ip of `sub router`. The `10.10.10.0/25` and `10.10.10.128/25` is the sub net. You can modify them to match your situation.

### Install
```
make install
make test_install
```

### Uninstall
```
make uninstall
make test_uninstall
```