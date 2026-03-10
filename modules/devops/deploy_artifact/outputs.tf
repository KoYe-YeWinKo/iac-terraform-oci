output "devops_deploy_artifact_id" {
  description = "The OCID of the DevOps Deploy Artifact resource created."
  value       = oci_devops_deploy_artifact.deploy_artifact.id
}