
CREATE TABLE mitra_lokasi (
  mitra_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama_mitra VARCHAR(120) NOT NULL,
  jenis_mitra VARCHAR(40) NULL,
  kontak_mitra VARCHAR(30) NULL,
  email_mitra VARCHAR(120) NULL,
  alamat_kantor TEXT NULL
) ENGINE=InnoDB;

CREATE TABLE stasiun (
  stasiun_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  mitra_id BIGINT UNSIGNED NOT NULL,
  nama_stasiun VARCHAR(120) NOT NULL,
  jenis_stasiun ENUM('SPKLU','BATTERY_SWAP') NOT NULL,
  alamat TEXT NOT NULL,
  kota VARCHAR(80) NOT NULL,
  latitude DECIMAL(10,7) NULL,
  longitude DECIMAL(10,7) NULL,
  status_operasional VARCHAR(30) NOT NULL,
  status_ketersediaan VARCHAR(30) NOT NULL,
  waktu_update_status DATETIME NULL,
  CONSTRAINT fk_stasiun_mitra FOREIGN KEY (mitra_id) REFERENCES mitra_lokasi(mitra_id)
) ENGINE=InnoDB;

CREATE TABLE personel (
  personel_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama_personel VARCHAR(120) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  no_telepon VARCHAR(30) NULL,
  peran ENUM('OPERATOR_PUSAT','PETUGAS_LOKASI','TEKNISI') NOT NULL,
  status_aktif BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE gangguan (
  gangguan_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  stasiun_id BIGINT UNSIGNED NOT NULL,
  pelapor_id BIGINT UNSIGNED NOT NULL,
  teknisi_id BIGINT UNSIGNED NULL,
  judul VARCHAR(150) NOT NULL,
  deskripsi TEXT NOT NULL,
  prioritas VARCHAR(20) NOT NULL,
  status_penanganan VARCHAR(30) NOT NULL,
  waktu_lapor DATETIME NOT NULL,
  waktu_mulai_tangani DATETIME NULL,
  waktu_selesai DATETIME NULL,
  CONSTRAINT fk_gangguan_stasiun FOREIGN KEY (stasiun_id) REFERENCES stasiun(stasiun_id),
  CONSTRAINT fk_gangguan_pelapor FOREIGN KEY (pelapor_id) REFERENCES personel(personel_id),
  CONSTRAINT fk_gangguan_teknisi FOREIGN KEY (teknisi_id) REFERENCES personel(personel_id)
) ENGINE=InnoDB;

CREATE TABLE riwayat_aktivitas (
  aktivitas_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  personel_id BIGINT UNSIGNED NOT NULL,
  stasiun_id BIGINT UNSIGNED NULL,
  jenis_aktivitas VARCHAR(60) NOT NULL,
  detail_aktivitas TEXT NULL,
  waktu_aktivitas DATETIME NOT NULL,
  CONSTRAINT fk_aktivitas_personel FOREIGN KEY (personel_id) REFERENCES personel(personel_id),
  CONSTRAINT fk_aktivitas_stasiun FOREIGN KEY (stasiun_id) REFERENCES stasiun(stasiun_id)
) ENGINE=InnoDB;
