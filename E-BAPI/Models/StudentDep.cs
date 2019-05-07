using System;
using System.Collections.Generic;

namespace E_BAPI.Models
{
    public partial class StudentDep
    {
        public int StudentId { get; set; }
        public int DepId { get; set; }

        public virtual Department Dep { get; set; }
        public virtual Students Student { get; set; }
    }
}
