# nf-platform-metadata

Minimal Nextflow pipeline that prints the `workflow.platform` metadata, with
each property referenced explicitly so the output doubles as a reference for
the available property paths.

The `workflow.platform` namespace is populated when the run reports to Seqera
Platform (`tower.enabled` or launched from Platform). Outside of Platform every
field prints as `null`.

Properties printed:

- `workflowId` and `workflowUrl` (watch URL requires Platform 26.01+)
- `user` (id, userName, organization)
- `workspace` (id, name, fullName, organization)
- `computeEnv` and `pipeline` (only set for runs launched from Platform)
- `labels`

Not printed here: `workflow.platform.schedRunId`, the Seqera Intelligent
Compute scheduler run ID. It requires Nextflow 26.06.0-edge or later and is
only assigned after the first task is submitted, so it must be read in an
`onComplete` handler.

Requires Nextflow 26.03.2-edge or later for the full metadata; 26.02.0-edge
only exposes `workflowId`.

## Usage

```
nextflow run robsyme/nf-platform-metadata -with-tower
```

or launch it from Seqera Platform to see the compute environment and pipeline
details populated as well.
