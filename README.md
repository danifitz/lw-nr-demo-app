# lw-nr-demo-app

## Prerequisites

1. Install [New Relic Infrastructure agent](https://docs.newrelic.com/docs/infrastructure/install-infrastructure-agent/get-started/install-infrastructure-agent/)
2. Install [Lacework agent](https://docs.lacework.com/agent-installation-prerequisites)
3. Install [Node.js and npm](https://nodejs.org/en/download/) (min version 12)

## Usage

1. Clone the repo `git clone XXXX`
2. Replace the `license_key` in `newrelic.js` with a New Relic Ingest License key.
3. Make `scenario.sh` executable `chmod +x scenario.sh`
4. Run the script `./scenario.sh`

The script takes about 20 minutes to run. You should see data in New Relic APM + Infra views and
some critical/high events will be generated in Lacework after about 60 minutes.