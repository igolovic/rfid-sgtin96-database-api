using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class MyCompanyContext : DbContext
    {
        public MyCompanyContext()
        {
        }

        public MyCompanyContext(DbContextOptions<MyCompanyContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Inventory> Inventories { get; set; }
        public virtual DbSet<InventoryDate> InventoryDates { get; set; }
        public virtual DbSet<InventoryLocation> InventoryLocations { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductItem> ProductItems { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=IGNB\\IVANINSTANCE;Database=MyCompany;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Croatian_CI_AS");

            modelBuilder.Entity<Company>(entity =>
            {
                entity.ToTable("Company");

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.CompanyPrefix).HasColumnType("numeric(18, 0)");
            });

            modelBuilder.Entity<Inventory>(entity =>
            {
                entity.ToTable("Inventory");

                entity.Property(e => e.InventoryId)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);

                entity.Property(e => e.InventoryLocationId).HasColumnName("InventoryLocation_Id");

                entity.HasOne(d => d.InventoryLocation)
                    .WithMany(p => p.Inventories)
                    .HasForeignKey(d => d.InventoryLocationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Inventory_InventoryLocation");
            });

            modelBuilder.Entity<InventoryDate>(entity =>
            {
                entity.ToTable("InventoryDate");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.InventoryDate1).HasColumnName("InventoryDate");

                entity.Property(e => e.InventoryId).HasColumnName("Inventory_Id");

                entity.HasOne(d => d.Inventory)
                    .WithMany(p => p.InventoryDates)
                    .HasForeignKey(d => d.InventoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryDate_Inventory");
            });

            modelBuilder.Entity<InventoryLocation>(entity =>
            {
                entity.ToTable("InventoryLocation");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.InventoryLocation1)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false)
                    .HasColumnName("InventoryLocation");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.CompanyId).HasColumnName("Company_Id");

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .IsUnicode(false);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Company");
            });

            modelBuilder.Entity<ProductItem>(entity =>
            {
                entity.ToTable("ProductItem");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.InventoryId).HasColumnName("Inventory_Id");

                entity.Property(e => e.ProductDateId).HasColumnName("ProductDate_Id");

                entity.Property(e => e.SerialNumber)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false);

                entity.HasOne(d => d.Inventory)
                    .WithMany(p => p.ProductItems)
                    .HasForeignKey(d => d.InventoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductItem_InventoryDate");

                entity.HasOne(d => d.ProductDate)
                    .WithMany(p => p.ProductItems)
                    .HasForeignKey(d => d.ProductDateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductItem_Product");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
