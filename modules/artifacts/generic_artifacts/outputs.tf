output "artifact_repository_id" {
  description = "The OCID of the artifacts repository"
  value       = oci_artifacts_repository.repository.id
}

output "generic_artifacts_ids" {
  description = "The OCIDs of the generic artifacts created in the repository"
  value       = [for artifact in oci_artifacts_generic_artifact.generic_artifact : artifact.id]
}