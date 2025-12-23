# aap-policy-as-code-test

To install the OPA server as a systemd service:

* sudo cp opa.container /etc/containers/systemd/
* sudo systemctl daemon-reload
* sudo systemctl start opa.service
* sudo systemctl status opa.service

Now you can push a policy to OPA:

curl -H "Content-Type: text/plain" -X PUT --data-binary "@sample_policy.rego" localhost:8181/v1/policies/aap_tests

and test it:

curl -H "Content-Type: application/json" -X POST --data-binary '{"input": {"extra_vars": {"change_number": "CHG-001"} } }' localhost:8181/v1/data/aap_tests/allowed
