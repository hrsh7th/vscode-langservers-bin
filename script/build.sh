#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# clone
cd $DIR/../tmp
git clone --depth=1 git@github.com:Microsoft/vscode vscode

# pull
cd $DIR/../tmp/vscode
git pull

# npm install
cd $DIR/../tmp/vscode
yarn install
yarn compile

# copy to dist
cd $DIR/..
cp -r ./tmp/vscode/extensions/css-language-features/server/out ./dist/css-language-server
cp -r ./tmp/vscode/extensions/html-language-features/server/out ./dist/html-language-server
cp -r ./tmp/vscode/extensions/json-language-features/server/out ./dist/json-language-server

