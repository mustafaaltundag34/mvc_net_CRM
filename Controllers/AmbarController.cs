using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class AmbarController : Controller
    {
        // GET: Ambar
        Context c = new Context();
        public ActionResult Index()
        {
            //var kategoriler=c.Kategoris.ToList();
            var ambarlar = c.Ambars.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(ambarlar);
        }

        [HttpGet]
        public ActionResult AmbarEkle() //BOS FORM SAYFASI CAGIRIYOR
        {

            return View();
        }

        [HttpPost]
        public ActionResult AmbarEkle(Ambar k) //DB KAYDETME ISLEMI
        {
            k.Durum = true;
            c.Ambars.Add(k);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult AmbarGetir(int id) //DB KAYDETME ISLEMI
        {
            var ambardetay = c.Ambars.Find(id);
            return View("AmbarGetir", ambardetay);
        }
        public ActionResult AmbarGuncelle(Ambar k) //DB KAYDETME ISLEMI
        {
            var ambar = c.Ambars.Find(k.AmbarID);
            ambar.AmbarAdi = k.AmbarAdi;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult AmbarSil(int id)//DB SILME ISLEMI
        {
            var ambar = c.Ambars.Find(id);
            ambar.AmbarID = id;
            ambar.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}