using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class StokHareket
    {
        public StokHareket() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            Tarih=DateTime.Now;
            ToplamTutar = Adet * Fiyat;
        }

        [Key]
        public int StokHareketid { get; set; }
        //urun
        //cari
        //personel
        //ambar
        public DateTime Tarih { get; set; }
        public int Adet { get; set; }
        public decimal Fiyat { get; set; }
        public decimal ToplamTutar { get; set; }


        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string StokHareketTuru { get; set; }

        public int Urunid { get; set; }
        public int Cariid { get; set; }
        public int Personelid { get; set; }
        public int Ambarid { get; set; }

        public virtual Urun Urun { get; set; }
        public virtual Cariler Cariler { get; set; }
        public virtual Personel Personel { get; set; }
        public virtual Ambar Ambar { get; set; }

        public bool Durum { get; set; }
    }
}

