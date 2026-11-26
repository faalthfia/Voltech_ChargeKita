
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
