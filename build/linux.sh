#!/bin/bash

BUILD_DIR=linux
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake ../..
cmake --build .
chmod +x ./report_sm
./report_sm
cd ..

