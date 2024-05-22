using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class FinansalHareket
    {

        public FinansalHareket() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            //HareketTuru = "ALACAK/BORC"; DBden Tetiklenecek
            Tarih = DateTime.Now;
            Saat = DateTime.Now.ToString("HH:mm");
        }
        //cari
        //personel
        //kasa parametrelerden cekilecek
        //belgeturu parametrelerden cekilecek

        [Key]
        public int FinansalHareketid { get; set; }

        public DateTime Tarih { get; set; }

        [Column(TypeName = "char")]
        [StringLength(5)]
        public string Saat { get; set; }
        public decimal Tutar { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BelgeTuru { get; set; }


        [Column(TypeName = "Varchar")]
        [StringLength(30)]
        public string FinansalHareketTuru { get; set; } //BORC/ALACAK BELGE TURUNE GORE OTOMATIK BELIRLENECEK


        public int Cariid { get; set; }
        public int Personelid { get; set; }

        public virtual Cariler Cariler { get; set; }
        public virtual Personel Personel { get; set; }

        public bool Durum { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string IbanNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaAdi { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaSubeAdi { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KrediKartNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KrediKartSKT { get; set; }
        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KrediKartCVC { get; set; }
        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KrediKartTIP { get; set; }
        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string CekSenetNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string CekSenetOdemeTarihi { get; set; }
        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string KasaAdi { get; set; }


        [Column(TypeName = "Varchar")]
        [StringLength(200)]
        public string Aciklama { get; set; }

    }
}