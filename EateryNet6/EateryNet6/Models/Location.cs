using System;
using System.Collections.Generic;

namespace EateryNet6.Models
{
    public partial class Location
    {
        public Location()
        {
            Customers = new HashSet<Customer>();
        }

        public int LocationId { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<Customer> Customers { get; set; }
    }
}
