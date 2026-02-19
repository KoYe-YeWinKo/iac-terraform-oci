output "deploy_pipeline_ocid" {
  description = "The OCID of the DevOps deployment pipeline."
  value       = module.devops_deploy_pipeline.deploy_pipeline_ocid
}