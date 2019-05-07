using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace E_BAPI.Models
{
    public partial class universityContext : DbContext
    {
        public universityContext()
        {
        }

        public universityContext(DbContextOptions<universityContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<StudentDep> StudentDep { get; set; }
        public virtual DbSet<Students> Students { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=Ahmad;Initial Catalog=university;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.4-servicing-10062");

            modelBuilder.Entity<Department>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.DepName)
                    .IsRequired()
                    .HasColumnName("depName")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<StudentDep>(entity =>
            {
                entity.HasKey(e => new { e.StudentId, e.DepId });

                entity.Property(e => e.StudentId).HasColumnName("StudentID");

                entity.Property(e => e.DepId).HasColumnName("DepID");

                entity.HasOne(d => d.Dep)
                    .WithMany(p => p.StudentDep)
                    .HasForeignKey(d => d.DepId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StudentDe__DepID__47DBAE45");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.StudentDep)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StudentDe__Stude__46E78A0C");
            });

            modelBuilder.Entity<Students>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.StudentName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
