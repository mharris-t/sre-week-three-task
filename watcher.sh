#TODO

NAMESPACE="sre"
POD_NAME=$(kubectl get pods -n sre --no-headers -o custom-columns=":metadata.name" | grep 'swype' | head -n 1)

# Fetch the restart count using kubectl and jq to parse the JSON output
#RESTART_COUNT=$(kubectl get pod $POD_NAME -n $NAMESPACE -o json | jq '.status.containerStatuses[0].restartCount')

#echo "The restart count of the pod $POD_NAME is: $RESTART_COUNT"

while true
do
  echo -e 'Checking pod restarts...\n'
  RESTART_COUNT=$(kubectl get pod $POD_NAME -n $NAMESPACE -o json | jq '.status.containerStatuses[0].restartCount')
  echo -e "The restart count of the pod $POD_NAME is: $RESTART_COUNT \n"
  sleep 1

  if [ $RESTART_COUNT -gt 1 ]; then
    echo "pod restarted"
    break
  fi
done
