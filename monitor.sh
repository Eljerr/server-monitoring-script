#!/bin/bash

LOG_FILE="audit_report_$(date +%F_%H-%M).txt"

cek_resource() {
  echo "=== SYSTEM & SECURITY AUDIT | $(date) ==="

  echo -e "\n[1] DISK USAGE:"
  df -h | awk '$NF=="/" {print "Total disk:", $2, "| Used:", $3 , "| Free space:", $4}'

  diskusage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
  if [ "$diskusage" -gt 80 ]; then
    echo "[ALERT] Kapasitas Disk terpakai sudah di atas 80%!"
  else
    echo "[OK] Kapasitas Disk aman."
  fi

  echo -e "\nMEMORY USAGE:"
  free -h | awk 'NR==2 {print "Total:", $2, "| Used:", $3, "| Available:", $4 }'

  echo -e "\nSECURITY: Top 5 Failed SSH Logins"
  sudo journalctl -u ssh | grep "Failed password" | awk '{for(i=1;i<=NF;i++) if($i=="from") print $(i+1)}' | sort | uniq -c | sort -nr | head -5

  echo -e "\n========================================="
}

cek_resource | tee -a "$LOG_FILE"
