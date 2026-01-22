#!/usr/bin/env sh

echo 'matrix<<EOF'
echo '{'
echo '  "include": ['
echo '    { "runs-on": "ubuntu-24.04", "image": "ubuntu:latest", "platform": "linux/amd64" },'
echo '    { "runs-on": "ubuntu-24.04-arm", "image": "ubuntu:latest", "platform": "linux/arm64" },'
echo '    { "runs-on": "ubuntu-24.04-arm", "image": "debian:latest", "platform": "linux/arm64" }'
echo '  ]'
echo '}'
echo EOF
