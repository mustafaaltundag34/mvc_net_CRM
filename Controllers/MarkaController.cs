using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class MarkaController : Controller
    {
        Context c = new Context();
        // GET: Marka
        public ActionResult Index()
        {
            //var departmanlar=c.Departmans.ToList();//KOSULSUZ LISTELEME
            var markalar = c.Markas.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(markalar);
        }
        [HttpGet]
        public ActionResult MarkaEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            //DROPDOWN DB LISTESINDEN VERI CEKILIYOR
            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr1 = Durumlistesi;

            return View();
        }

        [HttpPost]
        public ActionResult MarkaEkle(Marka m) //DB KAYDETME ISLEMI
        {
            m.Durum = true;//AKTIF KAYIT
            c.Markas.Add(m);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult MarkaSil(int id)//DB SILME ISLEMI
        {
            var markalar = c.Markas.Find(id);
            markalar.MarkaID = id;
            markalar.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult MarkaGetir(int id) //DB KAYDETME ISLEMI
        {
            var markabul = c.Markas.Find(id);

            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr1 = Durumlistesi;

            return View("MarkaGetir", markabul);
        }

        public ActionResult MarkaGuncelle(Marka m) //DB KAYDETME ISLEMI
        {
            var markagun = c.Markas.Find(m.MarkaID);
            markagun.MarkaAd = m.MarkaAd;
            markagun.Durum = m.Durum;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}