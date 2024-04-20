using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
	public class Kategori
	{
        public Kategori() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }
        
        [Key]
		public int KategoriID { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string KategoriAd { get; set; }
        public bool Durum { get; set; }
        public ICollection<Urun> Uruns { get; set; }//Kategori 1- % Urun
    }
}

