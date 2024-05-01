using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Ambar
    {
        public Ambar() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }

        [Key]
        public int AmbarID { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string AmbarAdi { get; set; }
        public bool Durum { get; set; }
        public ICollection<StokHareket> StokHarekets{ get; set; }//Kategori 1- % StokHarekets
    }
}