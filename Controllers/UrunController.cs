using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

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
            List<SelectListItem> deger1 = (from x in c.Kategoris.ToList()
                                           select new SelectListItem
                                           {
                                               Text =x.KategoriAd,
                                               Value=x.KategoriID.ToString()
                                           }
                                          ).ToList();
            ViewBag.dgr1=deger1;

            List<SelectListItem> Markalar = new List<SelectListItem>();
            Markalar.Add(new SelectListItem { Text = "Arcelik", Value = "Arcelik" });
            Markalar.Add(new SelectListItem { Text = "Beko", Value = "Beko" });
            Markalar.Add(new SelectListItem { Text = "Sony", Value = "Sony" });
            Markalar.Add(new SelectListItem { Text = "Samsung", Value = "Samsung" });
            Markalar.Add(new SelectListItem { Text = "Iphone", Value = "Iphone" });
            ViewBag.dgr2 = Markalar;

            return View();
        }

        [HttpPost]
        public ActionResult UrunEkle(Urun p) //DB KAYDETME ISLEMI
        {
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

            List<SelectListItem> deger1 = (from x in c.Kategoris.ToList()
                                           select new SelectListItem
                                           {
                                               Text = x.KategoriAd,
                                               Value = x.KategoriID.ToString()
                                           }
                              ).ToList();
            ViewBag.dgr1 = deger1;

            List<SelectListItem> Markalar = new List<SelectListItem>();
            Markalar.Add(new SelectListItem { Text = "Arcelik", Value = "Arcelik" });
            Markalar.Add(new SelectListItem { Text = "Beko", Value = "Beko" });
            Markalar.Add(new SelectListItem { Text = "Sony", Value = "Sony" });
            Markalar.Add(new SelectListItem { Text = "Samsung", Value = "Samsung" });
            Markalar.Add(new SelectListItem { Text = "Iphone", Value = "Iphone" });
            ViewBag.dgr2 = Markalar;

            return View("UrunGetir", urunbul);
        }

        public ActionResult UrunGuncelle(Urun u) //DB KAYDETME ISLEMI
        {
            var urungun = c.Uruns.Find(u.Urunid);
            urungun.UrunAd = u.UrunAd;
            urungun.Marka = u.Marka;
            urungun.AlisFiyat = u.AlisFiyat;
            urungun.SatisFiyat = u.SatisFiyat;
            urungun.Kategoriid = u.Kategoriid;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}