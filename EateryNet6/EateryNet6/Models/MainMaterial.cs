using System;
using System.Collections.Generic;

namespace EateryNet6.Models
{
    public partial class MainMaterial
    {
        public MainMaterial()
        {
            Products = new HashSet<Product>();
        }

        public int MainMaterialId { get; set; }
        public string MainMaterialName { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; }
    }
}
