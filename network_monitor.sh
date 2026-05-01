#!/bin/bash

source .env

network_monitor() {
  for server in $SERVERS; do
    ping -c 1 $server >/dev/null
    ping_status=$?

    if [[ $ping_status -eq 0 ]]; then
      echo ""
      echo "=== Network Monitoring ==="
      echo "[OK] Target: $server is UP"
      echo ""
      echo "   --- Cek Port ---"
      for port in $PORTS; do
        if nc -zv -w 2 $server $port 2>/dev/null; then
          echo " [OK] Port $port OPEN"
        else
          echo " [ERROR] Port $port CLOSE"
        fi
      done
    else
      echo " [ERROR] Target: $server is DOWN"
    fi
  done

  echo ""
  echo "===== HTTP/HTTPS Status ====="
  for web in $WEBSITES; do
    http_code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 3 "$web")
    kategori=${http_code:0:1}

    if [[ "$kategori" -eq 2 || "$kategori" -eq 3 ]]; then
      echo "[OK] $web merespon dengan HTTP $http_code"
    else
      echo "[ERROR] Layanan Down! $web mengembalikan HTTP status: $http_code"
    fi
  done
  echo "============================="
}

network_monitor | tee -a monitoring_network_$(date +%F_%H-%M).txt
