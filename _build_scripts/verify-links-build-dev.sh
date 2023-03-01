#!/bin/bash
set -e

URL_IGNORES="jsonlines.org/|arxiv.org/|huggingface.co/|linkedin.com/in/|crunchbase.com/|nytimes.com/"
GITHUB_IGNORES="github.com"
DEV_BUILD_LINKS_TO_IGNORE="assets/files|https://weaviate.io"

echo "**************************************
Starting Link Verification
PATH: ./build
URL_IGNORES: ${URL_IGNORES}|${GITHUB_IGNORES}|${ASSET_FILES}
**************************************"

./node_modules/.bin/linkinator ./build.dev \
--recurse \
--skip "${URL_IGNORES}|${GITHUB_IGNORES}|${DEV_BUILD_LINKS_TO_IGNORE}" \
--timeout 5000 \
--verbosity error \
--retry true \
--retry-errors true \
--retry-errors-count 5 \
--retry-errors-jitter 5 \
--directory-listing true

echo "**************************************
Link Verification Complete
**************************************"