# Server Monitoring & Audit Script

Sebuah *Bash script* ringan dan efisien untuk melakukan pemantauan sumber daya server (Resource Monitoring) sekaligus mengaudit keamanan dasar (Security Audit) pada sistem operasi berbasis Linux. *Script* ini merupakan implementasi awal dari konsep *Observability* dan *Security Posture* dalam ekosistem server[cite: 1].

## 📌 Fitur Utama

*   **Disk Space Monitoring:** Mengecek penggunaan partisi *root* (`/`) dan memberikan peringatan otomatis (*alert*) jika kapasitas terpakai melebihi 80%[cite: 2].
*   **Memory (RAM) Usage:** Menampilkan ringkasan total RAM, jumlah yang terpakai, dan sisa RAM yang tersedia (dalam format *human-readable*)[cite: 2].
*   **SSH Brute-Force Audit:** Membaca *log* sistem menggunakan `journalctl` untuk mengekstrak dan menampilkan *Top 5* IP *Address* yang paling sering gagal melakukan *login* via SSH[cite: 2].
*   **Automated Log Generation:** Secara otomatis menyimpan *output* pemantauan ke dalam file teks (TXT) dengan penamaan dinamis berdasarkan tanggal dan waktu eksekusi (`audit_report_YYYY-MM-DD_HH-MM.txt`)[cite: 2].

## 🛠️ Prasyarat Sistem

*   Sistem Operasi berbasis Linux (Telah diuji pada ekosistem Arch Linux).
*   Akses `sudo` (diperlukan untuk membaca *log* SSH).
*   *Tools* bawaan Linux yang digunakan: `bash`, `awk`, `grep`, `sort`, `uniq`, dan `journalctl`.

## 🚀 Cara Penggunaan

1. *Clone repository* ini ke dalam *local machine* atau server Anda:
   ```bash
   git clone [https://github.com/username_anda/server-monitoring-script.git](https://github.com/username_anda/server-monitoring-script.git)
   cd server-monitoring-script
   chmod +x monitor.sh
   ./monitor.sh
   *(Catatan: Anda mungkin akan diminta memasukkan password pengguna karena script ini mengakses log keamanan sistem).*
