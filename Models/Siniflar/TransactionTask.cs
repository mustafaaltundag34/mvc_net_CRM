using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class TransactionTask
    {

        public TransactionTask() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            OnayStatusu = "OnayBekliyor"; //Onaylandi //RedEdildi
            AcilisTarihi = DateTime.Now;
            SonIslemTarihi = DateTime.Now;
            //ToplamTutar = Adet * Fiyat;
        }


        [Key]
        public int TransactionTaskid { get; set; }


        public int Belgeid { get; set; }
        public DateTime AcilisTarihi { get; set; }
        public DateTime SonIslemTarihi { get; set; }


        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BelgeTuru { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KayitAcanUser { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KayitOnaylayanUser { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string OnayStatusu { get; set; }

        public bool Durum { get; set; }

    }
}