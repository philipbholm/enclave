#!/bin/bash
docker build -t server . 
nitro-cli build-enclave --docker-uri server --output-file enclave.eif
nitro-cli run-enclave --eif-path enclave.eif --cpu-count 2 --memory 1024 --debug-mode
nitro-cli console --enclave-id $(nitro-cli describe-enclaves | jq -r '.[0].EnclaveID')
sleep 3

nitro-cli terminate-enclave --all
