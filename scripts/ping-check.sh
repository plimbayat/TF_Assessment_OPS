#!/bin/bash
export SOURCE_VM_NAME="$1"
export DESTINATION_VM_NAME="$2"
export DESTINATION_VM_IP="$3"

export VM_NUMBER=$(echo "$SOURCE_VM_NAME" | awk -F'-' '{print $NF}')

if ping -c 1 "$DESTINATION_VM_IP" &> /dev/null
then
  echo "----------------" > /tmp/ping_result-$VM_NUMBER.txt
  echo "Ping $SOURCE_VM_NAME --> $DESTINATION_VM_NAME : SUCCESS" >> /tmp/ping_result-$VM_NUMBER.txt
  echo "Output: " >> /tmp/ping_result-$VM_NUMBER.txt
  ping -c 1 "$DESTINATION_VM_IP" | head -n5  >> /tmp/ping_result-$VM_NUMBER.txt
  echo "" >> /tmp/ping_result-$VM_NUMBER.txt
else
  echo "----------------" > /tmp/ping_result-$VM_NUMBER.txt
  echo "Ping $SOURCE_VM_NAME --> $DESTINATION_VM_NAME : FAIL" >> /tmp/ping_result-$VM_NUMBER.txt
  echo "Output: " >> /tmp/ping_result-$VM_NUMBER.txt
  ping -c 1 "$DESTINATION_VM_IP" | head -n5  >> /tmp/ping_result-$VM_NUMBER.txt
  echo "" >> /tmp/ping_result-$VM_NUMBER.txt
fi