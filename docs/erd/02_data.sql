
START TRANSACTION;

INSERT INTO mitra_lokasi
  (mitra_id, nama_mitra, jenis_mitra, kontak_mitra, email_mitra, alamat_kantor)
VALUES
  (1, 'PT Energi Nusantara', 'BUMN', '+62-21-5550101', 'operasional@energinusantara.test', 'Jl. Gatot Subroto No. 10, Jakarta'),
  (2, 'Swapindo Mobilitas', 'Swasta', '+62-21-5550102', 'info@swapindo.test', 'Jl. Tebet Raya No. 18, Jakarta'),
  (3, 'Daya Hijau Indonesia', 'Swasta', '+62-22-5550103', 'layanan@dayahijau.test', 'Jl. Ir. H. Juanda No. 25, Bandung'),
  (4, 'Mitra Listrik Yogyakarta', 'BUMD', '+62-274-5550104', 'admin@mitralistrikyk.test', 'Jl. Malioboro No. 45, Yogyakarta'),
  (5, 'ChargeHub Indonesia', 'Swasta', '+62-31-5550105', 'support@chargehub.test', 'Jl. Pemuda No. 12, Surabaya'),
  (6, 'Energi Mandiri Depok', NULL, NULL, NULL, NULL);

INSERT INTO stasiun
  (stasiun_id, mitra_id, nama_stasiun, jenis_stasiun, alamat, kota,
   latitude, longitude, status_operasional, status_ketersediaan, waktu_update_status)
VALUES
  (1, 1, 'SPKLU Sudirman Central', 'SPKLU', 'Jl. Jenderal Sudirman No. 20', 'Jakarta', -6.2088000, 106.8221000, 'BEROPERASI', 'TERSEDIA', '2026-11-25 08:00:00'),
  (2, 1, 'SPKLU Blok M', 'SPKLU', 'Jl. Melawai Raya No. 5', 'Jakarta', -6.2441000, 106.7994000, 'BEROPERASI', 'TERPAKAI', '2026-11-25 08:10:00'),
  (3, 2, 'Battery Swap Tebet', 'BATTERY_SWAP', 'Jl. Tebet Barat Dalam No. 8', 'Jakarta', -6.2297000, 106.8520000, 'BEROPERASI', 'TERSEDIA', '2026-11-25 08:15:00'),
  (4, 3, 'SPKLU Dago', 'SPKLU', 'Jl. Ir. H. Juanda No. 90', 'Bandung', -6.8852000, 107.6131000, 'GANGGUAN', 'TIDAK_TERSEDIA', '2026-11-25 07:30:00'),
  (5, 2, 'Battery Swap Pasteur', 'BATTERY_SWAP', 'Jl. Dr. Djunjunan No. 120', 'Bandung', -6.9025000, 107.5780000, 'BEROPERASI', 'TERSEDIA', '2026-11-25 08:20:00'),
  (6, 4, 'SPKLU Malioboro', 'SPKLU', 'Jl. Malioboro No. 45', 'Yogyakarta', -7.7925000, 110.3656000, 'MAINTENANCE', 'TIDAK_TERSEDIA', '2026-11-25 07:00:00'),
  (7, 5, 'SPKLU Gubeng', 'SPKLU', 'Jl. Raya Gubeng No. 30', 'Surabaya', -7.2720000, 112.7510000, 'BEROPERASI', 'TERSEDIA', '2026-11-25 08:25:00'),
  (8, 6, 'Battery Swap Margonda', 'BATTERY_SWAP', 'Jl. Margonda Raya No. 100', 'Depok', NULL, NULL, 'BEROPERASI', 'TERSEDIA', NULL);

INSERT INTO personel
  (personel_id, nama_personel, email, no_telepon, peran, status_aktif)
VALUES
  (1, 'Ardi Wibowo', 'ardi@chargekita.test', '+62-811-1000-0001', 'OPERATOR_PUSAT', TRUE),
  (2, 'Nadia Putri', 'nadia@chargekita.test', '+62-811-1000-0002', 'OPERATOR_PUSAT', TRUE),
  (3, 'Raka Pratama', 'raka@chargekita.test', '+62-811-1000-0003', 'PETUGAS_LOKASI', TRUE),
  (4, 'Sinta Maharani', 'sinta@chargekita.test', '+62-811-1000-0004', 'PETUGAS_LOKASI', TRUE),
  (5, 'Bima Saputra', 'bima@chargekita.test', '+62-811-1000-0005', 'TEKNISI', TRUE),
  (6, 'Fajar Nugroho', 'fajar@chargekita.test', '+62-811-1000-0006', 'TEKNISI', TRUE),
  (7, 'Dewi Anggraini', 'dewi@chargekita.test', '+62-811-1000-0007', 'TEKNISI', TRUE),
  (8, 'Bagus Setiawan', 'bagus@chargekita.test', NULL, 'PETUGAS_LOKASI', FALSE);

INSERT INTO gangguan
  (gangguan_id, stasiun_id, pelapor_id, teknisi_id, judul, deskripsi,
   prioritas, status_penanganan, waktu_lapor, waktu_mulai_tangani, waktu_selesai)
VALUES
  (1, 1, 3, 5, 'Konektor pengisian longgar', 'Konektor tidak terkunci dengan baik saat digunakan.', 'TINGGI', 'SELESAI', '2026-11-18 08:15:00', '2026-11-18 08:45:00', '2026-11-18 09:30:00'),
  (2, 1, 3, 5, 'Layar informasi tidak menyala', 'Layar pada unit utama tidak menampilkan informasi.', 'SEDANG', 'SELESAI', '2026-11-19 10:00:00', '2026-11-19 10:30:00', '2026-11-19 11:15:00'),
  (3, 1, 2, 6, 'Daya pengisian tidak stabil', 'Output daya beberapa kali turun ketika proses pengisian berlangsung.', 'TINGGI', 'DIPROSES', '2026-11-25 09:00:00', '2026-11-25 09:30:00', NULL),
  (4, 2, 4, 6, 'Kabel pengisian terlalu panas', 'Suhu kabel meningkat saat stasiun digunakan.', 'TINGGI', 'DIPROSES', '2026-11-24 13:10:00', '2026-11-24 14:00:00', NULL),
  (5, 2, 4, NULL, 'Pembaca konektor tidak merespons', 'Unit belum dapat membaca konektor yang dipasang.', 'SEDANG', 'BARU', '2026-11-25 11:20:00', NULL, NULL),
  (6, 3, 4, 7, 'Sensor baterai tidak akurat', 'Indikator kapasitas baterai berbeda dari hasil pemeriksaan.', 'SEDANG', 'SELESAI', '2026-11-20 09:00:00', '2026-11-20 09:30:00', '2026-11-20 10:30:00'),
  (7, 4, 3, 5, 'Unit pengisian tidak aktif', 'Unit tidak dapat memulai sesi pengisian.', 'KRITIS', 'MENUNGGU_SPAREPART', '2026-11-23 07:40:00', '2026-11-23 08:15:00', NULL),
  (8, 5, 8, NULL, 'Rak baterai sulit terkunci', 'Pengunci salah satu slot baterai tidak dapat menutup sempurna.', 'SEDANG', 'BARU', '2026-11-25 15:00:00', NULL, NULL),
  (9, 6, 2, 6, 'Display status tidak akurat', 'Status ketersediaan pada layar terlambat diperbarui.', 'RENDAH', 'SELESAI', '2026-11-21 10:00:00', '2026-11-21 10:20:00', '2026-11-21 11:00:00'),
  (10, 7, 3, 7, 'Pembacaan arus tidak stabil', 'Hasil pembacaan arus berubah-ubah saat dilakukan pengujian.', 'SEDANG', 'SELESAI', '2026-11-22 12:30:00', '2026-11-22 13:00:00', '2026-11-22 14:00:00');

INSERT INTO riwayat_aktivitas
  (aktivitas_id, personel_id, stasiun_id, jenis_aktivitas, detail_aktivitas, waktu_aktivitas)
VALUES
  (1, 1, NULL, 'LOGIN', NULL, '2026-11-25 07:00:00'),
  (2, 1, 1, 'PEMBARUAN_STATUS', 'Memperbarui status operasional SPKLU Sudirman Central.', '2026-11-25 07:10:00'),
  (3, 2, 2, 'PENUGASAN_TEKNISI', 'Menugaskan teknisi untuk gangguan kabel pengisian.', '2026-11-24 13:30:00'),
  (4, 3, 1, 'PELAPORAN_GANGGUAN', 'Melaporkan konektor pengisian yang longgar.', '2026-11-18 08:15:00'),
  (5, 3, 4, 'PELAPORAN_GANGGUAN', 'Melaporkan unit pengisian yang tidak aktif.', '2026-11-23 07:40:00'),
  (6, 4, 2, 'PELAPORAN_GANGGUAN', 'Melaporkan kabel pengisian yang terlalu panas.', '2026-11-24 13:10:00'),
  (7, 4, 3, 'PELAPORAN_GANGGUAN', 'Melaporkan masalah sensor baterai.', '2026-11-20 09:00:00'),
  (8, 5, 1, 'PENANGANAN_GANGGUAN', 'Memulai pemeriksaan output daya pengisian.', '2026-11-25 09:30:00'),
  (9, 5, 4, 'PEMBARUAN_PENANGANAN', 'Menginformasikan kebutuhan penggantian suku cadang.', '2026-11-23 09:00:00'),
  (10, 6, 2, 'PENANGANAN_GANGGUAN', 'Melakukan pemeriksaan kondisi kabel pengisian.', '2026-11-24 14:00:00'),
  (11, 7, 7, 'PENYELESAIAN_GANGGUAN', 'Menyelesaikan pemeriksaan pembacaan arus.', '2026-11-22 14:00:00'),
  (12, 8, 8, 'PEMERIKSAAN_STASIUN', 'Melakukan pemeriksaan rutin stasiun.', '2026-11-25 16:00:00');

COMMIT;

SELECT 'mitra_lokasi' AS nama_tabel, COUNT(*) AS jumlah_baris FROM mitra_lokasi
UNION ALL
SELECT 'stasiun', COUNT(*) FROM stasiun
UNION ALL
SELECT 'personel', COUNT(*) FROM personel
UNION ALL
SELECT 'gangguan', COUNT(*) FROM gangguan
UNION ALL
SELECT 'riwayat_aktivitas', COUNT(*) FROM riwayat_aktivitas;
