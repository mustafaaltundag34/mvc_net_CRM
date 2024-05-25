using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class FinansHesaplari
    {
        public FinansHesaplari() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            FinansHesapBakiye = 0;
        }
        [Key]
        public int FinansHesapid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string FinansHesapAdi { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string FinansHesapTuru { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string FinansHesapNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string FinansHesapIbanNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string FinansHesapSahibi { get; set; }
        public decimal FinansHesapBakiye { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(200)]
        public string FinansHesapAciklama { get; set; }

        public bool Durum { get; set; }

    }
}