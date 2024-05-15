namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class guncelleme : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Parametres",
                c => new
                    {
                        ParametreID = c.Int(nullable: false, identity: true),
                        ParametreTuru = c.String(maxLength: 30, unicode: false),
                        ParametreAciklamasi = c.String(maxLength: 30, unicode: false),
                        Durum = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ParametreID);
            
            AddColumn("dbo.Faturalars", "VergiNo", c => c.String(maxLength: 30, unicode: false));
            AddColumn("dbo.Faturalars", "KdvTutar", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Faturalars", "GenelToplam", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Faturalars", "FaturaTuru", c => c.String(maxLength: 30, unicode: false));
            AddColumn("dbo.Faturalars", "OdemeTuru", c => c.String(maxLength: 30, unicode: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Faturalars", "OdemeTuru");
            DropColumn("dbo.Faturalars", "FaturaTuru");
            DropColumn("dbo.Faturalars", "GenelToplam");
            DropColumn("dbo.Faturalars", "KdvTutar");
            DropColumn("dbo.Faturalars", "VergiNo");
            DropTable("dbo.Parametres");
        }
    }
}
