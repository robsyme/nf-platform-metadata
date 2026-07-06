process HELLO {
    output:
    stdout

    script:
    """
    echo "Hello from ${workflow.runName}"
    """
}

def printPlatform(String phase) {
    println "=== workflow.platform (${phase}) ==="
    workflow.platform.properties
        .findAll { k, v -> !(k in ['class', 'log']) }
        .sort()
        .each { k, v -> println "  ${k.padRight(12)}: ${v}" }
}

workflow {
    printPlatform('workflow body')
    HELLO() | view

    workflow.onComplete {
        printPlatform('onComplete')
    }
}
