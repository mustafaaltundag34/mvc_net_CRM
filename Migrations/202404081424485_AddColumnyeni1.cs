namespace mvc_net_Crm.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddColumnyeni1 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Uruns", "UrunGorsel", c => c.String(nullable: true, maxLength: 50, unicode: false, defaultValue: "TestMigrationUP"));
            
        }

        public override void Down()
        {
            AlterColumn("dbo.Uruns", "UrunGorsel", c => c.String(maxLength: 60, unicode: false));
        }
    }
}
