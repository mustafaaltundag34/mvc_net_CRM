using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using Google.Protobuf.WellKnownTypes;
using mvc_net_Crm.Models.Siniflar;
using static Google.Protobuf.Compiler.CodeGeneratorResponse.Types;

namespace mvc_net_Crm.Controllers
{
    public class FaturaController : Controller
    {
        // GET: Fatura
        Context c =new Context();//c FATURA DATASET
        Context d= new Context();//d FATURAKALEM DATASET
        Context e = new Context();//e TRANSACTION DATASET
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


            List<SelectListItem> faturabelgeturu = new List<SelectListItem>();
            faturabelgeturu.Add(new SelectListItem { Text = "FATURA_ALIS", Value = "FATURA_ALIS" });
            faturabelgeturu.Add(new SelectListItem { Text = "FATURA_SATIS", Value = "FATURA_SATIS" });
            ViewBag.dgr4 = faturabelgeturu;


            List<SelectListItem> finansalislemturleri = new List<SelectListItem>();
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_NAKIT", Value = "ODEME_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_HAVALE_EFT_FAST", Value = "ODEME_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_KREDI_KARTI", Value = "ODEME_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_YEMEK_CEKI", Value = "ODEME_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_CEK_SENET", Value = "ODEME_CEK_SENET" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_NAKIT", Value = "TAHSILAT_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_HAVALE_EFT_FAST", Value = "TAHSILAT_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_KREDI_KARTI", Value = "TAHSILAT_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_YEMEK_CEKI", Value = "TAHSILAT_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_CEK_SENET", Value = "TAHSILAT_CEK_SENET" });
            ViewBag.dgr5 = finansalislemturleri;


            List<SelectListItem> faturaserilistesi = new List<SelectListItem>();
            faturaserilistesi.Add(new SelectListItem { Text = "A", Value = "A" });
            faturaserilistesi.Add(new SelectListItem { Text = "B", Value = "B" });
            faturaserilistesi.Add(new SelectListItem { Text = "C", Value = "C" });
            faturaserilistesi.Add(new SelectListItem { Text = "D", Value = "D" });
            faturaserilistesi.Add(new SelectListItem { Text = "E", Value = "E" });
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

            List<SelectListItem> finanshesapbul = (from x in c.FinansHesaplaris.Where(x => x.Durum == true).ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.FinansHesapAdi,
                                                Value = x.FinansHesapid.ToString()
                                            }
).ToList();
            ViewBag.dgr11 = finanshesapbul;
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
                p.Tarih = DateTime.Today;
                p.Saat = DateTime.Now.ToString("HH:mm");
                //p.KdvTutar = 0;
                //p.GenelToplam = 0;
                //p.OnayStatusu = "OnayBekliyor";//ONAY GELDIKTEN SONRA ISLEM YURUSUN
                c.Faturalars.Add(p);
                c.SaveChanges();

                var kayitacanpersonelbul = c.Personels.Find(p.Personelid);
                var caribilgisibul = c.Carilers.Find(p.Cariid);
                TransactionTask yenitransaction = new TransactionTask();
                yenitransaction.Belgeid = p.Faturaid;
                yenitransaction.BelgeTuru = p.BelgeTuru;
                yenitransaction.AcilisTarihi = p.Tarih;
                yenitransaction.SonIslemTarihi = p.Tarih;
                yenitransaction.KayitAcanUser = kayitacanpersonelbul.PersonelAd + " " + kayitacanpersonelbul.PersonelSoyad;
                yenitransaction.KayitOnaylayanUser = "";
                yenitransaction.Durum = p.Durum;
                yenitransaction.CariBilgisi = caribilgisibul.CariAd + " " + caribilgisibul.CariSoyad;
                yenitransaction.Tutar = p.GenelToplam;
                d.TransactionTasks.Add(yenitransaction);
                d.SaveChanges();
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

            List<SelectListItem> faturabelgeturu = new List<SelectListItem>();
            faturabelgeturu.Add(new SelectListItem { Text = "FATURA_ALIS", Value = "FATURA_ALIS" });
            faturabelgeturu.Add(new SelectListItem { Text = "FATURA_SATIS", Value = "FATURA_SATIS" });
            ViewBag.dgr4 = faturabelgeturu;

            List<SelectListItem> finansalislemturleri = new List<SelectListItem>();
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_NAKIT", Value = "ODEME_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_HAVALE_EFT_FAST", Value = "ODEME_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_KREDI_KARTI", Value = "ODEME_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_YEMEK_CEKI", Value = "ODEME_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_CEK_SENET", Value = "ODEME_CEK_SENET" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_NAKIT", Value = "TAHSILAT_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_HAVALE_EFT_FAST", Value = "TAHSILAT_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_KREDI_KARTI", Value = "TAHSILAT_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_YEMEK_CEKI", Value = "TAHSILAT_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_CEK_SENET", Value = "TAHSILAT_CEK_SENET" });
            ViewBag.dgr5 = finansalislemturleri;

            List<SelectListItem> faturaserilistesi = new List<SelectListItem>();
            faturaserilistesi.Add(new SelectListItem { Text = "A", Value = "A" });
            faturaserilistesi.Add(new SelectListItem { Text = "B", Value = "B" });
            faturaserilistesi.Add(new SelectListItem { Text = "C", Value = "C" });
            faturaserilistesi.Add(new SelectListItem { Text = "D", Value = "D" });
            faturaserilistesi.Add(new SelectListItem { Text = "E", Value = "E" });
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
            fatura.OnayStatusu = "OnayBekliyor";//ONAY GELDIKTEN SONRA ISLEM YURUSUN
            c.SaveChanges();
            e.TransactionTasks.AsEnumerable().Where(x => x.Belgeid == fatura.Faturaid & x.BelgeTuru == fatura.BelgeTuru).ToList().ForEach(x =>
            {
                x.OnayStatusu = "OnayBekliyor";//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.KayitOnaylayanUser = "";//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.SonIslemTarihi = DateTime.Now;//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.Tutar =fatura.GenelToplam;
            });
            e.SaveChanges();
            d.FaturaKalems.AsEnumerable().Where(x => x.Faturaid == u.Faturaid).ToList().ForEach(x =>
            {
                x.OnayStatusu = "OnayBekliyor";//1 SATIRDA GUNCELLEME YAPINCA ILGILII FATURA KALEMLERI DE ONAY BEKLIYORA GECER
            });
            d.SaveChanges();
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
            var faturaantet10 = c.Faturalars.Where(x => x.Faturaid == id).Select(y => y.OnayStatusu).FirstOrDefault();
            ViewBag.dgr10 = faturaantet10;
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

            List<SelectListItem> faturabelgeturu = new List<SelectListItem>();
            faturabelgeturu.Add(new SelectListItem { Text = "FATURA_ALIS", Value = "FATURA_ALIS" });
            faturabelgeturu.Add(new SelectListItem { Text = "FATURA_SATIS", Value = "FATURA_SATIS" });
            ViewBag.dgr3 = faturabelgeturu;

            return View();
        }



        [HttpPost]
        public ActionResult FaturaKalemEkle(faturaKalem p) //DB KAYDETME ISLEMI
        {
            try
            {
                Console.WriteLine("Ekleme Islemi Basladi");
                var fatura = d.Faturalars.Find(p.Faturaid);
                p.Durum = true;//AKTIF KAYIT
                p.Tarih = DateTime.Now;
                p.KdvOrani = 1;
                p.Tutar = p.Adet * p.BirimFiyat;
                //p.OnayStatusu = "OnayBekliyor";//ONAY GELDIKTEN SONRA ISLEM YURUSUN
                //p.StokHareketTuru = p.StokHareketTuru;
                //p.BelgeTuru = p.BelgeTuru;
                p.OnayStatusu = "OnayBekliyor";
                fatura.OnayStatusu = "OnayBekliyor";
                c.FaturaKalems.Add(p);
                c.SaveChanges();
                d.SaveChanges();   
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
            var fatura = d.Faturalars.Find(u.Faturaid);
            faturakalem.Adet = u.Adet;
            faturakalem.BirimFiyat = u.BirimFiyat;
            faturakalem.Tutar = u.BirimFiyat * u.Adet;
            faturakalem.Tarih = DateTime.Now;
            faturakalem.OnayStatusu = "OnayBekliyor";
            c.SaveChanges();

            c.FaturaKalems.AsEnumerable().Where(x => x.Faturaid == u.Faturaid).ToList().ForEach(x =>
            {
                x.OnayStatusu = "OnayBekliyor";//1 SATIRDA GUNCELLEME YAPINCA TUM FATURA ICI SATIRLARI ONAY BEKLIYORA GECER
            });
            c.SaveChanges();
            fatura.OnayStatusu = "OnayBekliyor";
            d.SaveChanges();
            
            var faturabul = d.Faturalars.Find(u.Faturaid);
            e.TransactionTasks.AsEnumerable().Where(x => x.Belgeid == u.Faturaid & x.BelgeTuru == u.BelgeTuru).ToList().ForEach(x =>
            {
                x.OnayStatusu = "OnayBekliyor";//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.KayitOnaylayanUser = "";//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.SonIslemTarihi = DateTime.Now;//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                //x.Tutar = fatura.GenelToplam;
                Console.WriteLine(x.Tutar); 
            });

            e.SaveChanges();
            //return RedirectToAction("index");
            return RedirectToAction("FaturaDetay", new { id = u.Faturaid });
        }

    }
}