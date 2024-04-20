using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class DepartmanController : Controller
    {
        Context c = new Context();
        // GET: Departman
        public ActionResult Index()
        {
            //var departmanlar=c.Departmans.ToList();//KOSULSUZ LISTELEME
            var departmanlar = c.Departmans.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(departmanlar);
        }

        [HttpGet]
        public ActionResult DepartmanEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            //DROPDOWN DB LISTESINDEN VERI CEKILIYOR
            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value="True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });
          
            ViewBag.dgr1 = Durumlistesi;

            return View();
        }

        [HttpPost]
        public ActionResult DepartmanEkle(Departman d) //DB KAYDETME ISLEMI
        {
            c.Departmans.Add(d);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DepartmanSil(int id)//DB SILME ISLEMI
        {
            var Depart = c.Departmans.Find(id);
            Depart.Departmanid = id;
            Depart.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult DepartmanGetir(int id) //DB KAYDETME ISLEMI
        {
            var departmanbul = c.Departmans.Find(id);

            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr1 = Durumlistesi;

            return View("DepartmanGetir", departmanbul);
        }

        public ActionResult DepartmanGuncelle(Departman d) //DB KAYDETME ISLEMI
        {
            var departmangun = c.Departmans.Find(d.Departmanid);
            departmangun.DepartmanAd = d.DepartmanAd;
            departmangun.Durum = d.Durum;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DepartmanDetay(int id) //DETAY CAGIRMA
        {
            var degerler=c.Personels.Where(x=>x.Departmanid==id).ToList();   
            var dpt=c.Departmans.Where(x=>x.Departmanid==id).Select(y=>y.DepartmanAd).FirstOrDefault(); 
            ViewBag.dgr1 = dpt;  

            return View(degerler);
        }

        public ActionResult DepartmanPersonelSatis(int id) //PERSONEL SATIS CAGIRMA
        {
            var degerler1 = c.SatisHarekets.Where(x => x.Personelid == id).ToList();
            var per = c.Personels.Where(x => x.Personelid == id).Select(y => y.PersonelAd+" "+y.PersonelSoyad).FirstOrDefault();
            ViewBag.dgr1 = per;
            return View(degerler1);
        }
    }
}