namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class faturaguncelleme : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.faturaKalems", "StokHareketTuru", c => c.String(maxLength: 30, unicode: false));
            AddColumn("dbo.faturaKalems", "KdvOrani", c => c.Int(nullable: false));
            AddColumn("dbo.faturaKalems", "Durum", c => c.Boolean(nullable: false));
            AddColumn("dbo.faturaKalems", "Ambarid", c => c.Int(nullable: false));
            AddColumn("dbo.Faturalars", "Cariid", c => c.Int(nullable: false));
            AddColumn("dbo.Faturalars", "Personelid", c => c.Int(nullable: false));
            AddColumn("dbo.Faturalars", "Ambarid", c => c.Int(nullable: false));
            CreateIndex("dbo.faturaKalems", "Ambarid");
            CreateIndex("dbo.Faturalars", "Cariid");
            CreateIndex("dbo.Faturalars", "Personelid");
            CreateIndex("dbo.Faturalars", "Ambarid");
            AddForeignKey("dbo.faturaKalems", "Ambarid", "dbo.Ambars", "AmbarID", cascadeDelete: true);
            AddForeignKey("dbo.Faturalars", "Ambarid", "dbo.Ambars", "AmbarID", cascadeDelete: true);
            AddForeignKey("dbo.Faturalars", "Cariid", "dbo.Carilers", "Cariid", cascadeDelete: true);
            AddForeignKey("dbo.Faturalars", "Personelid", "dbo.Personels", "Personelid", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Faturalars", "Personelid", "dbo.Personels");
            DropForeignKey("dbo.Faturalars", "Cariid", "dbo.Carilers");
            DropForeignKey("dbo.Faturalars", "Ambarid", "dbo.Ambars");
            DropForeignKey("dbo.faturaKalems", "Ambarid", "dbo.Ambars");
            DropIndex("dbo.Faturalars", new[] { "Ambarid" });
            DropIndex("dbo.Faturalars", new[] { "Personelid" });
            DropIndex("dbo.Faturalars", new[] { "Cariid" });
            DropIndex("dbo.faturaKalems", new[] { "Ambarid" });
            DropColumn("dbo.Faturalars", "Ambarid");
            DropColumn("dbo.Faturalars", "Personelid");
            DropColumn("dbo.Faturalars", "Cariid");
            DropColumn("dbo.faturaKalems", "Ambarid");
            DropColumn("dbo.faturaKalems", "Durum");
            DropColumn("dbo.faturaKalems", "KdvOrani");
            DropColumn("dbo.faturaKalems", "StokHareketTuru");
        }
    }
}
