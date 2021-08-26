#!/usr/bin/env bash

#fetch the history
git pull --rebase
latestTag=$(git describe --tags --abbrev=0)
commitsSinceLastTag=$(git log $latestTag..HEAD)

# Check if there are commits since latest tag
if [ -n "$commitsSinceLastTag" ]; then
  echo "There are commits since last tag"

  latestTagNumber=""
  # Splits passed var by specified separator
  IFS='_'
  read -ra ADDR <<<"$latestTag"

  # Gets beta number
  latestTagNumber=${ADDR[1]}

  # Increases beta number
  latestTagNumber=$(($latestTagNumber + 1))
  echo $latestTagNumber

  # Generates new beta name and stores it
  newTagToPush="Beta_"${latestTagNumber}
  echo $newTagToPush
  export GIT_BETA_TAG="$newTagToPush"
  envman add --key GIT_BETA_TAG --value "$GIT_BETA_TAG"
else
  echo "There are NO commits since last tag"
  exit 1
fi
latestTag=$(git describe --tags --abbrev=0)
commitsSinceLastTag=$(git log $latestTag..HEAD)

# Check if there are commits since latest tag
if [ -n "$commitsSinceLastTag" ]; then
  echo "There are commits since last tag"

  latestTagNumber=""
  # Splits passed var by specified separator
  IFS='_'
  read -ra ADDR <<<"$latestTag"

  # Gets beta number
  latestTagNumber=${ADDR[1]}

  # Increases beta number
  latestTagNumber=$(($latestTagNumber + 1))
  echo $latestTagNumber

  # Generates new beta name and stores it
  newTagToPush="Beta_"${latestTagNumber}
  echo $newTagToPush
  export GIT_BETA_TAG="$newTagToPush"
  envman add --key GIT_BETA_TAG --value "$GIT_BETA_TAG"
else
  echo "There are NO commits since last tag"
  exit 1
fi