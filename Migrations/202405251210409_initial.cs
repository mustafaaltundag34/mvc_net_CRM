namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {

            
            CreateTable(
                "dbo.FinansalHarekets",
                c => new
                    {
                        FinansalHareketid = c.Int(nullable: false, identity: true),
                        Tarih = c.DateTime(nullable: false, precision: 0),
                        Saat = c.String(maxLength: 5, fixedLength: true, unicode: false, storeType: "char"),
                        Tutar = c.Decimal(nullable: false, precision: 18, scale: 2),
                        BelgeTuru = c.String(maxLength: 50, unicode: false),
                        FinansalHareketTuru = c.String(maxLength: 30, unicode: false),
                        Cariid = c.Int(nullable: false),
                        Personelid = c.Int(nullable: false),
                        FinansHesapid = c.Int(nullable: false),
                        Durum = c.Boolean(nullable: false),
                        KrediKartNo = c.String(maxLength: 50, unicode: false),
                        KrediKartSKT = c.String(maxLength: 50, unicode: false),
                        KrediKartCVC = c.String(maxLength: 50, unicode: false),
                        KrediKartTIP = c.String(maxLength: 50, unicode: false),
                        CekSenetNo = c.String(maxLength: 50, unicode: false),
                        CekSenetOdemeTarihi = c.DateTime(nullable: false, precision: 0),
                        Aciklama = c.String(maxLength: 200, unicode: false),
                    })
                .PrimaryKey(t => t.FinansalHareketid)
                .ForeignKey("dbo.Carilers", t => t.Cariid, cascadeDelete: true)
                .ForeignKey("dbo.FinansHesaplaris", t => t.FinansHesapid, cascadeDelete: true)
                .ForeignKey("dbo.Personels", t => t.Personelid, cascadeDelete: true)
                .Index(t => t.Cariid)
                .Index(t => t.Personelid)
                .Index(t => t.FinansHesapid);
            
            CreateTable(
                "dbo.FinansHesaplaris",
                c => new
                    {
                        FinansHesapid = c.Int(nullable: false, identity: true),
                        FinansHesapAdi = c.String(maxLength: 50, unicode: false),
                        FinansHesapTuru = c.String(maxLength: 50, unicode: false),
                        FinansHesapNo = c.String(maxLength: 50, unicode: false),
                        FinansHesapIbanNo = c.String(maxLength: 50, unicode: false),
                        FinansHesapSahibi = c.String(maxLength: 50, unicode: false),
                        FinansHesapBakiye = c.Decimal(nullable: false, precision: 18, scale: 2),
                        FinansHesapAciklama = c.String(maxLength: 200, unicode: false),
                        Durum = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.FinansHesapid);
            
 
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.FinansalHarekets", "Personelid", "dbo.Personels");
            DropForeignKey("dbo.FinansalHarekets", "FinansHesapid", "dbo.FinansHesaplaris");
            DropForeignKey("dbo.FinansalHarekets", "Cariid", "dbo.Carilers");
            DropIndex("dbo.FinansalHarekets", new[] { "FinansHesapid" });
            DropIndex("dbo.FinansalHarekets", new[] { "Personelid" });
            DropIndex("dbo.FinansalHarekets", new[] { "Cariid" });
            DropTable("dbo.FinansHesaplaris");
            DropTable("dbo.FinansalHarekets");
        }
    }
}
