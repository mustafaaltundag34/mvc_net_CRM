using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class CariController : Controller
    {
        // GET: Cari
        Context c = new Context();    
        public ActionResult Index()
        {
            var cariler= c.Carilers.Where(x=>x.Durum==true).ToList();
            return View(cariler);
        }

        [HttpGet]
        public ActionResult CariEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            List<SelectListItem> Sehirlistesi = new List<SelectListItem>();
            Sehirlistesi.Add(new SelectListItem { Text = "Adana", Value = "Adana" });
            Sehirlistesi.Add(new SelectListItem { Text = "Adiyaman", Value = "Adiyaman" });
            Sehirlistesi.Add(new SelectListItem { Text = "Afyon", Value = "Afyon" });
            Sehirlistesi.Add(new SelectListItem { Text = "Ankara", Value = "Ankara" });
            Sehirlistesi.Add(new SelectListItem { Text = "Antalya", Value = "Antalya" });
            Sehirlistesi.Add(new SelectListItem { Text = "Istanbul", Value = "Istanbul" });
            Sehirlistesi.Add(new SelectListItem { Text = "Diyarbakir", Value = "Diyarbakir" });
            Sehirlistesi.Add(new SelectListItem { Text = "Mardin", Value = "Mardin" });
            Sehirlistesi.Add(new SelectListItem { Text = "Samsun", Value = "Samsun" });
            Sehirlistesi.Add(new SelectListItem { Text = "Zonguldak", Value = "Zonguldak" });

            ViewBag.dgr1 = Sehirlistesi;
            return View();
        }

        [HttpPost]
        public ActionResult CariEkle(Cariler d) //DB KAYDETME ISLEMI
        {
            if (!ModelState.IsValid)
            {
                List<SelectListItem> Sehirlistesi = new List<SelectListItem>();
                Sehirlistesi.Add(new SelectListItem { Text = "Adana", Value = "Adana" });
                Sehirlistesi.Add(new SelectListItem { Text = "Adiyaman", Value = "Adiyaman" });
                Sehirlistesi.Add(new SelectListItem { Text = "Afyon", Value = "Afyon" });
                Sehirlistesi.Add(new SelectListItem { Text = "Ankara", Value = "Ankara" });
                Sehirlistesi.Add(new SelectListItem { Text = "Antalya", Value = "Antalya" });
                Sehirlistesi.Add(new SelectListItem { Text = "Istanbul", Value = "Istanbul" });
                Sehirlistesi.Add(new SelectListItem { Text = "Diyarbakir", Value = "Diyarbakir" });
                Sehirlistesi.Add(new SelectListItem { Text = "Mardin", Value = "Mardin" });
                Sehirlistesi.Add(new SelectListItem { Text = "Samsun", Value = "Samsun" });
                Sehirlistesi.Add(new SelectListItem { Text = "Zonguldak", Value = "Zonguldak" });

                ViewBag.dgr1 = Sehirlistesi;

                return View("CariEkle");

            }
            else
            {
                d.Durum = true;
                c.Carilers.Add(d);
                c.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        public ActionResult CariSil(int id)//DB SILME ISLEMI
        {
            var cari = c.Carilers.Find(id);
            cari.Cariid = id;
            cari.Durum = false;
            //c.Kategoris.Remove(kate);
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult CariGetir(int id) //DB KAYDETME ISLEMI
        {
            var cari = c.Carilers.Find(id);

            List<SelectListItem> Sehirlistesi = new List<SelectListItem>();
            Sehirlistesi.Add(new SelectListItem { Text = "Adana", Value = "Adana" });
            Sehirlistesi.Add(new SelectListItem { Text = "Adiyaman", Value = "Adiyaman" });
            Sehirlistesi.Add(new SelectListItem { Text = "Afyon", Value = "Afyon" });
            Sehirlistesi.Add(new SelectListItem { Text = "Ankara", Value = "Ankara" });
            Sehirlistesi.Add(new SelectListItem { Text = "Antalya", Value = "Antalya" });
            Sehirlistesi.Add(new SelectListItem { Text = "Istanbul", Value = "Istanbul" });
            Sehirlistesi.Add(new SelectListItem { Text = "Diyarbakir", Value = "Diyarbakir" });
            Sehirlistesi.Add(new SelectListItem { Text = "Mardin", Value = "Mardin" });
            Sehirlistesi.Add(new SelectListItem { Text = "Samsun", Value = "Samsun" });
            Sehirlistesi.Add(new SelectListItem { Text = "Zonguldak", Value = "Zonguldak" });

            ViewBag.dgr1 = Sehirlistesi;

            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr2 = Durumlistesi;

            return View("CariGetir", cari);
        }

        public ActionResult CariGuncelle(Cariler k) //DB KAYDETME ISLEMI
        {
            if (!ModelState.IsValid)
            {
                List<SelectListItem> Sehirlistesi = new List<SelectListItem>();
                Sehirlistesi.Add(new SelectListItem { Text = "Adana", Value = "Adana" });
                Sehirlistesi.Add(new SelectListItem { Text = "Adiyaman", Value = "Adiyaman" });
                Sehirlistesi.Add(new SelectListItem { Text = "Afyon", Value = "Afyon" });
                Sehirlistesi.Add(new SelectListItem { Text = "Ankara", Value = "Ankara" });
                Sehirlistesi.Add(new SelectListItem { Text = "Antalya", Value = "Antalya" });
                Sehirlistesi.Add(new SelectListItem { Text = "Istanbul", Value = "Istanbul" });
                Sehirlistesi.Add(new SelectListItem { Text = "Diyarbakir", Value = "Diyarbakir" });
                Sehirlistesi.Add(new SelectListItem { Text = "Mardin", Value = "Mardin" });
                Sehirlistesi.Add(new SelectListItem { Text = "Samsun", Value = "Samsun" });
                Sehirlistesi.Add(new SelectListItem { Text = "Zonguldak", Value = "Zonguldak" });

                ViewBag.dgr1 = Sehirlistesi;

                List<SelectListItem> Durumlistesi = new List<SelectListItem>();
                Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
                Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

                ViewBag.dgr2 = Durumlistesi;

                var cari = c.Carilers.Find(k.Cariid);
                return View("CariGetir",cari);
                //return View("Cariler");


            }
            else
            {
                var cari = c.Carilers.Find(k.Cariid);
                cari.CariAd = k.CariAd;
                cari.CariSoyad = k.CariSoyad;
                cari.CariSehir = k.CariSehir;
                cari.CariMail = k.CariMail;
                cari.Durum = k.Durum;
                c.SaveChanges();
                return RedirectToAction("Index");
            }

        }

        public ActionResult MusteriStokHareket(int id)
        {
            var degerler=c.StokHarekets.Where(x=>x.Cariid==id && x.Durum==true).ToList();
            var musteri = c.Carilers.Where(x => x.Cariid == id).Select(y => y.CariAd + " " + y.CariSoyad).FirstOrDefault();
            ViewBag.dgr1 = musteri;
            return View(degerler);
        }

    }
}