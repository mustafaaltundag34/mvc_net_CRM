namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {

            CreateTable(
                "dbo.Ambars",
                c => new
                    {
                        AmbarID = c.Int(nullable: false, identity: true),
                        AmbarAdi = c.String(maxLength: 30, unicode: false),
                        Durum = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.AmbarID);
            
            CreateTable(
                "dbo.StokHarekets",
                c => new
                    {
                        StokHareketid = c.Int(nullable: false, identity: true),
                        Tarih = c.DateTime(nullable: false, precision: 0),
                        Adet = c.Int(nullable: false),
                        Fiyat = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ToplamTutar = c.Decimal(nullable: false, precision: 18, scale: 2),
                        StokHareketTuru = c.String(maxLength: 30, unicode: false),
                        Urunid = c.Int(nullable: false),
                        Cariid = c.Int(nullable: false),
                        Personelid = c.Int(nullable: false),
                        Ambarid = c.Int(nullable: false),
                        Durum = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.StokHareketid)
                .ForeignKey("dbo.Ambars", t => t.Ambarid, cascadeDelete: true)
                .ForeignKey("dbo.Carilers", t => t.Cariid, cascadeDelete: true)
                .ForeignKey("dbo.Personels", t => t.Personelid, cascadeDelete: true)
                .ForeignKey("dbo.Uruns", t => t.Urunid, cascadeDelete: true)
                .Index(t => t.Urunid)
                .Index(t => t.Cariid)
                .Index(t => t.Personelid)
                .Index(t => t.Ambarid);
            
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.StokHarekets", "Urunid", "dbo.Uruns");
            DropForeignKey("dbo.StokHarekets", "Personelid", "dbo.Personels");
            DropForeignKey("dbo.StokHarekets", "Cariid", "dbo.Carilers");
            DropForeignKey("dbo.StokHarekets", "Ambarid", "dbo.Ambars");
            DropIndex("dbo.StokHarekets", new[] { "Ambarid" });
            DropIndex("dbo.StokHarekets", new[] { "Personelid" });
            DropIndex("dbo.StokHarekets", new[] { "Cariid" });
            DropIndex("dbo.StokHarekets", new[] { "Urunid" });
            DropTable("dbo.StokHarekets");
            DropTable("dbo.Ambars");
        }
    }
}
