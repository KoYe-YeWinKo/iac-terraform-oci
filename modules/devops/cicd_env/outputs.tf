output "build_pipeline_ocid" {
  description = "OCID of the build pipeline"
  value       = oci_devops_build_pipeline.build_pipeline.id
}