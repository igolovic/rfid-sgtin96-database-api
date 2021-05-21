using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace ProductInventoryApi.Models
{
    public partial class ProductInventoryApi_dbContext : DbContext
    {
        public ProductInventoryApi_dbContext()
        {
        }

        public ProductInventoryApi_dbContext(DbContextOptions<ProductInventoryApi_dbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Inventory> Inventories { get; set; }
        public virtual DbSet<InventoryDateLocation> InventoryDateLocations { get; set; }
        public virtual DbSet<InventoryLocation> InventoryLocations { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductItem> ProductItems { get; set; }
        public virtual DbSet<VCountOfInventoriedItemsGroupedBySpecificCompany> VCountOfInventoriedItemsGroupedBySpecificCompanies { get; set; }
        public virtual DbSet<VCountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory> VCountOfInventoriedItemsGroupedBySpecificProductForSpecificInventories { get; set; }
        public virtual DbSet<VCountOfInventoriedItemsGroupedBySpecificProductPerDay> VCountOfInventoriedItemsGroupedBySpecificProductPerDays { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Croatian_CI_AS");

            modelBuilder.Entity<Company>(entity =>
            {
                entity.ToTable("Company");

                entity.HasIndex(e => e.CompanyPrefix, "UQ__Company__C2281033CA6534FB")
                    .IsUnique();

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Inventory>(entity =>
            {
                entity.ToTable("Inventory");

                entity.HasIndex(e => e.InventoryId, "UQ__Inventor__F5FDE6B2A39D2A44")
                    .IsUnique();

                entity.Property(e => e.InventoryId)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<InventoryDateLocation>(entity =>
            {
                entity.ToTable("InventoryDateLocation");

                entity.HasIndex(e => new { e.InventoryId, e.InventoryDate, e.InventoryLocationId }, "UQ__Inventor__C4422681C1203420")
                    .IsUnique();

                entity.Property(e => e.InventoryId).HasColumnName("Inventory_Id");

                entity.Property(e => e.InventoryLocationId).HasColumnName("InventoryLocation_Id");

                entity.HasOne(d => d.Inventory)
                    .WithMany(p => p.InventoryDateLocations)
                    .HasForeignKey(d => d.InventoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryDateLocation_Inventory");

                entity.HasOne(d => d.InventoryLocation)
                    .WithMany(p => p.InventoryDateLocations)
                    .HasForeignKey(d => d.InventoryLocationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryDateLocation_InventoryLocation");
            });

            modelBuilder.Entity<InventoryLocation>(entity =>
            {
                entity.ToTable("InventoryLocation");

                entity.HasIndex(e => e.InventoryLocationName, "UQ__Inventor__EC750B4FCED41B54")
                    .IsUnique();

                entity.Property(e => e.InventoryLocationName)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.HasIndex(e => new { e.CompanyId, e.ItemReference }, "UQ__Product__12045DE22D81EEB1")
                    .IsUnique();

                entity.Property(e => e.CompanyId).HasColumnName("Company_Id");

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(512)
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

                entity.HasIndex(e => new { e.ProductId, e.InventoryDateLocationId, e.SerialNumber }, "UQ__ProductI__6B86F9ABA142D6C8")
                    .IsUnique();

                entity.Property(e => e.InventoryDateLocationId).HasColumnName("InventoryDateLocation_Id");

                entity.Property(e => e.ProductId).HasColumnName("Product_Id");

                entity.HasOne(d => d.InventoryDateLocation)
                    .WithMany(p => p.ProductItems)
                    .HasForeignKey(d => d.InventoryDateLocationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductItem_InventoryDateLocation");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductItems)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductItem_Product");
            });

            modelBuilder.Entity<VCountOfInventoriedItemsGroupedBySpecificCompany>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("v_CountOfInventoriedItemsGroupedBySpecificCompany");

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VCountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("v_CountOfInventoriedItemsGroupedBySpecificProductForSpecificInventory");

                entity.Property(e => e.InventoryId)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VCountOfInventoriedItemsGroupedBySpecificProductPerDay>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("v_CountOfInventoriedItemsGroupedBySpecificProductPerDay");

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasMaxLength(512)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
