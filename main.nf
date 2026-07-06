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

    // `workflow` is not visible inside the onComplete closure (its delegate is
    // the script binding map), so capture the metadata object in a local
    def platform = workflow.platform
    workflow.onComplete {
        log.info "=== workflow.platform (onComplete) ==="
        platform.properties
            .findAll { k, v -> !(k in ['class', 'log']) }
            .sort()
            .each { k, v -> log.info "  ${k.padRight(12)}: ${v}" }
    }
}
