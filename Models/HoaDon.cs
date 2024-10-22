﻿using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Hotel_Management_System.Models
{
    public class HoaDon
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int MaHoaDon { get; set; }
        public DateTime? NgayTao { get; set; }
        public decimal? TongSoTien { get; set; }
        [Required]
        public int MaPhuongThuc { get; set; }
        public int MaNhanVien { get; set; }
        [Required]
        public int MaDatPhong { get; set; }
        public HoaDon() { }
    }
}
