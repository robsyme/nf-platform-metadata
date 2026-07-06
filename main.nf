process HELLO {
    output:
    stdout

    script:
    """
    echo "Hello from ${workflow.runName}"
    """
}

workflow {
    log.info "=== workflow.platform (workflow body) ==="
    workflow.platform.properties
        .findAll { k, v -> !(k in ['class', 'log']) }
        .sort()
        .each { k, v -> log.info "  ${k.padRight(12)}: ${v}" }

    HELLO() | view
}
