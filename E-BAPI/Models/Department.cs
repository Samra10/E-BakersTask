using System;
using System.Collections.Generic;

namespace E_BAPI.Models
{
    public partial class Department
    {
        public Department()
        {
            StudentDep = new HashSet<StudentDep>();
        }

        public int Id { get; set; }
        public string DepName { get; set; }

        public virtual ICollection<StudentDep> StudentDep { get; set; }
    }
}
