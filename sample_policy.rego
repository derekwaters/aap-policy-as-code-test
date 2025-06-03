# Deploy with:
# podman run -p 8181:8181 -v <LOCALPOLICYFOLDER>:/policies:Z openpolicyagent/opa     run --server --log-level debug --addr=0.0.0.0:8181 /policies
# For ARM:
# podman run -p 8181:8181 -v <LOCALPOLICYFOLDER>:/policies:Z openpolicyagent/opa:1.6.0-dev-static-debug run --server --log-level debug --addr=0.0.0.0:8181 /policies

package aap_tests

default allowed := {
	"allowed": true,
	"violations": [],
}

violating_credentials := {cred.name | cred := input.credentials[_]; cred.organization == null}

default has_change_or_incident := false

has_change_or_incident if {
	count(input.extra_vars.change_number) > 0
}

has_change_or_incident if {
	count(input.extra_vars.incident_number) > 0
}

allowed := {
	"allowed": false,
	"violations": ["No change or incident number supplied"],
} if {
	has_change_or_incident == false
}

allowed := {
	"allowed": false,
	"violations": ["Credential with no Organization"],
} if {
	count(violating_credentials) > 0
}
