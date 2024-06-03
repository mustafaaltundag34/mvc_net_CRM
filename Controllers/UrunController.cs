using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using mvc_net_Crm.Models.Siniflar;
using Org.BouncyCastle.Asn1.Mozilla;

namespace mvc_net_Crm.Controllers
{
    public class UrunController : Controller
    {
        // GET: Urun
        Context c = new Context();
        public ActionResult Index()
        {
            //var urunler=c.Uruns.ToList();//KOSULSUZ LISTELEME
            var urunler = c.Uruns.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(urunler);
        }
        [HttpGet]
        public ActionResult UrunEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            //DROPDOWN DB LISTESINDEN VERI CEKILIYOR
            List<SelectListItem> Kategoriler = (from x in c.Kategoris.Where(x => x.Durum == true).ToList()
                                           select new SelectListItem
                                           {
                                               Text =x.KategoriAd,
                                               Value=x.KategoriID.ToString()
                                           }
                                          ).ToList();
            ViewBag.dgr1=Kategoriler;


            List<SelectListItem> Markalar = (from x in c.Markas.Where(x=> x.Durum==true).ToList()
                                           select new SelectListItem
                                           {
                                               Text = x.MarkaAd,
                                               Value = x.MarkaID.ToString()
                                           }
                              ).ToList();
            ViewBag.dgr2 = Markalar;

            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr3 = Durumlistesi;

            return View();
        }

        [HttpPost]
        public ActionResult UrunEkle(Urun p) //DB KAYDETME ISLEMI
        {
            p.Durum = true;//AKTIF KAYIT
            c.Uruns.Add(p);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UrunSil(int id)//DB SILME ISLEMI
        {
            var urun = c.Uruns.Find(id);
            urun.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UrunGetir(int id) //DB KAYDETME ISLEMI
        {
            var urunbul = c.Uruns.Find(id);

            List<SelectListItem> Kategoriler = (from x in c.Kategoris.Where(x => x.Durum==true).ToList()
                                                                      select new SelectListItem
                                                                      {
                                                                          Text = x.KategoriAd,
                                                                          Value = x.KategoriID.ToString()
                                                                      }).ToList();
            ViewBag.dgr1 = Kategoriler;

            List<SelectListItem> Markalar = (from x in c.Markas.Where(x=> x.Durum==true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.MarkaAd,
                                                 Value = x.MarkaID.ToString()
                                             }
                              ).ToList();
            ViewBag.dgr2 = Markalar;

            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr3 = Durumlistesi;

            return View("UrunGetir", urunbul);
        }

        public ActionResult UrunGuncelle(Urun u) //DB KAYDETME ISLEMI
        {
            var urungun = c.Uruns.Find(u.Urunid);
            urungun.UrunAd = u.UrunAd;
            urungun.Markaid = u.Markaid;
            urungun.AlisFiyat = u.AlisFiyat;
            urungun.SatisFiyat = u.SatisFiyat;
            urungun.Kategoriid = u.Kategoriid;
            urungun.Barkod = u.Barkod;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UrunStokHareket(int id)
        {
            var degerler = c.StokHarekets.Where(x => x.Urunid == id && x.Durum == true).ToList();//LINQ SORGUSUNDA AND && OR || ILE KULLANALIM
            var urun = c.Uruns.Where(x => x.Urunid == id).Select(y => y.UrunAd).FirstOrDefault();
            ViewBag.dgr1 = urun;
            return View(degerler);
        }

        public ActionResult UrunListesiPDF()
        {
            //var urunler=c.Uruns.ToList();//KOSULSUZ LISTELEME
            var urunler = c.Uruns.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(urunler);
        }

        public ActionResult UrunStokHareketALL(int id) //TUM STOK HAREKETLERI FATURA+STOKHAREKET CAGIRMA
        {
            var stokhareketleri = c.StokHarekets.Where(x => x.Urunid == id && x.Durum == true).Select(x => new OrtakStokHareketView
            {
                Z_TransactionNo=x.StokHareketid,
                Z_BelgeTuru = x.BelgeTuru,
                Z_Tarih = x.Tarih,
                Z_Urunid = x.Urunid,
                Z_UrunAd = x.Urun.UrunAd,
                Z_Adet = x.Adet,
                Z_StokHareketTuru = x.StokHareketTuru,
                Z_Ambarid = x.Ambar.AmbarAdi,
                Z_OnayDurumu=x.OnayStatusu
            }).ToList();    
            var faturakalemleri= c.FaturaKalems.Where(x => x.Urunid == id && x.Durum == true).Select(x => new OrtakStokHareketView
            {
                Z_TransactionNo = x.FaturaKalemid,
                Z_BelgeTuru = x.BelgeTuru,
                Z_Tarih = x.Tarih,
                Z_Urunid = x.Urunid,
                Z_UrunAd=x.Urun.UrunAd,
                Z_Adet = x.Adet,
                Z_StokHareketTuru = x.StokHareketTuru,
                Z_Ambarid = x.Ambar.AmbarAdi,
                Z_OnayDurumu = x.OnayStatusu
            }).ToList();
            var modelyeni = stokhareketleri.Union(faturakalemleri).ToList();
            var urun = c.Uruns.Where(x => x.Urunid == id).Select(y => y.UrunAd).FirstOrDefault();
            ViewBag.dgr1 = urun;
            return View(modelyeni);
        }

    }

    public class OrtakStokHareketView
    {
        public int Z_TransactionNo { get; set; }
        public string Z_BelgeTuru { get; set; }
        public DateTime Z_Tarih { get; set; }
        public int Z_Urunid { get; set; }
        public string Z_UrunAd { get; set; }
        public int Z_Adet { get; set; }   
        public string Z_StokHareketTuru { get; set; }
        public string Z_Ambarid { get; set; }
        public string Z_OnayDurumu { get; set; }
    }
}