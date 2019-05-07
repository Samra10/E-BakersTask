using System;
using System.Collections.Generic;

namespace E_BAPI.Models
{
    public partial class Students
    {
        public Students()
        {
            StudentDep = new HashSet<StudentDep>();
        }

        public int Id { get; set; }
        public string StudentName { get; set; }

        public virtual ICollection<StudentDep> StudentDep { get; set; }
    }
}
