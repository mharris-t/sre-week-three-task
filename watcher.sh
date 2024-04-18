#TODO

NAMESPACE="sre"
POD_NAME=$(kubectl get pods -n sre --no-headers -o custom-columns=":metadata.name" | grep 'swype' | head -n 1)
MAX_RESTART_COUNT=5

# Fetch the restart count using kubectl and jq to parse the JSON output
#RESTART_COUNT=$(kubectl get pod $POD_NAME -n $NAMESPACE -o json | jq '.status.containerStatuses[0].restartCount')

#echo "The restart count of the pod $POD_NAME is: $RESTART_COUNT"

while true
do
  echo -e 'Checking pod restarts...\n'
  RESTART_COUNT=$(kubectl get pod $POD_NAME -n $NAMESPACE -o json | jq '.status.containerStatuses[0].restartCount')
  echo -e "The restart count of the pod $POD_NAME is: $RESTART_COUNT \n"

  if [ $RESTART_COUNT -gt $MAX_RESTART_COUNT ]; then
    echo -e "The pod $POD_NAME restarted more than $MAX_RESTART_COUNT times \n"
    echo -e "Scaling down $POD_NAME to 0...."

    kubectl scale pod $POD_NAME --replicas=0 -n $NAMESPACE
    break
  fi

  sleep 60

done
