-- 03_query.sql
-- Kumpulan query untuk fitur aplikasi ChargeKita.
-- Pilih database ChargeKita di phpMyAdmin sebelum menjalankan query.

-- 1. Pertanyaan bisnis: Bagaimana daftar stasiun beserta mitra pengelolanya?
-- Halaman/fitur: Dashboard dan daftar stasiun.
-- Teknik: INNER JOIN antara stasiun dan mitra_lokasi.
-- Jumlah baris yang diharapkan dari 02_data.sql: 8.
SELECT
    s.stasiun_id,
    s.nama_stasiun,
    s.jenis_stasiun,
    s.kota,
    m.nama_mitra,
    s.status_operasional,
    s.status_ketersediaan
FROM stasiun AS s
JOIN mitra_lokasi AS m
    ON m.mitra_id = s.mitra_id
ORDER BY s.kota ASC, s.nama_stasiun ASC;


-- 2. Pertanyaan bisnis: Siapa pelapor dan teknisi yang menangani setiap gangguan?
-- Halaman/fitur: Monitoring dan detail gangguan.
-- Teknik: JOIN tiga tabel (gangguan, stasiun, personel sebagai pelapor)
--         ditambah LEFT JOIN personel sebagai teknisi karena teknisi dapat NULL.
-- Jumlah baris yang diharapkan dari 02_data.sql: 10.
SELECT
    g.gangguan_id,
    g.judul,
    s.nama_stasiun,
    pelapor.nama_personel AS nama_pelapor,
    teknisi.nama_personel AS nama_teknisi,
    g.prioritas,
    g.status_penanganan,
    g.waktu_lapor
FROM gangguan AS g
JOIN stasiun AS s
    ON s.stasiun_id = g.stasiun_id
JOIN personel AS pelapor
    ON pelapor.personel_id = g.pelapor_id
LEFT JOIN personel AS teknisi
    ON teknisi.personel_id = g.teknisi_id
ORDER BY g.waktu_lapor DESC, g.gangguan_id DESC;


-- 3. Pertanyaan bisnis: Stasiun mana yang belum pernah memiliki laporan gangguan?
-- Halaman/fitur: Daftar stasiun dan pemantauan cakupan laporan.
-- Teknik: LEFT JOIN dengan IS NULL.
-- Jumlah baris yang diharapkan dari 02_data.sql: 1.
SELECT
    s.stasiun_id,
    s.nama_stasiun,
    s.kota,
    s.status_operasional
FROM stasiun AS s
LEFT JOIN gangguan AS g
    ON g.stasiun_id = s.stasiun_id
WHERE g.gangguan_id IS NULL
ORDER BY s.nama_stasiun ASC;


-- 4. Pertanyaan bisnis: Stasiun mana yang memiliki minimal dua laporan gangguan?
-- Halaman/fitur: Rekapitulasi dan analisis gangguan.
-- Teknik: JOIN, GROUP BY, dan HAVING.
-- Jumlah baris yang diharapkan dari 02_data.sql: 2.
SELECT
    s.stasiun_id,
    s.nama_stasiun,
    COUNT(g.gangguan_id) AS jumlah_gangguan
FROM stasiun AS s
JOIN gangguan AS g
    ON g.stasiun_id = s.stasiun_id
GROUP BY s.stasiun_id, s.nama_stasiun
HAVING COUNT(g.gangguan_id) >= 2
ORDER BY jumlah_gangguan DESC, s.nama_stasiun ASC;


-- 5. Pertanyaan bisnis: Stasiun mana yang memiliki gangguan belum selesai?
-- Halaman/fitur: Monitoring operasional dan tindak lanjut gangguan.
-- Teknik: Subquery dengan IN.
-- Jumlah baris yang diharapkan dari 02_data.sql: 4.
SELECT
    s.stasiun_id,
    s.nama_stasiun,
    s.kota,
    s.status_operasional
FROM stasiun AS s
WHERE s.stasiun_id IN (
    SELECT DISTINCT g.stasiun_id
    FROM gangguan AS g
    WHERE g.status_penanganan <> 'SELESAI'
)
ORDER BY s.kota ASC, s.nama_stasiun ASC;


-- 6. Pertanyaan bisnis: Aktivitas apa saja yang dilakukan personel dan di stasiun mana?
-- Halaman/fitur: Riwayat aktivitas dan audit operasional.
-- Teknik: JOIN personel dan LEFT JOIN stasiun karena aktivitas tertentu
--         (misalnya login) tidak terkait dengan stasiun tertentu.
-- Jumlah baris yang diharapkan dari 02_data.sql: 12.
SELECT
    ra.aktivitas_id,
    p.nama_personel,
    p.peran,
    s.nama_stasiun,
    ra.jenis_aktivitas,
    ra.detail_aktivitas,
    ra.waktu_aktivitas
FROM riwayat_aktivitas AS ra
JOIN personel AS p
    ON p.personel_id = ra.personel_id
LEFT JOIN stasiun AS s
    ON s.stasiun_id = ra.stasiun_id
ORDER BY ra.waktu_aktivitas DESC, ra.aktivitas_id DESC;
