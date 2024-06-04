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

    public class Urun
	{

        public Urun() //DEFAULT BILGILER VERILIYOR
        {
            Stok = 0;
            AlisFiyat = 0;
            SatisFiyat = 0;
            Durum = true;
            Kategoriid = 1;
            Markaid = 1;
            Barkod = "1234567890";//DEFAULT BARKOD BILGISI
        }

        [Key]
        public int  Urunid { get; set; }

		[Column(TypeName="Varchar")]
        [StringLength(30)]
        public string UrunAd { get; set; }

        public short  Stok { get; set; }

        public decimal AlisFiyat { get; set; }

        public decimal SatisFiyat{ get; set; }

        //public System.Nullable<decimal> SatisFiyat { get; set; } //NULL OLABILIR
        public bool Durum { get; set; }

        [Column(TypeName = "Varchar")]
        [StringLength(200)]

        public string UrunGorsel { get; set; }

        [StringLength(50)]
        public string Barkod { get; set; }
        public int Kategoriid {  get; set; }
		public virtual Kategori  Kategori { get; set; }//Kategori 1- % Urun //BURADA VIRTUAL ILE ILISKILI TABLODAN CEKILIYOR BILGI

        public int Markaid { get; set; }
        public virtual Marka Marka { get; set; }//Marka 1- % Urun //BURADA VIRTUAL ILE ILISKILI TABLODAN CEKILIYOR BILGI
        public ICollection<SatisHareket> SatisHarekets { get; set; }

    }
}

