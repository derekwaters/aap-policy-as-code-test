# aap-policy-as-code-test

To install the OPA server as a systemd service:

* sudo cp opa.container /etc/containers/systemd/
* sudo systemctl daemon-reload
* sudo systemctl start opa.service
* sudo systemctl status opa.service
