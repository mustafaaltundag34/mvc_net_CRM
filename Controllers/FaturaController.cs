﻿using System;
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

            List<SelectListItem> faturabelgeturu = (from x in c.Parametres.Where(x=>x.Durum==true && x.ParametreTuru.Contains("FATURABELGETURU") ).ToList()
                                          select new SelectListItem
                                          {
                                              Text = x.ParametreAciklamasi,
                                              Value = x.ParametreAciklamasi.ToString()
                                          }
).ToList();
            ViewBag.dgr4 = faturabelgeturu;

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

            List<SelectListItem> teslimalan = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.CariAd + " " + x.CariSoyad,
                                                    Value = x.CariAd + " " + x.CariSoyad,
                                                }
).ToList();
            ViewBag.dgr9 = teslimalan;

            List<SelectListItem> kasabul = (from x in c.Kasalars.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.KasaAdi,
                                                 Value = x.Kasaid.ToString()
                                             }
      ).ToList();
            ViewBag.dgr10 = kasabul;
            return View();
        }


        [HttpPost]
        public ActionResult FaturaEkle(Faturalar p) //DB KAYDETME ISLEMI
        {
            try
            {
                Console.WriteLine("Ekleme Islemi Basladi");
                if (p.BelgeTuru.Contains("ALIS"))
                {
                    p.FaturaHareketTuru = "GIRIS";
                }
                if (p.BelgeTuru.Contains("SATIS"))
                {
                    p.FaturaHareketTuru = "CIKIS";
                }
                p.Durum = true;//AKTIF KAYIT
                p.Tarih = DateTime.Now;
                p.KdvTutar = 0;
                p.GenelToplam = 0;
                c.Faturalars.Add(p);
                c.SaveChanges();
                return RedirectToAction("FaturaKalemEkle", new {id=p.Faturaid});
            }
            catch (DbEntityValidationException ex)
            {
                Console.WriteLine(ex.ToString());
                Console.WriteLine($"Validation errors: {string.Join(Environment.NewLine, ex.EntityValidationErrors.SelectMany(vr => vr.ValidationErrors.Select(err => $"{err.PropertyName} - {err.ErrorMessage}")))}", ex);
                throw;
            }

        }

        public ActionResult FaturaSil(int id)//DB SILME ISLEMI
        {
            var faturalar = c.Faturalars.Find(id);
            faturalar.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult FaturaGetir(int id) //DB KAYDETME ISLEMI
        {
            var faturabul = c.Faturalars.Find(id);

            List<SelectListItem> Cariler = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd + " " + x.CariSoyad,
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

            List<SelectListItem> faturabelgeturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FATURABELGETURU")).ToList()
                                                    select new SelectListItem
                                                    {
                                                        Text = x.ParametreAciklamasi,
                                                        Value = x.ParametreAciklamasi.ToString()
                                                    }
).ToList();
            ViewBag.dgr4 = faturabelgeturu;

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

            List<SelectListItem> teslimalan = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.CariAd + " " + x.CariSoyad,
                                                Value = x.CariAd + " " + x.CariSoyad
                                            }
                               ).ToList();
            ViewBag.dgr9 = teslimalan;

            List<SelectListItem> kasabul = (from x in c.Kasalars.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.KasaAdi,
                                                Value = x.Kasaid.ToString()
                                            }
).ToList();
            ViewBag.dgr10 = kasabul;

            return View("FaturaGetir", faturabul);
        }

        public ActionResult FaturaGuncelle(Faturalar u) //DB KAYDETME ISLEMI
        {
            var fatura = c.Faturalars.Find(u.Faturaid);
            fatura.Faturaid = u.Faturaid;
            fatura.TeslimEden = u.TeslimEden;
            fatura.TeslimAlan = u.TeslimAlan;
            fatura.Tarih = DateTime.Now;
            fatura.Saat = DateTime.Now.ToString("HH:mm");
            c.SaveChanges();
            //return RedirectToAction("index");
            return RedirectToAction("FaturaDetay", new { id = u.Faturaid });
        }


        public ActionResult FaturaPDF(int id)
        {
            //var urunler=c.Uruns.ToList();//KOSULSUZ LISTELEME
            var degerler = c.Faturalars.Where(x => x.Faturaid == id && x.Durum == true).ToList();
            return View(degerler);
        }

        public ActionResult FaturaDetay(int id) //DETAY CAGIRMA
        {
            var faturakalemler = c.FaturaKalems.Where(x => x.Faturaid == id && x.Durum == true).ToList();
            var faturaantet1 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.Faturaid).FirstOrDefault();
            ViewBag.dgr1 = faturaantet1;
            var faturaantet2 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.Cariler.CariAd + " " + y.Cariler.CariSoyad).FirstOrDefault();
            ViewBag.dgr2 = faturaantet2;
            var faturaantet3 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.BelgeTuru).FirstOrDefault();
            ViewBag.dgr3 = faturaantet3;
            var faturaantet4 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.Tarih).FirstOrDefault();
            ViewBag.dgr4 = faturaantet4;
            var faturaantet5 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.GenelToplam).FirstOrDefault();
            ViewBag.dgr5 = faturaantet5;
            var faturaantet6 = c.Faturalars.Where(x => x.Faturaid == id ).Select(y => y.TeslimEden).FirstOrDefault();
            ViewBag.dgr6 = faturaantet6;
            var faturaantet7 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.TeslimAlan).FirstOrDefault();
            ViewBag.dgr7 = faturaantet7;
            var faturaantet8 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.Kasalar.KasaAdi).FirstOrDefault();
            ViewBag.dgr8 = faturaantet8;
            var faturaantet9 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.Personel.PersonelAd +" " + y.Personel.PersonelSoyad).FirstOrDefault();
            ViewBag.dgr9 = faturaantet9;
            return View(faturakalemler);
        }

        [HttpGet]
        public ActionResult FaturaKalemEkle(int id) //BOS FORM SAYFASI CAGIRIYOR
        {
            int faturaidsecilen = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.Faturaid).FirstOrDefault();
            ViewBag.dgr4 = faturaidsecilen;
            var faturaantet5 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.FaturaHareketTuru).FirstOrDefault();
            ViewBag.dgr5 = faturaantet5;
            var faturaantet6 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.BelgeTuru).FirstOrDefault();
            ViewBag.dgr6 = faturaantet6;

            List<SelectListItem> stoksecimi = (from x in c.Uruns.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.UrunAd,
                                                 Value = x.Urunid.ToString()
                                             }
      ).ToList();
            ViewBag.dgr1 = stoksecimi;

            List<SelectListItem> Ambarlar = (from x in c.Ambars.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.AmbarAdi,
                                                 Value = x.AmbarID.ToString()
                                             }
                  ).ToList();
            ViewBag.dgr2 = Ambarlar;


            List<SelectListItem> faturaturu = (from x in c.Parametres.Where(x => x.Durum == true && x.ParametreTuru.Contains("FATURABELGETURU")).ToList()
                                               select new SelectListItem
                                               {
                                                   Text = x.ParametreAciklamasi,
                                                   Value = x.ParametreAciklamasi.ToString()
                                               }
).ToList();
            ViewBag.dgr3 = faturaturu;
            return View();
        }



        [HttpPost]
        public ActionResult FaturaKalemEkle(faturaKalem p) //DB KAYDETME ISLEMI
        {
            try
            {
                Console.WriteLine("Ekleme Islemi Basladi");
                p.Durum = true;//AKTIF KAYIT
                p.Tarih = DateTime.Now;
                p.KdvOrani = 1;
                p.Tutar = p.Adet * p.BirimFiyat;
                //p.StokHareketTuru = p.StokHareketTuru;
                //p.BelgeTuru = p.BelgeTuru;
                c.FaturaKalems.Add(p);
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

        public ActionResult FaturaKalemSil(int id)//DB SILME ISLEMI
        {
            var faturakalembul = c.FaturaKalems.Find(id);
            faturakalembul.Durum = false;
            c.SaveChanges();
            return RedirectToAction("FaturaDetay", new { id = faturakalembul.Faturaid });
        }

        public ActionResult FaturaKalemGetir(int id) //BOS FORM SAYFASI CAGIRIYOR
        {
            var faturakalembul = c.FaturaKalems.Find(id);
            var faturabul = c.Faturalars.Find(faturakalembul.Faturaid);
            int kalemid = c.FaturaKalems.Where(x => x.FaturaKalemid == id).Select(y => y.FaturaKalemid).FirstOrDefault();
            ViewBag.dgr1 = kalemid;
            var kalemhareketturu = c.FaturaKalems.Where(x => x.FaturaKalemid == id).Select(y => y.StokHareketTuru).FirstOrDefault();
            ViewBag.dgr2 = kalemhareketturu;
            var kalembelgeturu = c.FaturaKalems.Where(x => x.FaturaKalemid == id).Select(y => y.BelgeTuru).FirstOrDefault();
            ViewBag.dgr4 = kalembelgeturu;

            List<SelectListItem> stoksecimi = (from x in c.Uruns.Where(x => x.Durum == true).ToList()
                                               select new SelectListItem
                                               {
                                                   Text = x.UrunAd,
                                                   Value = x.Urunid.ToString()
                                               }
      ).ToList();
            ViewBag.dgr3 = stoksecimi;
            return View("FaturaKalemGetir", faturakalembul);
        }


        public ActionResult FaturaKalemGuncelle(faturaKalem u) //DB KAYDETME ISLEMI
        {
            var faturakalem = c.FaturaKalems.Find(u.FaturaKalemid);
            faturakalem.Adet = u.Adet;
            faturakalem.BirimFiyat = u.BirimFiyat;
            faturakalem.Tutar = u.BirimFiyat * u.Adet;
            faturakalem.Tarih = DateTime.Now;
            //faturakalem.BelgeTuru = u.BelgeTuru;
            //faturakalem.StokHareketTuru = u.BelgeTuru;
            c.SaveChanges();
            //return RedirectToAction("index");
            return RedirectToAction("FaturaDetay", new { id = u.Faturaid });
        }

    }
}