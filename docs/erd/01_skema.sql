CREATE DATABASE IF NOT EXISTS pustakauii
  DEFAULT CHARACTER SET utf8mb4;
USE pustakauii;

CREATE TABLE penerbit (
  penerbit_id INT NOT NULL AUTO_INCREMENT,
  nama        VARCHAR(150) NOT NULL,
  kota        VARCHAR(100) NOT NULL,
  PRIMARY KEY (penerbit_id)
) ENGINE=InnoDB;

CREATE TABLE kategori (
  kategori_id   INT NOT NULL AUTO_INCREMENT,
  nama_kategori VARCHAR(100) NOT NULL,
  PRIMARY KEY (kategori_id)
) ENGINE=InnoDB;

CREATE TABLE buku (
  buku_id           INT NOT NULL AUTO_INCREMENT,
  isbn              VARCHAR(20) NOT NULL,
  judul             VARCHAR(150) NOT NULL,
  tahun_terbit      SMALLINT NOT NULL,
  jumlah_eksemplar  INT NOT NULL,
  penerbit_id       INT NOT NULL,
  kategori_id       INT NOT NULL,
  PRIMARY KEY (buku_id),
  CONSTRAINT uq_buku_isbn UNIQUE (isbn),
  CONSTRAINT chk_buku_jumlah CHECK (jumlah_eksemplar >= 0),
  CONSTRAINT fk_buku_penerbit
    FOREIGN KEY (penerbit_id) REFERENCES penerbit(penerbit_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_buku_kategori
    FOREIGN KEY (kategori_id) REFERENCES kategori(kategori_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE pengarang (
  pengarang_id INT NOT NULL AUTO_INCREMENT,
  nama         VARCHAR(150) NOT NULL,
  PRIMARY KEY (pengarang_id)
) ENGINE=InnoDB;

CREATE TABLE buku_pengarang (
  buku_id      INT NOT NULL,
  pengarang_id INT NOT NULL,
  PRIMARY KEY (buku_id, pengarang_id),
  CONSTRAINT fk_buku_pengarang_buku
    FOREIGN KEY (buku_id) REFERENCES buku(buku_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_buku_pengarang_pengarang
    FOREIGN KEY (pengarang_id) REFERENCES pengarang(pengarang_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE anggota (
  anggota_id    INT NOT NULL AUTO_INCREMENT,
  nim           VARCHAR(20) NOT NULL,
  nama          VARCHAR(150) NOT NULL,
  email         VARCHAR(254) NOT NULL,
  tanggal_daftar DATE NOT NULL,
  jalan         VARCHAR(255) NULL,
  kota          VARCHAR(100) NULL,
  PRIMARY KEY (anggota_id),
  CONSTRAINT uq_anggota_nim UNIQUE (nim),
  CONSTRAINT uq_anggota_email UNIQUE (email)
) ENGINE=InnoDB;

CREATE TABLE anggota_telepon (
  anggota_id INT NOT NULL,
  telepon    VARCHAR(20) NOT NULL,
  PRIMARY KEY (anggota_id, telepon),
  CONSTRAINT fk_anggota_telepon_anggota
    FOREIGN KEY (anggota_id) REFERENCES anggota(anggota_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE kartu (
  kartu_id       INT NOT NULL AUTO_INCREMENT,
  nomor_kartu    VARCHAR(30) NOT NULL,
  tanggal_terbit DATE NOT NULL,
  masa_berlaku   DATE NOT NULL,
  anggota_id     INT NOT NULL,
  PRIMARY KEY (kartu_id),
  CONSTRAINT uq_kartu_nomor UNIQUE (nomor_kartu),
  CONSTRAINT uq_kartu_anggota UNIQUE (anggota_id),
  CONSTRAINT fk_kartu_anggota
    FOREIGN KEY (anggota_id) REFERENCES anggota(anggota_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE peminjaman (
  peminjaman_id        INT NOT NULL AUTO_INCREMENT,
  tanggal_pinjam       DATE NOT NULL,
  tanggal_jatuh_tempo  DATE NOT NULL,
  anggota_id           INT NOT NULL,
  PRIMARY KEY (peminjaman_id),
  CONSTRAINT chk_peminjaman_jatuh_tempo
    CHECK (tanggal_jatuh_tempo >= tanggal_pinjam),
  CONSTRAINT fk_peminjaman_anggota
    FOREIGN KEY (anggota_id) REFERENCES anggota(anggota_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE detail_peminjaman (
  peminjaman_id  INT NOT NULL,
  buku_id        INT NOT NULL,
  tanggal_kembali DATE NULL,
  denda          DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (peminjaman_id, buku_id),
  CONSTRAINT chk_detail_peminjaman_denda CHECK (denda >= 0),
  CONSTRAINT fk_detail_peminjaman
    FOREIGN KEY (peminjaman_id) REFERENCES peminjaman(peminjaman_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_detail_buku
    FOREIGN KEY (buku_id) REFERENCES buku(buku_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
