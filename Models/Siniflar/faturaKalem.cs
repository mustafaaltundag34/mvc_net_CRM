using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
namespace mvc_net_Crm.Models.Siniflar
{
    public class faturaKalem
    {

        public faturaKalem() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            //BelgeTuru = "FaturaKalemHareket";// FATURABELGETURUNE GORE OTOMATI GELICEK
            Tarih=DateTime.Now;
            Tutar = Adet * BirimFiyat;
        }
        [Key]
        public int FaturaKalemid { get; set; }



        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string StokHareketTuru { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string BelgeTuru { get; set; }
        public DateTime Tarih { get; set; }
        public int Adet { get; set; }
        public decimal BirimFiyat { get; set; }
        public int KdvOrani { get; set; }
        public decimal Tutar { get; set; }
        public bool Durum { get; set; }
        public int Urunid { get; set; }
        public virtual Urun Urun { get; set; }
        public int Ambarid { get; set; }
        public virtual Ambar Ambar { get; set; }
        public int Faturaid { get; set; }
        public virtual Faturalar Faturalar { get; set; }//Faturalar 1 - % FaturaKalem

    }
}
