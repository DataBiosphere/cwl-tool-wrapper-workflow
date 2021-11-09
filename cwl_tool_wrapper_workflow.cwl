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
      # Use the name of the CWL file that contains the tool description
      ./cwl_message_tool/cwl_message_tool.cwl
      #
      ## OR
      #
      ## Embed the entire CWL tool specification below as in the example commented out CWL tool
      #
      # class: CommandLineTool
      # hints:
      #   DockerRequirement:
      #     dockerPull: quay.io/mydockerrepo/myimage:latest
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
      #
      ## OR
      #
      ## If the CWL tool is already registered in Dockstore you can simply embed a TRS URL instead of embedding the tool CWL class
        #$import: https://dockstore.org/api/ga4gh/trs/v2/tools/quay.io%2Fmyrepo%2Fmycwltool/versions/latest/plain-CWL/descriptor//mytool.cwl
        ####$import: https://dockstore.org/api/ga4gh/trs/v2/tools/quay.io%2Fwshands%2Fwalts_python/versions/latest/plain-CWL/descriptor//hello_world.cwl
