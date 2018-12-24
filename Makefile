CONF_DIR=$(CURDIR)/src
WORKING_DIR=/etc/route10
SERVICE_DIR=/etc/systemd/system

.PHONY: config test_config
config:
	sudo mkdir -p $(WORKING_DIR)
	sudo cp $(CONF_DIR)/Makefile $(WORKING_DIR)
	sudo cp $(CONF_DIR)/setting.env $(WORKING_DIR)
	sudo cp $(CONF_DIR)/route10.service $(SERVICE_DIR)
test_config:
	python3 validator.py -f $(WORKING_DIR)
	python3 validator.py -f $(WORKING_DIR)/setting.env
	python3 validator.py -f $(WORKING_DIR)/Makefile
	python3 validator.py -f $(SERVICE_DIR)/route10.service


.PHONY: restore test_restore
restore:
	sudo rm -r $(WORKING_DIR)
	sudo rm $(SERVICE_DIR)/route10.service
test_restore:
	python3 validator.py -f $(WORKING_DIR) -e
	python3 validator.py -f $(SERVICE_DIR)/route10.service -e 


.PHONY: start test_start
start:
	sudo systemctl enable route10.service
	sudo systemctl start route10.service	
test_start:
	sudo systemctl status route10.service || true


.PHONY: stop test_stop
stop:
	sudo systemctl stop route10.service
	sudo systemctl disable route10.service
	sudo systemctl daemon-reload
test_stop:
	sudo systemctl status route10.service || true


.PHONY: install test_install
install: config start
test_install: test_config test_start


.PHONY: uninstall test_uninstall
uninstall: stop restore
test_uninstall: test_stop test_restore
