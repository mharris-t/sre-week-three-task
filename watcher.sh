#TODO

NAMESPACE="sre"
POD_NAME="my-pod"

# Fetch the restart count using kubectl and jq to parse the JSON output
RESTART_COUNT=$(kubectl get pod $POD_NAME -n $NAMESPACE -o json | jq '.status.containerStatuses[0].restartCount')

echo "The restart count of the pod is: $RESTART_COUNT"


kubectl get pods -n sre --no-headers -o custom-columns=":metadata.name" | grep 'swype' | head -n 1