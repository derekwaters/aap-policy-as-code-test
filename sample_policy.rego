# Deploy with:
# podman run -p 8181:8181 -v <LOCALPOLICYFOLDER>:/policies:Z openpolicyagent/opa     run --server --log-level debug --addr=0.0.0.0:8181 /policies
# For ARM:
# podman run -p 8181:8181 -v <LOCALPOLICYFOLDER>:/policies:Z openpolicyagent/opa:1.6.0-dev-static-debug run --server --log-level debug --addr=0.0.0.0:8181 /policies

package aap_tests

has_change if {
    input.extra_vars.change_number.length > 0
}

has_incident if {
    input.extra_vars.incident_number.length > 0
}

is_compliant := allowed if {
    has_change OR has_incident
}
