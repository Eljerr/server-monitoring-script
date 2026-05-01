#!/bin/bash

cek_resource() {
  echo "$(date)"

  df -h / | awk 'NR==2 {print "Total disk:", $2 , "| Used:", $3 , "| Free space:", $4}'

  diskusage=$(df -h / | awk 'NR==2 {print $5}' | tr -d "%")
  if [[ $diskusage -gt 80 ]]; then
    echo "[ALERT] Disk uang terpakai sudah di atas 80%"
  fi

  free -h | awk 'NR==2 {print "RAM - Total:", $2 , "| Used:", $3 , "| Available:", $4}'
}

cek_resource
