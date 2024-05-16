namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.faturaKalems",
                c => new
                    {
                        FaturaKalemid = c.Int(nullable: false, identity: true),
                        UrunAd = c.String(maxLength: 100, unicode: false),
                        StokHareketTuru = c.String(maxLength: 30, unicode: false),
                        BelgeTuru = c.String(maxLength: 30, unicode: false),
                        Tarih = c.DateTime(nullable: false, precision: 0),
                        Miktar = c.Int(nullable: false),
                        BirimFiyat = c.Decimal(nullable: false, precision: 18, scale: 2),
                        KdvOrani = c.Int(nullable: false),
                        Tutar = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Durum = c.Boolean(nullable: false),
                        Urunid = c.Int(nullable: false),
                        Ambarid = c.Int(nullable: false),
                        Faturaid = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.FaturaKalemid)
                .ForeignKey("dbo.Ambars", t => t.Ambarid, cascadeDelete: true)
                .ForeignKey("dbo.Faturalars", t => t.Faturaid, cascadeDelete: true)
                .ForeignKey("dbo.Uruns", t => t.Urunid, cascadeDelete: true)
                .Index(t => t.Urunid)
                .Index(t => t.Ambarid)
                .Index(t => t.Faturaid);
            
            CreateTable(
                "dbo.Faturalars",
                c => new
                    {
                        Faturaid = c.Int(nullable: false, identity: true),
                        FaturaSeriNo = c.String(maxLength: 5, fixedLength: true, unicode: false, storeType: "char"),
                        FaturaSiraNo = c.String(maxLength: 6, unicode: false),
                        Tarih = c.DateTime(nullable: false, precision: 0),
                        VergiDairesi = c.String(maxLength: 30, unicode: false),
                        VergiNo = c.String(maxLength: 30, unicode: false),
                        Saat = c.String(maxLength: 5, fixedLength: true, unicode: false, storeType: "char"),
                        TeslimEden = c.String(maxLength: 30, unicode: false),
                        TeslimAlan = c.String(maxLength: 30, unicode: false),
                        Durum = c.Boolean(nullable: false),
                        KdvTutar = c.Decimal(nullable: false, precision: 18, scale: 2),
                        GenelToplam = c.Decimal(nullable: false, precision: 18, scale: 2),
                        FaturaTuru = c.String(maxLength: 30, unicode: false),
                        OdemeTuru = c.String(maxLength: 30, unicode: false),
                        Cariid = c.Int(nullable: false),
                        Personelid = c.Int(nullable: false),
                        Ambarid = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Faturaid)
                .ForeignKey("dbo.Ambars", t => t.Ambarid, cascadeDelete: true)
                .ForeignKey("dbo.Carilers", t => t.Cariid, cascadeDelete: true)
                .ForeignKey("dbo.Personels", t => t.Personelid, cascadeDelete: true)
                .Index(t => t.Cariid)
                .Index(t => t.Personelid)
                .Index(t => t.Ambarid);
            

            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.faturaKalems", "Urunid", "dbo.Uruns");
            DropForeignKey("dbo.Faturalars", "Personelid", "dbo.Personels");
            DropForeignKey("dbo.faturaKalems", "Faturaid", "dbo.Faturalars");
            DropForeignKey("dbo.Faturalars", "Cariid", "dbo.Carilers");
            DropForeignKey("dbo.Faturalars", "Ambarid", "dbo.Ambars");
            DropForeignKey("dbo.faturaKalems", "Ambarid", "dbo.Ambars");
            DropIndex("dbo.Faturalars", new[] { "Ambarid" });
            DropIndex("dbo.Faturalars", new[] { "Personelid" });
            DropIndex("dbo.Faturalars", new[] { "Cariid" });
            DropIndex("dbo.faturaKalems", new[] { "Faturaid" });
            DropIndex("dbo.faturaKalems", new[] { "Ambarid" });
            DropIndex("dbo.faturaKalems", new[] { "Urunid" });
            DropTable("dbo.Faturalars");
            DropTable("dbo.faturaKalems");
        }
    }
}
