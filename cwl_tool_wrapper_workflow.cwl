#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

# To wrap the CWL tool in a workflow you will still need to specify the inputs and outputs
inputs:
  ## Specify the inputs to the CWL workflow here
  ## They will be the same as the CWL tool inputs
   message: string

outputs:
  ## Specify the outputs from the CWL workflow here
  ## They will be the same as the outputs from the CWL tool
   []

steps:
  cwl_tool_wrapper_workflow_step:
    in:
      ## Specify the inputs to the CWL tool here
       message: message
    out:
      ## Specify the outputs from the CWL tool here
       []
    run:
      # Specify the descriptor for the CWL tool below by choosing the appropriate embedding method
      #
      # If the CWL tool is already registered in Dockstore you can simply embed a TRS URL
      # The TRS URL can be found on the Dockstore public page for the tool
       $import: https://dockstore.org/api/ga4gh/trs/v2/tools/quay.io%2Fucsc_cgl%2Fsimple_python/versions/develop/plain-CWL/descriptor//cwl_message_tool/cwl_message_tool.cwl
      #
      # OR
      #
      # Use the name of the CWL file that contains the tool description
      # (this might not work if there are dependencies in the tool CWL that cannot be resolved)
      # ./cwl_message_tool/cwl_message_tool.cwl
      #
      ## OR
      #
      # A URL to the repository location of the tool CWL
      # (this might not work if there are dependencies in the tool CWL that cannot be resolved)
      # $import: https://raw.githubusercontent.com/DataBiosphere/cwl-tool-wrapper-workflow/develop/cwl_message_tool/cwl_message_tool.cwl
      #
      # OR
      #
      ## Embed the entire CWL tool specification as done in the example below
      #
      # class: CommandLineTool
      # hints:
      #   DockerRequirement:
      #     dockerPull: quay.io/ucsc_cgl/simple_python:latest
      #
      #   InitialWorkDirRequirement:
      #     listing:
      #       - entryname: myscript.py
      #         entry: |-
      #           print("$(inputs.message)")
      #
      # baseCommand:  ["python", "myscript.py"]
      # inputs:
      #   message:
      #     type: string
      #     inputBinding:
      #       position: 1
      # outputs: []

