using System.ComponentModel.DataAnnotations;

namespace Hotel_Management_System.Models
{
    public class PhuongThucThanhToan
    {
        [Key]
        public int MaPhuongThuc { get; set; }
        [Required]
        public string TenPhuongThuc { get; set; }
        public PhuongThucThanhToan() { }
    }
}
