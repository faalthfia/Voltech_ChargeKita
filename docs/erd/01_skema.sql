
CREATE DATABASE IF NOT EXISTS 01_skema
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE 01_skema;

CREATE TABLE mitra_lokasi (
  mitra_id       BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nama_mitra     VARCHAR(120) NOT NULL,
  jenis_mitra    VARCHAR(40) NULL,
  kontak_mitra   VARCHAR(30) NULL,
  email_mitra    VARCHAR(120) NULL,
  alamat_kantor  TEXT NULL,
  CONSTRAINT pk_mitra_lokasi PRIMARY KEY (mitra_id)
) ENGINE=InnoDB;

CREATE TABLE personel (
  personel_id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nama_personel  VARCHAR(120) NOT NULL,
  email          VARCHAR(120) NOT NULL,
  no_telepon     VARCHAR(30) NULL,
  peran          ENUM('OPERATOR_PUSAT', 'PETUGAS_LOKASI', 'TEKNISI') NOT NULL,
  status_aktif   BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT pk_personel PRIMARY KEY (personel_id),
  CONSTRAINT uq_personel_email UNIQUE (email),
  CONSTRAINT chk_personel_status_aktif CHECK (status_aktif IN (0, 1))
) ENGINE=InnoDB;

CREATE TABLE stasiun (
  stasiun_id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  mitra_id            BIGINT UNSIGNED NOT NULL,
  nama_stasiun        VARCHAR(120) NOT NULL,
  jenis_stasiun       ENUM('SPKLU', 'BATTERY_SWAP') NOT NULL,
  alamat              TEXT NOT NULL,
  kota                VARCHAR(80) NOT NULL,
  latitude            DECIMAL(10,7) NULL,
  longitude           DECIMAL(10,7) NULL,
  status_operasional  VARCHAR(30) NOT NULL,
  status_ketersediaan VARCHAR(30) NOT NULL,
  waktu_update_status DATETIME NULL,
  CONSTRAINT pk_stasiun PRIMARY KEY (stasiun_id),
  CONSTRAINT chk_stasiun_latitude
    CHECK (latitude IS NULL OR latitude BETWEEN -90 AND 90),
  CONSTRAINT chk_stasiun_longitude
    CHECK (longitude IS NULL OR longitude BETWEEN -180 AND 180),
  CONSTRAINT fk_stasiun_mitra
    FOREIGN KEY (mitra_id) REFERENCES mitra_lokasi(mitra_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE gangguan (
  gangguan_id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  stasiun_id           BIGINT UNSIGNED NOT NULL,
  pelapor_id           BIGINT UNSIGNED NOT NULL,
  teknisi_id           BIGINT UNSIGNED NULL,
  judul                VARCHAR(150) NOT NULL,
  deskripsi            TEXT NOT NULL,
  prioritas            VARCHAR(20) NOT NULL,
  status_penanganan    VARCHAR(30) NOT NULL,
  waktu_lapor          DATETIME NOT NULL,
  waktu_mulai_tangani  DATETIME NULL,
  waktu_selesai        DATETIME NULL,
  CONSTRAINT pk_gangguan PRIMARY KEY (gangguan_id),
  CONSTRAINT chk_gangguan_mulai_setelah_lapor
    CHECK (waktu_mulai_tangani IS NULL OR waktu_mulai_tangani >= waktu_lapor),
  CONSTRAINT chk_gangguan_selesai_setelah_mulai
    CHECK (
      waktu_selesai IS NULL
      OR (waktu_mulai_tangani IS NOT NULL AND waktu_selesai >= waktu_mulai_tangani)
    ),
  CONSTRAINT fk_gangguan_stasiun
    FOREIGN KEY (stasiun_id) REFERENCES stasiun(stasiun_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_gangguan_pelapor
    FOREIGN KEY (pelapor_id) REFERENCES personel(personel_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_gangguan_teknisi
    FOREIGN KEY (teknisi_id) REFERENCES personel(personel_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE riwayat_aktivitas (
  aktivitas_id      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  personel_id       BIGINT UNSIGNED NOT NULL,
  stasiun_id        BIGINT UNSIGNED NULL,
  jenis_aktivitas   VARCHAR(60) NOT NULL,
  detail_aktivitas  TEXT NULL,
  waktu_aktivitas   DATETIME NOT NULL,
  CONSTRAINT pk_riwayat_aktivitas PRIMARY KEY (aktivitas_id),
  CONSTRAINT fk_aktivitas_personel
    FOREIGN KEY (personel_id) REFERENCES personel(personel_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_aktivitas_stasiun
    FOREIGN KEY (stasiun_id) REFERENCES stasiun(stasiun_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
