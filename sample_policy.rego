# Deploy with:
# podman run -p 8181:8181 -v <LOCALPOLICYFOLDER>:/policies:Z openpolicyagent/opa     run --server --log-level debug --addr=0.0.0.0:8181 /policies
# For ARM:
# podman run -p 8181:8181 -v <LOCALPOLICYFOLDER>:/policies:Z openpolicyagent/opa:1.6.0-dev-static-debug run --server --log-level debug --addr=0.0.0.0:8181 /policies

package aap_tests

default is_allowed := false

allowed := {
	"allowed": is_allowed,
	"violations": [],
}

is_allowed if {
	count(input.extra_vars.change_number) > 0
}

is_allowed if {
	count(input.extra_vars.incident_number) > 0
}


