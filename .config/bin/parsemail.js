#!/usr/bin/env node

const { simpleParser } = require('mailparser')

process.stdin.on('readable', () => {
    const chunk = process.stdin.read()

    if (!chunk)
        return

    simpleParser(chunk)
        .then(
            parsed => console.log(
                process.argv[2] ? parsed[process.argv[2]] : parsed
            ),
            console.error.bind(console)
        )
})
