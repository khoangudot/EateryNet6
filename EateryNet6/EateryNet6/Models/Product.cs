using System;
using System.Collections.Generic;

namespace EateryNet6.Models
{
    public partial class Product
    {
        public Product()
        {
            Orderdetails = new HashSet<OrderDetail>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public string? Description { get; set; }
        public int CategoryId { get; set; }
        public int Price { get; set; }
        public int? Discount { get; set; }
        public string? Thumb { get; set; }
        public DateTime? CreatedDate { get; set; }
        public bool? Active { get; set; }
        public int UnitInStock { get; set; }
        public int? MainMaterialId { get; set; }

        public virtual Category Category { get; set; } = null!;
        public virtual MainMaterial? MainMaterial { get; set; }

        public virtual ICollection<OrderDetail> Orderdetails { get; set; }
    }
}
