using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.Expressions;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class ParametreController : Controller
    {
        // GET: Parametre
        Context c = new Context();
        public ActionResult Index()
        {
            //var kategoriler=c.Kategoris.ToList();
            var parametreler = c.Parametres.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(parametreler);
        }

        [HttpGet]
        public ActionResult ParametreEkle() //BOS FORM SAYFASI CAGIRIYOR
        {

            return View();
        }

        [HttpPost]
        public ActionResult ParametreEkle(Parametre k) //DB KAYDETME ISLEMI
        {
            k.Durum = true;
            c.Parametres.Add(k);
            c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult ParametreSil(int id)//DB SILME ISLEMI
        {
            var param = c.Parametres.Find(id);
            param.ParametreID = id;
            param.Durum = false;
            //c.Kategoris.Remove(kate);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ParametreGetir(int id) //DB KAYDETME ISLEMI
        {
            var parametre = c.Parametres.Find(id);
            return View("ParametreGetir", parametre);
        }

        public ActionResult ParametreGuncelle(Parametre k) //DB KAYDETME ISLEMI
        {
            var param = c.Parametres.Find(k.ParametreID);
            param.ParametreTuru = k.ParametreTuru;
            param.ParametreAciklamasi = k.ParametreAciklamasi;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}