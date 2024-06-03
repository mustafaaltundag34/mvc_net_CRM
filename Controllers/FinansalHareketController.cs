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
        Context c = new Context(); //FINANSALHAREKET TAHSILAT ODEME ISLEMLERI
        Context d = new Context(); //TRANSACTION
        public ActionResult Index()
        {
            var finansalhareket = c.FinansalHarekets.Where(x => x.Durum == true && (x.BelgeTuru.Contains("TAHSILAT") || x.BelgeTuru.Contains("ODEME")) ).ToList();
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

            List<SelectListItem> finansalislemturleri = new List<SelectListItem>();
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_NAKIT", Value = "ODEME_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_HAVALE_EFT_FAST", Value = "ODEME_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_KREDI_KARTI", Value = "ODEME_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_YEMEK_CEKI", Value = "ODEME_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_CEK_SENET", Value = "ODEME_CEK_SENET" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_PARA_CEKME_HESAPTAN", Value = "ODEME_PARA_CEKME_HESAPTAN" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_NAKIT", Value = "TAHSILAT_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_HAVALE_EFT_FAST", Value = "TAHSILAT_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_KREDI_KARTI", Value = "TAHSILAT_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_YEMEK_CEKI", Value = "TAHSILAT_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_CEK_SENET", Value = "TAHSILAT_CEK_SENET" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_PARA_YATIRMA_HESABA", Value = "TAHSILAT_PARA_YATIRMA_HESABA" });

            ViewBag.dgr4 = finansalislemturleri;

            return View();
        }

        [HttpPost]
        public ActionResult FinansalHareketEkle(FinansalHareket p) //DB KAYDETME ISLEMI
        {
            if (p.BelgeTuru.Contains("TAHSILAT"))
            {
                p.FinansalHareketTuruCari = "ALACAK";
                p.FinansalHareketTuruFinansHesap = "BORC";
            }
            if (p.BelgeTuru.Contains("ODEME"))
            {
                p.FinansalHareketTuruCari = "BORC";
                p.FinansalHareketTuruFinansHesap = "ALACAK";
            }
            p.Durum = true;//AKTIF KAYIT
            p.Tarih = DateTime.Now;
            c.FinansalHarekets.Add(p);
            c.SaveChanges();

            var kayitacanpersonelbul = c.Personels.Find(p.Personelid);
            var caribilgisibul=c.Carilers.Find(p.Cariid);
            TransactionTask yenitransaction = new TransactionTask();
            yenitransaction.Belgeid = p.FinansalHareketid;
            yenitransaction.BelgeTuru = p.BelgeTuru;
            yenitransaction.AcilisTarihi = p.Tarih;
            yenitransaction.SonIslemTarihi = p.Tarih;
            yenitransaction.KayitAcanUser = kayitacanpersonelbul.PersonelAd + " " + kayitacanpersonelbul.PersonelSoyad;
            yenitransaction.KayitOnaylayanUser = "";
            yenitransaction.Durum = p.Durum;
            yenitransaction.Tutar=p.Tutar;
            yenitransaction.CariBilgisi = caribilgisibul.CariAd + " " + caribilgisibul.CariSoyad;
            d.TransactionTasks.Add(yenitransaction);
            d.SaveChanges();
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

            List<SelectListItem> finansalislemturleri = new List<SelectListItem>();
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_NAKIT", Value = "ODEME_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_HAVALE_EFT_FAST", Value = "ODEME_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_KREDI_KARTI", Value = "ODEME_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_YEMEK_CEKI", Value = "ODEME_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_CEK_SENET", Value = "ODEME_CEK_SENET" });
            finansalislemturleri.Add(new SelectListItem { Text = "ODEME_PARA_CEKME_HESAPTAN", Value = "ODEME_PARA_CEKME_HESAPTAN" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_NAKIT", Value = "TAHSILAT_NAKIT" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_HAVALE_EFT_FAST", Value = "TAHSILAT_HAVALE_EFT_FAST" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_KREDI_KARTI", Value = "TAHSILAT_KREDI_KARTI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_YEMEK_CEKI", Value = "TAHSILAT_YEMEK_CEKI" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_CEK_SENET", Value = "TAHSILAT_CEK_SENET" });
            finansalislemturleri.Add(new SelectListItem { Text = "TAHSILAT_PARA_YATIRMA_HESABA", Value = "TAHSILAT_PARA_YATIRMA_HESABA" });
            ViewBag.dgr4 = finansalislemturleri;

            return View("FinansalHareketGetir", finansalhareketbul);
        }


        public ActionResult FinansalHareketGuncelle(FinansalHareket u) //DB KAYDETME ISLEMI
        {
            var finansalhareket = c.FinansalHarekets.Find(u.FinansalHareketid);
            finansalhareket.Tutar = u.Tutar;
            finansalhareket.Aciklama = u.Aciklama;
            finansalhareket.Tarih = DateTime.Now;
            finansalhareket.Saat = DateTime.Now.ToString("HH:mm");
            finansalhareket.OnayStatusu = "OnayBekliyor";
            c.SaveChanges();

            d.TransactionTasks.AsEnumerable().Where(x => x.Belgeid == finansalhareket.FinansalHareketid & x.BelgeTuru == finansalhareket.BelgeTuru).ToList().ForEach(x =>
            {
                x.OnayStatusu = "OnayBekliyor";//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.KayitOnaylayanUser = "";//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.SonIslemTarihi = DateTime.Now;//1 SATIRDA GUNCELLEME YAPINCA ILGILII TRANSACTION ONAY BEKLIYORA GECER
                x.Tutar = finansalhareket.Tutar;
            });
            d.SaveChanges();

            return RedirectToAction("Index");
        }

    }
}