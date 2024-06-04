using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Detay
    {

        public Detay() //DEFAULT BILGILER VERILIYOR
        {

        }
        [Key]
        public int Detayid { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string UrunAd { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(2000)]
        public string UrunBilgi { get; set; }


    }
}