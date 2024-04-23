using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class SatisController : Controller
    {
        // GET: Satis
        Context c = new Context();
        public ActionResult Index()
        {
            var satislar= c.SatisHarekets.Where(x=>x.Durum==true).ToList(); 
            return View(satislar);
        }
        [HttpGet]
        public ActionResult SatisEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            List<SelectListItem> Urunler = (from x in c.Uruns.Where(x => x.Durum == true).ToList()
                                                 select new SelectListItem
                                                 {
                                                     Text = x.UrunAd,
                                                     Value = x.Urunid.ToString()
                                                 }
                              ).ToList();
            ViewBag.dgr1 = Urunler;

            List<SelectListItem> Cariler = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd +" "+x.CariSoyad,
                                                Value = x.Cariid.ToString()
                                            }
                  ).ToList();
            ViewBag.dgr2 = Cariler;

            List<SelectListItem> Personeller = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                Value = x.Personelid.ToString()
                                            }
      ).ToList();
            ViewBag.dgr3 = Personeller;
            return View();
        }

        [HttpPost]
        public ActionResult SatisEkle(SatisHareket p) //DB KAYDETME ISLEMI
        {
            p.Durum = true;//AKTIF KAYIT
            p.Tarih = DateTime.Now;
            c.SatisHarekets.Add(p);
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult SatisSil(int id)//DB SILME ISLEMI
        {
            var satislar = c.SatisHarekets.Find(id);
            satislar.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult SatisGetir(int id) //DB KAYDETME ISLEMI
        {
            var satisbul = c.SatisHarekets.Find(id);

            List<SelectListItem> Urunler = (from x in c.Uruns.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.UrunAd,
                                                Value = x.Urunid.ToString()
                                            }
                               ).ToList();
            ViewBag.dgr1 = Urunler;

            List<SelectListItem> Cariler = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd + " " + x.CariSoyad,
                                                Value = x.Cariid.ToString()
                                            }
                  ).ToList();
            ViewBag.dgr2 = Cariler;

            List<SelectListItem> Personeller = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.Personelid.ToString()
                                                }
      ).ToList();
            ViewBag.dgr3 = Personeller;


            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr4 = Durumlistesi;

            return View("SatisGetir", satisbul);
        }
        public ActionResult SatisGuncelle(SatisHareket u) //DB KAYDETME ISLEMI
        {
            var satislar = c.SatisHarekets.Find(u.Satisid);
            satislar.Urunid = u.Urunid;
            satislar.Cariid = u.Cariid;
            satislar.Personelid = u.Personelid;
            satislar.Adet = u.Adet;
            satislar.Fiyat = u.Fiyat;
            satislar.ToplamTutar = u.ToplamTutar;
            satislar.Durum = u.Durum;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}