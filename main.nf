process HELLO {
    output:
    stdout

    script:
    """
    echo "Hello from ${workflow.runName}"
    """
}

workflow {
    log.info """\
        workflow.platform.workflowId             : ${workflow.platform.workflowId}
        workflow.platform.workflowUrl            : ${workflow.platform.workflowUrl}
        workflow.platform.user.id                : ${workflow.platform.user?.id}
        workflow.platform.user.userName          : ${workflow.platform.user?.userName}
        workflow.platform.user.organization      : ${workflow.platform.user?.organization}
        workflow.platform.workspace.id           : ${workflow.platform.workspace?.id}
        workflow.platform.workspace.name         : ${workflow.platform.workspace?.name}
        workflow.platform.workspace.fullName     : ${workflow.platform.workspace?.fullName}
        workflow.platform.workspace.organization : ${workflow.platform.workspace?.organization}
        workflow.platform.computeEnv.id          : ${workflow.platform.computeEnv?.id}
        workflow.platform.computeEnv.name        : ${workflow.platform.computeEnv?.name}
        workflow.platform.computeEnv.platform    : ${workflow.platform.computeEnv?.platform}
        workflow.platform.pipeline.id            : ${workflow.platform.pipeline?.id}
        workflow.platform.pipeline.name          : ${workflow.platform.pipeline?.name}
        workflow.platform.pipeline.revision      : ${workflow.platform.pipeline?.revision}
        workflow.platform.pipeline.commitId      : ${workflow.platform.pipeline?.commitId}
        workflow.platform.labels                 : ${workflow.platform.labels}
        """.stripIndent()

    HELLO() | view
}
