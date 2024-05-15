namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Guncelbelgeturu : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.StokHarekets", "BelgeTuru", c => c.String(maxLength: 30, unicode: false));
            AddColumn("dbo.faturaKalems", "BelgeTuru", c => c.String(maxLength: 30, unicode: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.faturaKalems", "BelgeTuru");
            DropColumn("dbo.StokHarekets", "BelgeTuru");
        }
    }
}
