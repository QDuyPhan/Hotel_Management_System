CREATE DATABASE Hotel_Management_System;


CREATE TABLE TaiKhoan (
	MaTaiKhoan INT PRIMARY KEY NOT NULL,
	Quyen	NVARCHAR(10)  NOT NULL,
	Username NVARCHAR(50) NOT NULL,
	Password NVARCHAR(50) NOT NULL,
	TrangThai INT DEFAULT 1
);

INSERT INTO TaiKhoan (MaTaiKhoan, Quyen, Username, Password, TrangThai)
VALUES (1,N'admin', 'admin', 'admin123', 1),
       (2,N'Nhân viên', 'nhanvien', 'nhanvien123', 1),
	   (3,N'Khách hàng', 'khachhang', 'khachhang123', 1);

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY NOT NULL,
    HoTen NVARCHAR(50) NOT NULL,
    SoDienThoai NVARCHAR(20) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(200) NOT NULL,
	MaTaiKhoan INT NOT NULL,
);

INSERT INTO NhanVien (MaNhanVien, HoTen, SoDienThoai, Email, DiaChi, MaTaiKhoan)
VALUES (1, N'Nguyễn Văn A', '0987654321', 'anv@example.com', N'Hà Nội', 1),
(2, N'Nguyễn Văn B', '0987654321', 'anv@example.com', N'Hồ Chí Minh', 2),
(3, N'Nguyễn Văn C', '0987654321', 'anv@example.com', N'Cà Mau', 2),
(4, N'Nguyễn Văn D', '0987654321', 'anv@example.com', N'Hà Nội', 2),
(5, N'Nguyễn Văn E', '0987654321', 'anv@example.com', N'Hà Nội', 2);


CREATE TABLE KhachHang (
    MaKhachHang INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(50) DEFAULT NULL,
    SoDienThoai NVARCHAR(20) DEFAULT NULL,
    Email NVARCHAR(50) DEFAULT NULL,
    NgaySinh DATETIME DEFAULT NULL,
    CCCD NVARCHAR(20) DEFAULT NULL,
	STK  NVARCHAR(20) DEFAULT NULL,
	MaTaiKhoan INT NOT NULL
);

INSERT INTO KhachHang (HoTen, SoDienThoai, Email, NgaySinh, CCCD, STK, MaTaiKhoan)
VALUES (N'Trần Thị B', '0912345678', 'btt@example.com', '1990-01-01', '123456789', 1234567890123, 3),
		(N'Trần Thị c', '0912345678', 'btt@example.com', '1990-01-01', '123456789', 1234567890123, 3);

CREATE TABLE LoaiPhong (
    MaLoaiPhong INT PRIMARY KEY NOT NULL,
    TenLoaiPhong NVARCHAR(50) NOT NULL,
	SoLuongPhong INT NOT NULL,
	Mota NVARCHAR(255) NOT NULL,
    Gia DECIMAL(10,2) NOT NULL
);

INSERT INTO LoaiPhong (MaLoaiPhong, TenLoaiPhong, SoLuongPhong, Mota, Gia)
VALUES (1, N'Phòng đơn', 20, N'Phòng đơn tiêu chuẩn', 500000),
       (2, N'Phòng đôi', 10, N'Phòng đôi tiện nghi', 800000);


CREATE TABLE Phong (
    MaPhong INT PRIMARY KEY NOT NULL,
	TrangThaiPhong INT DEFAULT 1,
	SoPhong INT NOT NULL,
    MaLoaiPhong INT NOT NULL,
);

INSERT INTO Phong (MaPhong, TrangThaiPhong, SoPhong, MaLoaiPhong)
VALUES (101, 1, 101, 1),
       (102, 0, 102, 1);


CREATE TABLE DichVu (
    MaDichVu INT PRIMARY KEY NOT NULL,
    TenDichVu NVARCHAR(100) NOT NULL,
    Gia DECIMAL(10,2) NOT NULL,
	Mota NVARCHAR(255) NOT NULL
);

INSERT INTO DichVu (MaDichVu, TenDichVu, Gia, Mota)
VALUES (1, N'Mini bar', 50000, N'Dịch vụ mini bar'),
       (2, N'Giặt ủi', 30000, N'Dịch vụ giặt ủi');


CREATE TABLE DatPhong (
    MaDatPhong INT IDENTITY(1,1) PRIMARY KEY,
    CheckInDate DATETIME NOT NULL,
    CheckOutDate DATETIME NOT NULL,
    MaKhachHang INT NOT NULL,
	MaPhong INT NOT NULL,
);

INSERT INTO DatPhong (CheckInDate, CheckOutDate, MaKhachHang, MaPhong)
VALUES ('2023-11-20', '2023-11-22', 1, 101);

CREATE TABLE PhuongThucThanhToan(
	MaPhuongThuc INT PRIMARY KEY NOT NULL,
	TenPhuongThuc NVARCHAR(100) NOT NULL
);

INSERT INTO PhuongThucThanhToan (MaPhuongThuc, TenPhuongThuc)
VALUES (1, N'Tiền mặt'),
       (2, N'Thẻ ngân hàng');

CREATE TABLE HoaDon (
	MaHoaDon INT IDENTITY(1,1) PRIMARY KEY,
	NgayTao DATETIME DEFAULT NULL,
	TongSoTien DECIMAL(10,2) DEFAULT NULL,
	MaPhuongThuc INT NOT NULL,
	MaNhanVien INT DEFAULT NULL,
	MaDatPhong INT NOT NULL
);

INSERT INTO HoaDon (NgayTao, TongSoTien, MaPhuongThuc, MaNhanVien, MaDatPhong)
VALUES ('2023-11-22', 1000000, 1, 1, 1);

CREATE TABLE CTHoaDon (
	MaHoaDon INT NOT NULL,
	MaDichVu INT NOT NULL,
);

INSERT INTO CTHoaDon (MaHoaDon, MaDichVu)
VALUES (1, 1),
       (1, 2);

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_TaiKhoan
FOREIGN KEY (MaTaiKhoan) REFERENCES TaiKhoan(MaTaiKhoan);

ALTER TABLE KhachHang
ADD CONSTRAINT FK_KhachHang_TaiKhoan
FOREIGN KEY (MaTaiKhoan) REFERENCES TaiKhoan(MaTaiKhoan);

ALTER TABLE Phong
ADD CONSTRAINT FK_Phong_LoaiPhong
FOREIGN KEY (MaLoaiPhong) REFERENCES LoaiPhong(MaLoaiPhong);

ALTER TABLE DatPhong
ADD CONSTRAINT FK_DatPhong_KhachHang
FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang);

ALTER TABLE DatPhong
ADD CONSTRAINT FK_DatPhong_Phong
FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_PhuongThucThanhToan
FOREIGN KEY (MaPhuongThuc) REFERENCES PhuongThucThanhToan(MaPhuongThuc);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_NhanVien
FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_DatPhong
FOREIGN KEY (MaDatPhong) REFERENCES DatPhong(MaDatPhong);

ALTER TABLE CTHoaDon
ADD CONSTRAINT FK_CTHoaDon_HoaDon
FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon);

ALTER TABLE CTHoaDon
ADD CONSTRAINT FK_CTHoaDon_DichVu
FOREIGN KEY (MaDichVu) REFERENCES DichVu(MaDichVu);

