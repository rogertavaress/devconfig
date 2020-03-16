#!/bin/bash

OS=$(sudo cat /etc/*-release | grep "ID=" | head -n 1)

echo "${OS}"