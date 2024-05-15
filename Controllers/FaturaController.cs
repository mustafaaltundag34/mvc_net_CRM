using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Google.Protobuf.WellKnownTypes;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class FaturaController : Controller
    {
        // GET: Fatura
        Context c =new Context();
        public ActionResult Index()
        {
            var faturalar = c.Faturalars.Where(x => x.Durum == true).ToList();
            return View(faturalar);
        }

        [HttpGet]
        public ActionResult FaturaEkle() //BOS FORM SAYFASI CAGIRIYOR
        {
            List<SelectListItem> Cariler = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd+" "+x.CariSoyad,
                                                Value = x.Cariid.ToString()
                                            }
                              ).ToList();
            ViewBag.dgr1 = Cariler;

            List<SelectListItem> Ambarlar = (from x in c.Ambars.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.AmbarAdi,
                                                Value = x.AmbarID.ToString()
                                            }
                  ).ToList();
            ViewBag.dgr2 = Ambarlar;

            List<SelectListItem> Personeller = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.Personelid.ToString()
                                                }
      ).ToList();
            ViewBag.dgr3 = Personeller;

            List<SelectListItem> faturaturu = (from x in c.Parametres.Where(x=>x.Durum==true && x.ParametreTuru.Contains("FATURATURU") ).ToList()
                                          select new SelectListItem
                                          {
                                              Text = x.ParametreAciklamasi,
                                              Value = x.ParametreAciklamasi.ToString()
                                          }
).ToList();
            ViewBag.dgr4 = faturaturu;

            List<SelectListItem> odemeturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("PAYMENT")).ToList()
                                               select new SelectListItem
                                               {
                                                   Text = x.ParametreAciklamasi,
                                                   Value = x.ParametreAciklamasi.ToString()
                                               }
).ToList();
            ViewBag.dgr5 = odemeturu;
            List<SelectListItem> faturaserilistesi = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FATURASERI")).ToList()
                                              select new SelectListItem
                                              {
                                                  Text = x.ParametreAciklamasi,
                                                  Value = x.ParametreAciklamasi.ToString()
                                              }
).ToList();
            ViewBag.dgr6 = faturaserilistesi;
            List<SelectListItem> vergidairesi = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("VERGIDAIRE")).ToList()
                                                      select new SelectListItem
                                                      {
                                                          Text = x.ParametreAciklamasi,
                                                          Value = x.ParametreAciklamasi.ToString()
                                                      }
).ToList();
            ViewBag.dgr7 = vergidairesi;

            List<SelectListItem> teslimeden = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.PersonelAd + " " + x.PersonelSoyad
                                                }
).ToList();
            ViewBag.dgr8 = teslimeden;

            List<SelectListItem> teslimalan = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.PersonelAd + " " + x.PersonelSoyad
                                                }
).ToList();
            ViewBag.dgr9 = teslimalan;
            return View();
        }


        [HttpPost]
        public ActionResult FaturaEkle(Faturalar p) //DB KAYDETME ISLEMI
        {
            try
            {
                Console.WriteLine("Ekleme Islemi Basladi");
                p.Durum = true;//AKTIF KAYIT
                p.Tarih = DateTime.Now;
                p.KdvTutar = 0;
                p.GenelToplam = 0;
                c.Faturalars.Add(p);
                c.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (DbEntityValidationException ex)
            {
                Console.WriteLine(ex.ToString());
                Console.WriteLine($"Validation errors: {string.Join(Environment.NewLine, ex.EntityValidationErrors.SelectMany(vr => vr.ValidationErrors.Select(err => $"{err.PropertyName} - {err.ErrorMessage}")))}", ex);
                throw;
            }

        }
    }
}