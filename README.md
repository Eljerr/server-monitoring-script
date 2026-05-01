# Server Monitoring & Audit Script

Sebuah *Bash script* ringan dan efisien untuk melakukan pemantauan sumber daya server (Resource Monitoring) sekaligus mengaudit keamanan dasar (Security Audit) pada sistem operasi berbasis Linux. *Script* ini merupakan implementasi awal dari konsep *Observability* dan *Security Posture* dalam ekosistem server.

## 📌 Fitur Utama

*   **Disk Space Monitoring:** Mengecek penggunaan partisi *root* (`/`) dan memberikan peringatan otomatis (*alert*) jika kapasitas terpakai melebihi 80%.
*   **Memory (RAM) Usage:** Menampilkan ringkasan total RAM, jumlah yang terpakai, dan sisa RAM yang tersedia (dalam format *human-readable*).
*   **SSH Brute-Force Audit:** Membaca *log* sistem menggunakan `journalctl` untuk mengekstrak dan menampilkan *Top 5* IP *Address* yang paling sering gagal melakukan *login* via SSH.
*   **Automated Log Generation:** Secara otomatis menyimpan *output* pemantauan ke dalam file teks (TXT) dengan penamaan dinamis berdasarkan tanggal dan waktu eksekusi (`audit_report_YYYY-MM-DD_HH-MM.txt`).

## 🛠️ Prasyarat Sistem

*   Sistem Operasi berbasis Linux (Telah diuji pada ekosistem Arch Linux).
*   Akses `sudo` (diperlukan untuk membaca *log* SSH).
*   *Tools* bawaan Linux yang digunakan: `bash`, `awk`, `grep`, `sort`, `uniq`, dan `journalctl`.

## 🚀 Cara Penggunaan

1. *Clone repository* ini ke dalam *local machine* atau server Anda:
   ```bash
   git clone https://github.com/Eljerr/server-monitoring-script.git
   cd server-monitoring-script
   chmod +x monitor.sh
   ./monitor.sh

   ```
   *(Catatan: Anda mungkin akan diminta memasukkan password pengguna karena script ini mengakses log keamanan sistem).*
