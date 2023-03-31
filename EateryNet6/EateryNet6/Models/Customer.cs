using System;
using System.Collections.Generic;

namespace EateryNet6.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Orders = new HashSet<Order>();
        }

        public int CustomerId { get; set; }
        public string FullName { get; set; } = null!;
        public int AccountId { get; set; }
        public DateTime Dob { get; set; }
        public string? Address { get; set; }
        public string? Avatar { get; set; }
        public string? Gmail { get; set; }
        public string? PhoneNumber { get; set; }
        public bool Gender { get; set; }
        public int LocationId { get; set; }

        public virtual Account Account { get; set; } = null!;
        public virtual Location Location { get; set; } = null!;
        public virtual ICollection<Order> Orders { get; set; }
    }
}
