using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Faturalar
    {
        public Faturalar() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            Tarih = DateTime.Now;
            Saat = DateTime.Now.ToString("HH:mm");
            GenelToplam = 0;
            KdvTutar = 0;
            //BelgeTuru = "FATURA_ALIS";//PARAMETRELERDEN CEKILECEK FATURA_ALIS VEYA FATURA_SATIS TURUNE GORE FATURAHAREKETTURU OTOMATIK GELECEK
        }

        [Key]
        public int Faturaid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BelgeTuru { get; set; }

        [Column(TypeName = "Char")]
        [StringLength(5)]
        public string FaturaSeriNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(6)]
        public string FaturaSiraNo { get; set; }
        public DateTime Tarih { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string VergiDairesi { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string VergiNo { get; set; }

        [Column(TypeName = "char")]
        [StringLength(5)]
        public string  Saat { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string TeslimEden { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string TeslimAlan { get; set; }

        public bool Durum {  get; set; }


        public decimal KdvTutar { get; set; }
        public decimal GenelToplam { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string FaturaHareketTuru { get; set; }// BELGE TURUNE GORE BORC/ALACAK

        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string OdemeTuru { get; set; }


        public int Cariid { get; set; }
        public int Personelid { get; set; }
        public int Ambarid { get; set; }

        public virtual Cariler Cariler { get; set; }
        public virtual Personel Personel { get; set; }
        public virtual Ambar Ambar { get; set; }

        public ICollection<faturaKalem> FaturaKalems { get; set; }//Faturalar 1 - % FaturaKalem
    }

}