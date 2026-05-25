#!/bin/bash

echo "======= CPU ======="
top -bn1 | head

echo "======= Memory ======="

free -h

echo "======= Disk ======="

df -h
