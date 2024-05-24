using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class KasaController : Controller
    {
        // GET: Kasa
        Context c = new Context();
        public ActionResult Index()
        {
            //var kategoriler=c.Kategoris.ToList();
            var kasalar = c.Kasalars.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(kasalar);
        }

        [HttpGet]
        public ActionResult KasaEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            List<SelectListItem> personel = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " "+ x.PersonelSoyad,
                                                    Value = x.Personelid.ToString()
                                                }
                              ).ToList();
            ViewBag.dgr1 = personel;

            return View();
        }


        [HttpPost]
        public ActionResult KasaEkle(Kasalar k) //DB KAYDETME ISLEMI
        {
            k.Durum = true;
            c.Kasalars.Add(k);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KasaGetir(int id) //DB KAYDETME ISLEMI
        {
            var kasadetay = c.Kasalars.Find(id);

            List<SelectListItem> personel = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                 Value = x.Personelid.ToString()
                                             }
                  ).ToList();
            ViewBag.dgr1 = personel;

            return View("KasaGetir", kasadetay);
        }

        public ActionResult KasaGuncelle(Kasalar k) //DB KAYDETME ISLEMI
        {
            var kasalar = c.Kasalars.Find(k.Kasaid);
            kasalar.KasaAdi = k.KasaAdi;
            kasalar.Personelid = k.Personelid;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KasaSil(int id)//DB SILME ISLEMI
        {
            var kasalar = c.Kasalars.Find(id);
            kasalar.Kasaid = id;
            kasalar.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}