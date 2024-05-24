﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
	public class Cariler
	{
        public Cariler() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }

        [Key]
        public int Cariid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30, ErrorMessage="En Fazla 30 Karakter Girebilirsiniz")]
        [Required(ErrorMessage ="Bu Alani Bos Gecemezsiniz!")]
        public string CariAd { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(30, ErrorMessage = "En Fazla 30 Karakter Girebilirsiniz")]
        [Required(ErrorMessage = "Bu Alani Bos Gecemezsiniz!")]
        public string CariSoyad { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(20)]
        public string CariSehir { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(100)]
        public string CariMail { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(80)]
        public string CariOzelSoruCevap { get; set; }

        public decimal CariBakiye { get; set; }
        public bool Durum { get; set; }
        public ICollection<SatisHareket> SatisHarekets { get; set; }
    }
}

