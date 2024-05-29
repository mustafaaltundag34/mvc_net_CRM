﻿using System;
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
            //BelgeTuru = "IRSALIYE_ALIS"; //OTOMATIKGELECEK
            Tarih=DateTime.Now;
            ToplamTutar = Adet * Fiyat;
            OnayStatusu = "OnayBekliyor";//KAYITLAR OTOMATIK OLARAK ONAY BEKLIYOR STATUSUNDE ACILIYOR
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

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string BelgeTuru { get; set; }
        public int Urunid { get; set; }
        public int Cariid { get; set; }
        public int Personelid { get; set; }
        public int Ambarid { get; set; }

        public virtual Urun Urun { get; set; }
        public virtual Cariler Cariler { get; set; }
        public virtual Personel Personel { get; set; }
        public virtual Ambar Ambar { get; set; }

        public bool Durum { get; set; }

        // // // ONAYKONTROLU // FATURA ONAYLANDIGINDA OTOMATIK ONAYLANIP HESAPLAMALAR YAPILACAK


        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string OnayStatusu { get; set; }

        //public DateTime OnayTarih { get; set; }
    }
}

