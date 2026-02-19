output "deploy_pipeline_ocid" {
  description = "The OCID of the DevOps deployment pipeline."
  value       = oci_devops_deploy_pipeline.deploy_pipeline.id
}