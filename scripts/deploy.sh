SCRIPT_DIR=$(dirname $0)
ROOT=$(cd $SCRIPT_DIR/..; pwd)
SERVICE_ACCOUNT_JSON='svc_account.json'

cd $ROOT
echo $SERVICE_ACCOUNT_KEY_BASE64 | base64 --decode > $SERVICE_ACCOUNT_JSON

gcloud auth activate-service-account --key-file  --project $PROJECT_ID
gloud app deploy
