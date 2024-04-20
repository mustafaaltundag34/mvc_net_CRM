using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class PersonelController : Controller
    {
        Context c =new Context();
        // GET: Personel
        public ActionResult Index()
        {
            var personeller = c.Personels.Where(x=>x.Durum==true).ToList();
            return View(personeller);
        }
        [HttpGet]
        public ActionResult PersonelEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            List<SelectListItem> Departmanlar = (from x in c.Departmans.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.DepartmanAd,
                                                    Value = x.Departmanid.ToString()
                                                }
                              ).ToList();
            ViewBag.dgr1 = Departmanlar;
            return View();
        }
        [HttpPost]
        public ActionResult PersonelEkle(Personel p) //DB KAYDETME ISLEMI
        {
            p.Durum = true;//AKTIF KAYIT
            c.Personels.Add(p);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult PersonelSil(int id)//DB SILME ISLEMI
        {
            var Personel = c.Personels.Find(id);
            Personel.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult PersonelGetir(int id) //DB KAYDETME ISLEMI
        {
            var personelbul = c.Personels.Find(id);

            List<SelectListItem> Departmanlar = (from x in c.Departmans.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.DepartmanAd,
                                                    Value = x.Departmanid.ToString()
                                                }).ToList();
            ViewBag.dgr1 = Departmanlar;


            List<SelectListItem> Durumlistesi = new List<SelectListItem>();
            Durumlistesi.Add(new SelectListItem { Text = "Aktif", Value = "True" });
            Durumlistesi.Add(new SelectListItem { Text = "Pasif", Value = "False" });

            ViewBag.dgr2 = Durumlistesi;

            return View("PersonelGetir", personelbul);
        }
        public ActionResult PersonelGuncelle(Personel u) //DB KAYDETME ISLEMI
        {
            var personelgun = c.Personels.Find(u.Personelid);
            personelgun.PersonelAd = u.PersonelAd;
            personelgun.PersonelSoyad = u.PersonelSoyad;
            personelgun.PersonelGorsel = u.PersonelGorsel;
            personelgun.Durum = u.Durum;
            personelgun.Departmanid = u.Departmanid;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}