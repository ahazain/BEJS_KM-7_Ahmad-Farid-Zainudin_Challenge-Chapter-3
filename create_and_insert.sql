-- Tabel Nasabah
CREATE TYPE jenis_kelamin_enum AS ENUM ('laki-laki', 'perempuan');

CREATE TABLE Nasabah (
    id_nasabah SERIAL PRIMARY KEY,
    nama VARCHAR(100),
    alamat TEXT,
    no_telp VARCHAR(15),
    email VARCHAR(100),
    tanggal_lahir DATE,
	jenis_kelamin jenis_kelamin_enum
);

-- Tabel Akun
CREATE TABLE Akun (
    id_akun SERIAL PRIMARY KEY,
    jenis_akun VARCHAR(50),
    saldo DECIMAL(15, 2),
    tanggal_dibuat DATE,
	id_nasabah INT REFERENCES Nasabah(id_nasabah) ON DELETE CASCADE
);

-- Tabel Transaksi
CREATE TABLE Transaksi (
    id_transaksi SERIAL PRIMARY KEY,
    jenis_transaksi VARCHAR(50),
    jumlah DECIMAL(15, 2),
    tanggal_transaksi DATE,
	id_akun INT REFERENCES Akun(id_akun) ON DELETE CASCADE
);

--Operasi Create
--menambah Nasabah
INSERT INTO Nasabah (nama, alamat, no_telp, email, tanggal_lahir, jenis_kelamin)
VALUES 
('krisna', 'Jl. Arjuna No. 1', '08123456789', 'krisna@gmail.com', '1985-05-23', 'laki-laki'),
('Firdaus', 'Jl. Kalimantans No. 2', '08123456780', 'firdaus@gmail.com', '1990-07-15', 'laki-laki'),
('Iqmal', 'Jl. Karimata No. 3', '08198765432', 'iqmal@gmail.com', '1978-12-11', 'laki-laki'),
('Kobilitus', 'Jl. Jawa No. 4', '08123459876', 'kobil@gmail.com', '1995-06-30', 'perempuan'),
('Ikhsan', 'Jl. Riau No. 5', '08124567890', 'ikhsan@gmail.com', '1992-01-20', 'laki-laki');
--menambah Akun
INSERT INTO Akun (jenis_akun, saldo, tanggal_dibuat, id_nasabah)
VALUES 
('Tabungan', 500000.00, '2022-01-01', 1),
('Deposit', 800000.00, '2021-01-01', 2),
('Tabungan', 900000.00, '2020-01-01', 4),
('Deposit', 40000.00, '2025-01-01', 5),
('Tabungan', 200000.00, '2024-01-01', 1);
--menambah Transaksi
INSERT INTO Transaksi (jenis_transaksi, jumlah, tanggal_transaksi, id_akun)
VALUES 
('Kredit', 200000.00, '2022-01-10', 1),
('Debit', 300000.00, '2023-01-10', 4),
('Kredit', 500000.00, '2025-01-10', 2),
('Debit', 100000.00, '2021-01-10', 3),
('Kredit', 200000.00, '2020-01-10', 1);

--Operasi Read
--read Nasabah
select * from nasabah
--read Akun
select * from Akun
--read Transaksi
select * from Transaksi

--Operasi Update
--update Nasabah
UPDATE Nasabah
SET alamat = 'Jl. Patrang No. 3', no_telp = '08987654723'
WHERE id_nasabah = 1;
--update Akun
UPDATE Akun
SET jenis_akun = 'Deposito'
WHERE id_akun IN (3, 5);
--update Transaksi
UPDATE Transaksi
SET jumlah = 250000
WHERE id_transaksi = 3;

--Operasi Delete
--delete Nasabah
DELETE FROM Nasabah
WHERE id_Nasabah = 3;
--delete Akun
DELETE FROM Akun
WHERE id_Akun = 3;
--delete Transaksi
DELETE FROM Transaksi
WHERE id_Transaksi = 3;

