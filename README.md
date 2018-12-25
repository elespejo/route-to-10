<p align="center">
  <img src="https://www.lucidchart.com/publicSegments/view/f998d4d1-5beb-424a-b14f-a210db83c3f7/image.png">
</p>

<h1 align="center"> route-to-10 </h1>
<p align="center">
  <b ></b>
</p>
<br>

# Dependency
```
sudo apt install make
```

# Quick start

### Preparation
1. connect all the devices as the topology above
2. config `router` and `sub router` as a router
3. check whether devices get ip
4. login `Router`
5. download project
    ```bash
    git clone https://github.com/elespejo/route-to-10.git
    cd route-to-10/
    ```
6. modify the `src/setting.env` about LAN
    
    e.g:
    ```env
    # src/setting
    LAN=br0
    ```

7. modify the `src/Makefile`

    e.g:
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
    `192.168.0.219` and `192.168.0.222` are the ips of `sub router`. `10.10.10.0/25` and `10.10.10.128/25` are the target sub nets. You can modify them to match your situation.

### Install
```
make install
make test_install
```
The service is active and test are pass.

### Uninstall
```
make uninstall
make test_uninstall
```
The service is inactive and test are pass.