using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Marka
    {
        public Marka() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }

        [Key]
        public int MarkaID { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string MarkaAd { get; set; }
        public bool Durum { get; set; }
        public ICollection<Urun> Uruns { get; set; }//Marka 1- % Urun
        }

}