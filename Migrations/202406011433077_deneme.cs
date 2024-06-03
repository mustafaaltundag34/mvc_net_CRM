namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class deneme : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Faturalars", "FinansHesapid", c => c.Int(nullable: false));
            AddColumn("dbo.FinansalHarekets", "FinansalHareketTuruCari", c => c.String(maxLength: 30, unicode: false));
            AddColumn("dbo.FinansalHarekets", "FinansalHareketTuruFinansHesap", c => c.String(maxLength: 30, unicode: false));
            AddColumn("dbo.TransactionTasks", "CariBilgisi", c => c.String(maxLength: 50, unicode: false));
            AddColumn("dbo.TransactionTasks", "Tutar", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            CreateIndex("dbo.Faturalars", "FinansHesapid");
            AddForeignKey("dbo.Faturalars", "FinansHesapid", "dbo.FinansHesaplaris", "FinansHesapid", cascadeDelete: true);
            DropColumn("dbo.FinansalHarekets", "FinansalHareketTuru");
        }
        
        public override void Down()
        {
            AddColumn("dbo.FinansalHarekets", "FinansalHareketTuru", c => c.String(maxLength: 30, unicode: false));
            DropForeignKey("dbo.Faturalars", "FinansHesapid", "dbo.FinansHesaplaris");
            DropIndex("dbo.Faturalars", new[] { "FinansHesapid" });
            DropColumn("dbo.TransactionTasks", "Tutar");
            DropColumn("dbo.TransactionTasks", "CariBilgisi");
            DropColumn("dbo.FinansalHarekets", "FinansalHareketTuruFinansHesap");
            DropColumn("dbo.FinansalHarekets", "FinansalHareketTuruCari");
            DropColumn("dbo.Faturalars", "FinansHesapid");
        }
    }
}
