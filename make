#! /bin/bash

rm -r build/
truffle compile
truffle migrate
truffle migrate --reset --all
npm run dev