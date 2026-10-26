# ChargeKita — Voltech

ChargeKita adalah rancangan platform berbasis web untuk membantu pemantauan operasional jaringan Stasiun Pengisian Kendaraan Listrik Umum (SPKLU) dan stasiun *battery swap* secara terpusat.

Proyek ini dikerjakan oleh kelompok **Voltech** untuk mata kuliah **Manajemen Pengembangan Teknologi Informasi (MPTI), Kelas D, Semester Ganjil 2026/2027**.

## Masalah yang Diangkat

Pemantauan status operasional, ketersediaan, lokasi, aktivitas, dan gangguan SPKLU serta stasiun *battery swap* masih dilakukan secara terpisah. Kondisi ini menyulitkan operator dalam memantau jaringan secara menyeluruh, memperlambat identifikasi gangguan, dan menyulitkan rekapitulasi serta evaluasi operasional. Pengguna kendaraan listrik juga membutuhkan informasi ketersediaan stasiun sebelum datang ke lokasi.

## Proses Bisnis yang Direncanakan

1. **Pengelolaan data stasiun:** operator memperbarui data dan lokasi SPKLU maupun stasiun *battery swap*.
2. **Pengecekan stasiun:** pengguna melihat lokasi dan informasi ketersediaan stasiun sebagai pertimbangan sebelum mengisi daya atau menukar baterai.
3. **Pemantauan operasional:** operator memantau ringkasan kondisi dan status setiap stasiun melalui sistem terpusat.
4. **Penanganan gangguan:** operator mengidentifikasi stasiun yang mengalami gangguan dan memantau status penanganannya bersama teknisi.
5. **Riwayat dan evaluasi:** operator melihat riwayat aktivitas serta data operasional yang tersimpan untuk membantu rekapitulasi dan evaluasi.

Alur tersebut merupakan rancangan proses bisnis proyek, bukan pernyataan bahwa seluruh fitur sudah selesai diterapkan.

## Pelaku yang Terlibat

- **Pengguna kendaraan listrik:** mencari lokasi dan memeriksa ketersediaan stasiun.
- **Operator pusat jaringan SPKLU:** memantau kondisi jaringan dan informasi operasional secara terpusat.
- **Petugas/operator titik pengisian:** mendukung pemantauan dan operasional di lokasi stasiun.
- **Teknisi lapangan:** menangani gangguan atau kebutuhan perawatan perangkat.
- **Mitra pemilik lokasi:** pihak yang menyediakan atau mengelola lokasi stasiun.
- **Pengelola armada (*fleet*):** membutuhkan informasi stasiun untuk mendukung operasional kendaraan listrik.
- **Mitra roaming/penyedia listrik:** pihak pendukung dalam ekosistem layanan pengisian kendaraan listrik.

## Fitur Utama yang Direncanakan

- Dashboard ringkasan status SPKLU dan *battery swap*.
- Pemantauan status operasional dan ketersediaan stasiun.
- Informasi lokasi stasiun dalam bentuk daftar dan/atau peta.
- Pemantauan gangguan beserta status penanganannya.
- Riwayat aktivitas dan pengelolaan data stasiun.

## Batasan MVP

MVP difokuskan pada aplikasi berbasis web untuk pemantauan dan pengelolaan informasi operasional. Integrasi perangkat IoT, pembuatan perangkat keras stasiun, pembayaran digital, *e-wallet*, penagihan, reservasi slot, dan antrean digital tidak termasuk dalam lingkup MVP.

## Anggota Kelompok Voltech

| NIM | Nama | Peran dalam kelompok |
| --- | --- | --- |
| 25523191 | Hafla Aqly | Ketua |
| 25523179 | Ahmad Dafa Ardevanda | Anggota 2 |
| 25523197 | Aufaa Luthfia Surya | Anggota 3 |
| 25523240 | Muhammad Naufal Arliansyah | Anggota 4 |

## Status Proyek

Dokumen ini menjadi pengantar awal untuk menjelaskan masalah, proses bisnis, pelaku, dan ruang lingkup ChargeKita. Pengembangan fitur dan status penyelesaiannya akan mengikuti perencanaan serta kriteria penerimaan yang ditetapkan dalam *Project Charter*.
