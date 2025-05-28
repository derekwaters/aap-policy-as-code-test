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
