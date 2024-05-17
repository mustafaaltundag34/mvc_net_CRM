using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class StokHareketController : Controller
    {
        // GET: StokHareket

        Context c = new Context();
        public ActionResult Index()
        {
            var stokhareketler = c.StokHarekets.Where(x => x.Durum == true).ToList();
            return View(stokhareketler);
        }

        [HttpGet]
        public ActionResult StokHareketEkle() //BOS FORM SAYFASI CAGIRIYOR
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

            List<SelectListItem> ambar = (from x in c.Ambars.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.AmbarAdi,
                                                    Value = x.AmbarID.ToString()
                                                }
).ToList();
            ViewBag.dgr4 = ambar;

            List<SelectListItem> HareketTuruListesi = new List<SelectListItem>();
            HareketTuruListesi.Add(new SelectListItem { Text = "GIRIS", Value = "GIRIS" });
            HareketTuruListesi.Add(new SelectListItem { Text = "CIKIS", Value = "CIKIS" });


            ViewBag.dgr5 = HareketTuruListesi;
            return View();
        }

        [HttpPost]
        public ActionResult StokHareketEkle(StokHareket p) //DB KAYDETME ISLEMI
        {
            p.Durum = true;//AKTIF KAYIT
            p.Tarih = DateTime.Now;
            p.ToplamTutar = p.Adet * p.Fiyat;
            c.StokHarekets.Add(p);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult StokHareketSil(int id)//DB SILME ISLEMI
        {
            var stokhareketler = c.StokHarekets.Find(id);
            stokhareketler.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult StokHareketGetir(int id) //DB KAYDETME ISLEMI
        {
            var stokhareketbul = c.StokHarekets.Find(id);

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

            List<SelectListItem> ambar = (from x in c.Ambars.Where(x => x.Durum == true).ToList()
                                          select new SelectListItem
                                          {
                                              Text = x.AmbarAdi,
                                              Value = x.AmbarID.ToString()
                                          }
      ).ToList();
            ViewBag.dgr4 = ambar;

            List<SelectListItem> HareketTuruListesi = new List<SelectListItem>();
            HareketTuruListesi.Add(new SelectListItem { Text = "GIRIS", Value = "GIRIS" });
            HareketTuruListesi.Add(new SelectListItem { Text = "CIKIS", Value = "CIKIS" });

            ViewBag.dgr5 = HareketTuruListesi;

            return View("StokHareketGetir", stokhareketbul);
        }

        public ActionResult StokHareketGuncelle(StokHareket u) //DB KAYDETME ISLEMI
        {
            var stokhareketler = c.StokHarekets.Find(u.StokHareketid);
            stokhareketler.Urunid = u.Urunid;
            stokhareketler.Cariid = u.Cariid;
            stokhareketler.Personelid = u.Personelid;
            stokhareketler.Adet = u.Adet;
            stokhareketler.Fiyat = u.Fiyat;
            stokhareketler.ToplamTutar = u.Adet * u.Fiyat;
            stokhareketler.Durum = u.Durum;
            stokhareketler.StokHareketTuru=u.StokHareketTuru;
            stokhareketler.Tarih = u.Tarih;
            stokhareketler.Ambarid = u.Ambarid;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult StokHareketDetay(int id) //PERSONEL STOKHAREKET CAGIRMA
        {
            var degerler = c.StokHarekets.Where(x => x.StokHareketid == id && x.Durum == true).ToList();
            return View(degerler);
        }

        public ActionResult StokHareketPDF(int id)
        {
            //var urunler=c.Uruns.ToList();//KOSULSUZ LISTELEME
            var degerler = c.StokHarekets.Where(x => x.StokHareketid == id && x.Durum == true).ToList();
            return View(degerler);
        }



    }
}