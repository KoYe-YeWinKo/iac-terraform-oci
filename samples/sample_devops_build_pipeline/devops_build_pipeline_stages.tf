resource "oci_devops_build_pipeline_stage" "build_stage_1" {
  build_pipeline_id         = module.devops_build_pipeline.build_pipeline_ocid
  display_name              = "build_stage_1"
  build_pipeline_stage_type = "BUILD"
  description               = "Compile sources"
  freeform_tags             = {}
  defined_tags              = {}

  build_pipeline_stage_predecessor_collection {
    items {
      id = module.devops_build_pipeline.build_pipeline_ocid
    }
  }
  build_runner_shape_config {
    build_runner_type = "CUSTOM"
    memory_in_gbs     = 4
    ocpus             = 1
  }
  build_source_collection {
    items {
      branch          = "main"
      connection_type = "DEVOPS_CODE_REPOSITORY"
      connection_id   = null
      name            = "sample-devops-repository-1"
      repository_id   = "ocid1.devopsrepository.oc1.ap-tokyo-1.amaaaaaa7eadd2yafqd7ksqmuu4riztlf7l75bfwjpokwhitduqs3rlcslnq"
      repository_url  = "https://devops.scmservice.ap-tokyo-1.oci.oraclecloud.com/namespaces/nrmep3zrjexw/projects/sample-devops-project/repositories/sample-devops-repository-1"
    }
  }
  build_spec_file = "build_spec.yaml"
  #deliver_artifact_collection {
  #    items {
  #      artifact_id   = artifact_id
  #      artifact_name = rtifact_name
  #    }
  #  }

  deploy_pipeline_id             = null
  image                          = "OL7_X86_64_STANDARD_10"
  is_pass_all_parameters_enabled = null
  primary_build_source           = null

  #private_access_config {
  #    network_channel_type = network_channel_type
  #    nsg_ids              = nsg_ids
  #    subnet_id            = subnet_id
  #}

  stage_execution_timeout_in_seconds = null

  #wait_criteria {
  #    wait_type     = wait_type
  #    wait_duration = wait_duration
  #}
}

resource "oci_devops_build_pipeline_stage" "build_stage_2" {
  build_pipeline_id         = module.devops_build_pipeline.build_pipeline_ocid
  display_name              = "build_stage_2"
  build_pipeline_stage_type = "BUILD"
  description               = "Compile sources"
  freeform_tags             = {}
  defined_tags              = {}

  build_pipeline_stage_predecessor_collection {
    items {
      id = oci_devops_build_pipeline_stage.build_stage_1.id
    }
  }
  build_runner_shape_config {
    build_runner_type = "CUSTOM"
    memory_in_gbs     = 4
    ocpus             = 1
  }
  build_source_collection {
    items {
      branch          = "main"
      connection_type = "DEVOPS_CODE_REPOSITORY"
      connection_id   = null
      name            = "sample-devops-repository-1"
      repository_id   = "ocid1.devopsrepository.oc1.ap-tokyo-1.amaaaaaa7eadd2yafqd7ksqmuu4riztlf7l75bfwjpokwhitduqs3rlcslnq"
      repository_url  = "https://devops.scmservice.ap-tokyo-1.oci.oraclecloud.com/namespaces/nrmep3zrjexw/projects/sample-devops-project/repositories/sample-devops-repository-1"
    }
  }
  build_spec_file = "build_spec.yaml"
  #deliver_artifact_collection {
  #    items {
  #      artifact_id   = artifact_id
  #      artifact_name = rtifact_name
  #    }
  #  }

  deploy_pipeline_id             = null
  image                          = "OL7_X86_64_STANDARD_10"
  is_pass_all_parameters_enabled = null
  primary_build_source           = null

  #private_access_config {
  #    network_channel_type = network_channel_type
  #    nsg_ids              = nsg_ids
  #    subnet_id            = subnet_id
  #}

  stage_execution_timeout_in_seconds = null

  #wait_criteria {
  #    wait_type     = wait_type
  #    wait_duration = wait_duration
  #}
}

