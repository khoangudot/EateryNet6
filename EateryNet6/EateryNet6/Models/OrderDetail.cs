using System;
using System.Collections.Generic;

namespace EateryNet6.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            Products = new HashSet<Product>();
        }

        public int OrderDetailId { get; set; }
        public int OrderId { get; set; }
        public string ProductId { get; set; } = null!;
        public int? Quantity { get; set; }
        public int? Discount { get; set; }
        public int? Total { get; set; }
        public DateTime? ShipDate { get; set; }

        public virtual Order Order { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; }
    }
}
