#!/bin/bash
# TODO: make preview name configurable!
previewName=preview-$CIRCLE_PR_NUMBER

if [ "$ACTION" = "start" ]; then
    response=$(curl -X POST -d "{\"auto_load_pod\": \"${AUTO_LOAD_POD:-${PARAM_AUTO_LOAD_POD}}\"}" \
        -H "ls-api-key: ${LOCALSTACK_API_KEY:-${PARAM_LOCALSTACK_API_KEY}}" \
        -H "authorization: token ${LOCALSTACK_API_KEY:-${LOCALSTACK_API_KEY}}" \
        -H "content-type: application/json" \
        "https://api.localstack.cloud/v1/previews/$previewName")
    endpointUrl=$(echo "$response" | jq -r .endpoint_url)
    if [ "$endpointUrl" = "null" ] || [ "$endpointUrl" = "" ]; then
        echo "Unable to create preview environment. API response: $response"
        exit 1
    fi
    echo "Created preview environment with endpoint URL: $endpointUrl"

    echo "export LS_PREVIEW_URL=$endpointUrl >> $BASH_ENV"
    echo "export AWS_ENDPOINT_URL=$endpointUrl >> $BASH_ENV"

    eval "$PREVIEW_CMD"
elif [ "$ACTION" = "stop" ]; then
    response=$(curl -X DELETE \
        -H "ls-api-key: ${LOCALSTACK_API_KEY:-${LOCALSTACK_API_KEY}}" \
        -H "authorization: token ${LOCALSTACK_API_KEY:-${LOCALSTACK_API_KEY}}" \
        -H "content-type: application/json" \
        "https://api.localstack.cloud/v1/previews/$previewName")
    if [[ "$response" != "{}" ]]; then
        # In case the deletion fails, e.g. if the instance cannot be found, we raise a proper error on the platform
        echo "Unable to delete preview environment. API response: $response"
        exit 1
    fi
else
    echo "Invalid action: $ACTION"
    exit 1
fi
