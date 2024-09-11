#!/bin/bash
docker build -t docker-image . 
nitro-cli build-enclave --docker-uri docker-image --output-file enclave.eif
nitro-cli run-enclave --eif-path enclave.eif --cpu-count 2 --memory 1024 --debug-mode
nitro-cli console --enclave-id $(nitro-cli describe-enclaves | jq -r '.[0].EnclaveID')
