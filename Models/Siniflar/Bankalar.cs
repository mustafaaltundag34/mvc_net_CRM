using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Bankalar
    {


        public Bankalar() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
            BankaBakiye = 0;
        }

        [Key]
        public int Bankaid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaAdi { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaHesapNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaIbanNo { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaHesapSahibi { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string BankaHesapTuru { get; set; }
        public decimal BankaBakiye { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(200)]
        public string BankaAciklama { get; set; }

        public bool Durum { get; set; }


    }
}