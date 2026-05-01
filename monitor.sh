#!/bin/bash

cek_resource() {
  echo "$(date)"

  df -h / | awk 'NR==2 {print "Total disk:", $2 , "| Used:", $3 , "| Free space:", $4}'
}

cek_resource
