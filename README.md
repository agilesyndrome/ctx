# Ctx : Secure environments in and outside of Docker

## Background

This tool was created because I have an M1 mac, but need access to older copies of Terraform. Docker is a great tool for this, but needs some tooling to ensure my shell context remain similar. I also needed to ensure that the environment variables loaded into my shell would carry in.

## Requirements

* You should be using ZSH and Oh-My-ZSH locally for this to work seemlessly.
* You need `envchain` (brew install envchain) locally on your Macbook
* You must create at least one environment (envchain -s devphobe-production SOME_ENV_VAR_TO_SET)

## Usage

* To shell into this context locally on your Macbook `ctx devphobe-production`
* To create a Docker shell `dctx devphobe-production`

## Defaults

Each default shell comes with ASDF, JQ, and the AWSCLIv2.


## How it works

We create a ~/.ctx/`CTX_NAME` folder on your macbook that is shared between both the docker and local shells
The tool will mount your current working directory `${PWD}` into the Docker containers /workspace folder


