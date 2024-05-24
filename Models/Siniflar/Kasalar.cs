using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Kasalar
    {

        public Kasalar() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }

        [Key]
        public int Kasaid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KasaAdi { get; set; }
        public decimal KasaBakiye { get; set; }

        public int Personelid { get; set; }
        public virtual Personel Personel { get; set; }
        public bool Durum { get; set; }
    }


}