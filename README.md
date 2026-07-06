# nf-platform-metadata

Minimal Nextflow pipeline that prints the `workflow.platform` metadata, both at
the start of the workflow body and in the `onComplete` handler.

The `workflow.platform` namespace is populated when the run reports to Seqera
Platform (`tower.enabled` or launched from Platform). Outside of Platform every
field prints as `null`.

Fields printed:

- `workflowId` and `workflowUrl` (watch URL requires Platform 26.01+)
- `user` (id, userName, organization)
- `workspace` (id, name, fullName, organization)
- `computeEnv` and `pipeline` (only set for runs launched from Platform)
- `labels`
- `schedRunId` (only set for Seqera Intelligent Compute runs, after the first
  task is submitted, and requires Nextflow 26.06.0-edge or later)

Requires Nextflow 26.03.2-edge or later for the full metadata; 26.02.0-edge
only exposes `workflowId`.

## Usage

```
nextflow run robsyme/nf-platform-metadata -with-tower
```

or launch it from Seqera Platform to see the compute environment and pipeline
details populated as well.
