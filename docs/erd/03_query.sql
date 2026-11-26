SELECT s.nama_stasiun, s.kota, m.nama_mitra
FROM stasiun s
JOIN mitra_lokasi m ON s.mitra_id = m.mitra_id;

SELECT s.nama_stasiun, COUNT(g.gangguan_id) AS jumlah_gangguan
FROM stasiun s
LEFT JOIN gangguan g ON s.stasiun_id = g.stasiun_id
GROUP BY s.nama_stasiun
HAVING COUNT(g.gangguan_id) > 0;

SELECT g.judul, g.waktu_lapor, s.nama_stasiun
FROM gangguan g
JOIN stasiun s ON g.stasiun_id = s.stasiun_id
LEFT JOIN personel p ON g.teknisi_id = p.personel_id
WHERE p.personel_id IS NULL;

SELECT p.nama_personel, r.jenis_aktivitas, r.waktu_aktivitas
FROM riwayat_aktivitas r
JOIN personel p ON r.personel_id = p.personel_id
JOIN stasiun s ON r.stasiun_id = s.stasiun_id
WHERE s.nama_stasiun = 'SPKLU Sudirman';

SELECT nama_personel
FROM personel
WHERE personel_id IN (
    SELECT teknisi_id FROM gangguan WHERE prioritas = 'Tinggi' AND teknisi_id IS NOT NULL
);

SELECT m.nama_mitra, COUNT(s.stasiun_id) AS jumlah_stasiun
FROM mitra_lokasi m
LEFT JOIN stasiun s ON m.mitra_id = s.mitra_id
GROUP BY m.nama_mitra
ORDER BY jumlah_stasiun DESC;
