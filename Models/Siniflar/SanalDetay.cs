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
    public class SanalDetay
    {
        public IEnumerable<Urun> Deger1 { get; set; }   
        public IEnumerable<Detay> Deger2 { get; set; }
    }
}