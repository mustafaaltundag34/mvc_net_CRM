﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
	public class Gider
	{
        public Gider() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }

        [Key]
        public int Giderid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(100)]
        public string Aciklama { get; set; }
        public DateTime Tarih { get; set; }
        public decimal Tutar { get; set; }

        public bool Durum {  get; set; }    
    }
}

