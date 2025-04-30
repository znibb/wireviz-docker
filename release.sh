#!/bin/sh

USER=znibb
NAME=wireviz

# Check if `jq` command is available
if ! command -v jq 2>&1 > /dev/null; then
    echo "Requires jq to be installed and in PATH"
    exit 1
fi

# Check that required argument is given
if [ $# -eq 0 ]; then
    echo "Pushes $USER/$NAME:<TAG> and $USER/$NAME:latest to remote"
    echo "Usage: ./release <TAG>"
    exit 2
fi

# Retrieve digest for the remote `latest` tag
DIGEST=$(curl -s "https://hub.docker.com/v2/repositories/$USER/$NAME/tags?name=latest"  | jq -r '.results[] | select(.name == "latest") | .digest')

# Check which remote tags match the retrieved digest
TAGS=$(curl -s "https://hub.docker.com/v2/repositories/$USER/$NAME/tags?page_size=100" -H 'Content-Type: application/json' | jq -r '.results[] | select(.digest == "'$DIGEST'") | .name')

# List latest tag(s) to user
echo "Latest tag(s) at remote:"
for i in "${TAGS[@]}"; do
    echo "$i"
done
echo -e "\n"

# Prompt user to continue
read -p "Continue with pushing tag $1 to remote? (y/N): " confirm && [[ $confirm == [Yy] ]] || exit 3

# Tag latest as <TAG>
docker tag $USER/$NAME:latest $USER/$NAME:$1

# Push <TAG>
docker push $USER/$NAME:$1

# Push latest
docker push $USER/$NAME:latest