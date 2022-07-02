#!/bin/bash

PROJECT_DIR=/usr/local/src/project

PROTOC_DIR=${PROJECT_DIR}/protoc
OUT_DIR=${PROJECT_DIR}/golang

go install -u google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install -u google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

protoc \
  -I=${PROTOC_DIR} \
  --go_out=paths=source_relative:${OUT_DIR} \
  --go-grpc_out=paths=source_relative,require_unimplemented_servers=false:${OUT_DIR} \
  ${PROTOC_DIR}/**/*.proto

cd ${OUT_DIR}

go mod tidy
