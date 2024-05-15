using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace mvc_net_Crm.Models.Siniflar
{
    public class Parametre
    {


        public Parametre() //DEFAULT BILGILER VERILIYOR
        {
            Durum = true;
        }


    [Key]
    public int ParametreID { get; set; }

    [Column(TypeName = "Varchar")]
    [StringLength(30)]
    public string ParametreTuru { get; set; }

    [Column(TypeName = "Varchar")]
    [StringLength(30)]
    public string ParametreAciklamasi { get; set; }
    public bool Durum { get; set; }

    }

}



