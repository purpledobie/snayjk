package snyk
orgs := ["9ff4ae2d-3cac-4259-97de-ea3a395f41ac"]
default workload_events = false
workload_events {
	input.metadata.namespace != "snyk-monitor"
	input.metadata.namespace != "harness"
	input.metadata.namespace != "harness-delegate"
	input.kind != "Job"
	input.kind != "Pod"
}
