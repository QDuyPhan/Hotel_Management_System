﻿using System.ComponentModel.DataAnnotations;

namespace Hotel_Management_System.Models
{
    public class Phong
    {
        [Key]
        public int MaPhong { get; set; }
        public int TrangThaiPhong { get; set; } = 1;
        [Required]
        public int SoPhong { get; set; }
        [Required]
        public int MaLoaiPhong { get; set; }
        public LoaiPhong LoaiPhong { get; set; }
        public Phong() { }
    }
}
