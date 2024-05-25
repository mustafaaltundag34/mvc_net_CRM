using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class FinansHesaplariController : Controller
    {
        // GET: FinansHesaplari
        Context c = new Context();
        public ActionResult Index()
        {
            var finanshesaplari = c.FinansHesaplaris.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(finanshesaplari);

        }
        [HttpGet]
        public ActionResult FinansHesapEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            List<SelectListItem> finanshesapturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FINANSHESAPTURU")).ToList()
                                                    select new SelectListItem
                                                    {
                                                        Text = x.ParametreAciklamasi,
                                                        Value = x.ParametreAciklamasi.ToString()
                                                    }
).ToList();
            ViewBag.dgr1 = finanshesapturu;

            return View();
        }

        [HttpPost]
        public ActionResult FinansHesapEkle(FinansHesaplari k) //DB KAYDETME ISLEMI
        {
            k.Durum = true;
            c.FinansHesaplaris.Add(k);
            c.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult FinansHesapGetir(int id) //DB KAYDETME ISLEMI
        {
            var finanshesap = c.FinansHesaplaris.Find(id);

            List<SelectListItem> finanshesapturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FINANSHESAPTURU")).ToList()
                                                    select new SelectListItem
                                                    {
                                                        Text = x.ParametreAciklamasi,
                                                        Value = x.ParametreAciklamasi.ToString()
                                                    }
).ToList();
            ViewBag.dgr1 = finanshesapturu;

            return View("FinansHesapGetir", finanshesap);
        }


        public ActionResult FinansHesapGuncelle(FinansHesaplari k) //DB KAYDETME ISLEMI
        {
            var finanshesapbul = c.FinansHesaplaris.Find(k.FinansHesapid);
            finanshesapbul.FinansHesapAdi = k.FinansHesapAdi;
            finanshesapbul.FinansHesapAciklama = k.FinansHesapAciklama;
            finanshesapbul.FinansHesapTuru = k.FinansHesapTuru;
            finanshesapbul.FinansHesapIbanNo = k.FinansHesapIbanNo;
            finanshesapbul.FinansHesapNo = k.FinansHesapNo;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult FinansHesapSil(int id)//DB SILME ISLEMI
        {
            var finanshesap = c.FinansHesaplaris.Find(id);
            finanshesap.FinansHesapid = id;
            finanshesap.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult FinansHareketleriALL(int id) //SECILEN HESABIN HAREKETLERI
        {
            var finansalhareketler = c.FinansalHarekets.Where(x => x.FinansHesapid == id && x.Durum == true).ToList();//LINQ SORGUSUNDA AND && OR || ILE KULLANALIM
            var finansalhesap = c.FinansHesaplaris.Where(x => x.FinansHesapid == id).Select(y => y.FinansHesapAdi).FirstOrDefault();
            ViewBag.dgr1 = finansalhesap;
            return View(finansalhareketler);

        }

    }
}
