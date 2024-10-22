using System.ComponentModel.DataAnnotations;

namespace Hotel_Management_System.Models
{
    public class TaiKhoan
    {
        [Key]
        public int MaTaiKhoan { get; set; }
        [Required]
        public string Quyen { get; set; }
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        public int TrangThai { get; set; } = 1;

        public TaiKhoan() { }
    }
}
