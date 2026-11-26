USE chargekita;

INSERT INTO mitra_lokasi (nama_mitra, jenis_mitra, kontak_mitra, email_mitra, alamat_kantor) VALUES
 ('PT. Energi Baru', 'Perusahaan', '08123456789', 'energibaru@mail.com', 'Jl. Sudirman No. 1, Jakarta'),
 ('CV Daya Mandiri', 'CV', '08987654321', 'dayamandiri@mail.com', 'Jl. Malioboro No. 2, Yogyakarta'),
 ('Koperasi Makmur', 'Koperasi', '081122334455', 'makmur@mail.com', 'Jl. Diponegoro No. 3, Bandung');

INSERT INTO stasiun (mitra_id, nama_stasiun, jenis_stasiun, alamat, kota, status_operasional, status_ketersediaan) VALUES
 (1, 'SPKLU Sudirman', 'SPKLU', 'Jl. Sudirman', 'Jakarta', 'Buka', 'Tersedia'),
 (1, 'SPKLU Thamrin', 'SPKLU', 'Jl. Thamrin', 'Jakarta', 'Buka', 'Penuh'),
 (2, 'Swap Malioboro', 'BATTERY_SWAP', 'Jl. Malioboro', 'Yogyakarta', 'Buka', 'Tersedia'),
 (3, 'SPKLU Dago', 'SPKLU', 'Jl. Dago', 'Bandung', 'Tutup', 'Kosong'),
 (3, 'SPKLU Riau', 'SPKLU', 'Jl. Riau', 'Bandung', 'Buka', 'Tersedia');

 INSERT INTO personel (nama_personel, email, no_telepon, peran) VALUES
 ('Andi Operator', 'andi@chargekita.id', '0811111111', 'OPERATOR_PUSAT'),
 ('Budi Petugas', 'budi@chargekita.id', '0822222222', 'PETUGAS_STASIUN'),
 ('Caca Teknisi', 'caca@chargekita.id', '0833333333', 'TEKNISI'),
 ('Dodi Teknisi', 'dodi@chargekita.id', '0844444444', 'TEKNISI');

 INSERT INTO gangguan (stasiun_id, pelapor_id, teknisi_id, judul, deskripsi, prioritas, status_penanganan, waktu_lapor) VALUES
 (1, 1, 3, 'Kebal Charger Rusak', 'Kabel pada colokan 1 terkelupas', 'Tinggi', 'Dalam Penanganan', '2026-11-20 10:00:00'),
 (2, 2, 4, 'Layar Sentuh Mati', 'Layar tidak merespon sentuhan', 'Sedang', 'Selesai', '2026-11-20 11:30:00'),
 (3, 1, NULL, 'Gagal Sinkronisasi', 'Sistem tidak bisa terhubung ke pusat', 'Tinggi', 'Belum Ditangani', '2026-11-21 08:00:00'),
 (4, 2, 3, 'Baterai Tidak Mengisi', 'Baterai tidak masuk saat ditukar', 'Sedang', 'Selesai', '2026-11-21 09:00:00'),
 (5, 1, NULL, 'Lampu Indikator Mati', 'Lampu indikator tidak menyala', 'Rendah', 'Belum Ditangani', '2026-11-22 14:00:00');

 INSERT INTO riwayat_aktivitas (personel_id, stasiun_id, jenis_aktivitas, detail_aktivitas, waktu_aktivitas) VALUES
 (2, 1, 'Pengecekan Rutin', 'Memeriksa kondisi fisik colokan', '2026-11-20 08:00:00'),
 (3, 1, 'Perbaikan', 'Mengganti kabel colokan 1', '2026-11-20 13:00:00'),
 (4, 2, 'Perbaikan', 'Restart sistem layar', '2026-11-20 14:00:00'),
 (2, 3, 'Pengecekan Rutin', 'Cek koneksi jaringan', '2026-11-21 09:00:00'),
 (3, 4, 'Perbaikan', 'Kalibrasi alat penukar baterai', '2026-11-21 11:00:00'),
 (2, 5, 'Pengecekan Rutin', 'Cek lampu indikator', '2026-11-22 15:00:00'),
 (1, NULL, 'Administrasi', 'Rapat evaluasi bulanan', '2026-11-22 16:00:00'),
 (4, 3, 'Perbaikan', 'Update firmware', '2026-11-23 10:00:00');
