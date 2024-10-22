using System.ComponentModel.DataAnnotations;
using Hotel_Management_System.Models;
namespace Hotel_Management_System.Models
{
    public class NhanVien
    {
        [Key]
        public int MaNhanVien { get; set; }
        [Required]
        public string HoTen { get; set; }
        [Required]
        public string SoDienThoai { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string DiaChi { get; set; }
        [Required]
        public int MaTaiKhoan { get; set; }


        public NhanVien() { }
    }
}
