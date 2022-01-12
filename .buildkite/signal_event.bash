#!/usr/bin/env bash
#
# Utility script to send an Event to Datadog for attribution in dashboard graphs.

set -o errexit
set -o nounset
set -o pipefail

#
# IMPLEMENTATION FUNCTIONS
#

readonly _EVENT_TYPE="$1" # "build"|"deploy_ecs"|"stop_ecs"
readonly _SERVICE="${2:-}"    # ECS service name or build slug

readonly _TITLE="Buildkite"
readonly _TAG="ecs_service:$_SERVICE"
readonly _SLUG="buildkite_slug:$_SERVICE"
readonly _KEY="$BUILDKITE_COMMIT"

#
# MAIN EXECUTION
#

# By consolidating build-step commands, this script is no longer only invoked on "develop", so add
# conditional inside to only emit for that branch.
if [ "$BUILDKITE_BRANCH" = "develop" ]; then
  if [ "$_EVENT_TYPE" = "build" ]; then
    text="Build completed"
    echo "_e{${#_TITLE},${#text}}:$_TITLE|$text|k:$_KEY|s:buildkite|t:info|#operation:build,$_SLUG" >/dev/udp/localhost/8125
  elif [ "$_EVENT_TYPE" = "deploy_ecs" ]; then
    text="Deploying service '$_SERVICE'"
    echo "_e{${#_TITLE},${#text}}:$_TITLE|$text|k:$_KEY|s:buildkite|t:info|#operation:deploy,$_TAG" >/dev/udp/localhost/8125
  elif [ "$_EVENT_TYPE" = "stop_ecs" ]; then
    text="Stopping service '$_SERVICE'"
    echo "_e{${#_TITLE},${#text}}:$_TITLE|$text|k:$_KEY|s:buildkite|t:info|#operation:stop,$_TAG" >/dev/udp/localhost/8125
  else
    echo "Aborting -- first argument must be 'build', 'deploy_ecs', or 'stop_ecs'"
    exit 1
  fi
fi
