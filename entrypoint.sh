#!/bin/bash
set -e

echo "===== Podcast Generator ====="

git config --global user.name "${INPUT_NAME}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /app/feed.py

git add music.xml
git diff --cached --quiet || git commit -m "Update podcast feed"
git push

echo "===== Done ====="
