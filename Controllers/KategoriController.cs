using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class KategoriController : Controller
    {
        // GET: Kategori
        Context c= new Context();   //DB CONTEXTTEN BIR SINIF URETIYORUZ

        public ActionResult Index()
        {
            var degerler=c.Kategoris.ToList();  
            return View(degerler);
        }

        [HttpGet]
        public ActionResult KategoriEkle() //BOS FORM SAYFASI CAGIRIYOR
        {

            return View();
        }

        [HttpPost]
        public ActionResult KategoriEkle(Kategori k) //DB KAYDETME ISLEMI
        {
            c.Kategoris.Add(k);
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult KategoriSil(int id)//DB SILME ISLEMI
        {
            var kate=c.Kategoris.Find(id);
            kate.KategoriID = id;
            c.Kategoris.Remove(kate);
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult KategoriGetir(int id) //DB KAYDETME ISLEMI
        {
            var kategori = c.Kategoris.Find(id);
            return View("KategoriGetir",kategori);
        }

        public ActionResult KategoriGuncelle(Kategori k) //DB KAYDETME ISLEMI
        {
            var kate = c.Kategoris.Find(k.KategoriID);
            kate.KategoriAd = k.KategoriAd;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}