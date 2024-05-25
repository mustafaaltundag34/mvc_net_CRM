using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;
using static Google.Protobuf.Compiler.CodeGeneratorResponse.Types;

namespace mvc_net_Crm.Controllers
{
    public class FinansalHareketController : Controller
    {
        // GET: FinansalHareket
        Context c = new Context();
        public ActionResult Index()
        {
            var finansalhareket = c.FinansalHarekets.Where(x => x.Durum == true).ToList();
            return View(finansalhareket);

        }

        [HttpGet]
        public ActionResult FinansalHareketEkle() //BOS FORM SAYFASI CAGIRIYOR
        {


            List<SelectListItem> Cariler = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd + " " + x.CariSoyad,
                                                Value = x.Cariid.ToString()
                                            }
                  ).ToList();
            ViewBag.dgr1 = Cariler;

            List<SelectListItem> Personeller = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.Personelid.ToString()
                                                }
      ).ToList();
            ViewBag.dgr2 = Personeller;

            List<SelectListItem> finansaltanim = (from x in c.FinansHesaplaris.Where(x => x.Durum == true).ToList()
                                          select new SelectListItem
                                          {
                                              Text = x.FinansHesapAdi,
                                              Value = x.FinansHesapid.ToString()
                                          }
).ToList();
            ViewBag.dgr3 = finansaltanim;

            List<SelectListItem> finansalbelgeturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FINANSALISLEM")).ToList()
                                                         select new SelectListItem
                                                         {
                                                             Text = x.ParametreAciklamasi,
                                                             Value = x.ParametreAciklamasi.ToString()
                                                         }
).ToList();
            ViewBag.dgr4 = finansalbelgeturu;

            return View();
        }

        [HttpPost]
        public ActionResult FinansalHareketEkle(FinansalHareket p) //DB KAYDETME ISLEMI
        {
            if (p.BelgeTuru.Contains("TAHSILAT"))
            {
                p.FinansalHareketTuru = "ALACAK";
            }
            if (p.BelgeTuru.Contains("ODEME"))
            {
                p.FinansalHareketTuru = "BORC";
            }
            p.Durum = true;//AKTIF KAYIT
            p.Tarih = DateTime.Now;
            c.FinansalHarekets.Add(p);
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult FinansalHareketSil(int id)//DB SILME ISLEMI
        {
            var finansalhareket = c.FinansalHarekets.Find(id);
            finansalhareket.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult FinansalHareketGetir(int id) //BOS FORM SAYFASI CAGIRIYOR
        {
            var finansalhareketbul = c.FinansalHarekets.Find(id);

            List<SelectListItem> Cariler = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd + " " + x.CariSoyad,
                                                Value = x.Cariid.ToString()
                                            }
                  ).ToList();
            ViewBag.dgr1 = Cariler;

            List<SelectListItem> Personeller = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.Personelid.ToString()
                                                }
      ).ToList();
            ViewBag.dgr2 = Personeller;

            List<SelectListItem> finansaltanim = (from x in c.FinansHesaplaris.Where(x => x.Durum == true).ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = x.FinansHesapAdi,
                                                      Value = x.FinansHesapid.ToString()
                                                  }
).ToList();
            ViewBag.dgr3 = finansaltanim;

            List<SelectListItem> finansalbelgeturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FINANSALISLEM")).ToList()
                                                      select new SelectListItem
                                                      {
                                                          Text = x.ParametreAciklamasi,
                                                          Value = x.ParametreAciklamasi.ToString()
                                                      }
).ToList();
            ViewBag.dgr4 = finansalbelgeturu;

            return View("FinansalHareketGetir", finansalhareketbul);
        }


        public ActionResult FinansalHareketGuncelle(FinansalHareket u) //DB KAYDETME ISLEMI
        {
            var finansalhareket = c.FinansalHarekets.Find(u.FinansalHareketid);
            finansalhareket.Tutar = u.Tutar;
            finansalhareket.Aciklama = u.Aciklama;
            finansalhareket.Tarih = DateTime.Now;
            finansalhareket.Saat = DateTime.Now.ToString("HH:mm");
            c.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}