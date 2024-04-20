using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using MySql.Data.EntityFramework;
using MySql.Data.MySqlClient;
using System.Reflection.Emit;


//Db Context Baglantisi Olusturuluyor

namespace mvc_net_Crm.Models.Siniflar
{
    [DbConfigurationType(typeof(MySqlEFConfiguration))]//MYSQLDE FARKLI OLARAK BURASI EKLENDI
    public class Context : DbContext
    {
        public DbSet<Admin> Admins { get; set; }
        public DbSet<Cariler> Carilers { get; set; }
        public DbSet<Departman> Departmans { get; set; }
        public DbSet<faturaKalem> FaturaKalems { get; set; }
        public DbSet<Faturalar> Faturalars { get; set; }
        public DbSet<Gider> Giders { get; set; }
        public DbSet<Kategori> Kategoris { get; set; }
        public DbSet<Personel> Personels { get; set; }
        public DbSet<SatisHareket> SatisHarekets { get; set; }
        public DbSet<Urun> Uruns { get; set; }
        public DbSet<Marka> Markas { get; set; }

        public Context(): base("Context") { }//MYSQLDE FARKLI OLARAK BURASI EKLENDI //Reference the name of your connection string:
    }
}
