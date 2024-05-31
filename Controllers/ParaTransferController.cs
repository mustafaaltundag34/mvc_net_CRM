using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;
using static Google.Protobuf.Compiler.CodeGeneratorResponse.Types;

namespace mvc_net_Crm.Controllers
{
    public class ParaTransferController : Controller
    {
        // GET: ParaTransfer
        Context c = new Context(); //FINANSALHAREKET PARATRANSFERI
        Context d = new Context(); //TRANSACTION
        public ActionResult Index()
        {
            var paratransfer = c.FinansalHarekets.Where(x => x.Durum == true & x.BelgeTuru.Contains("PARA_GONDERME_HESAPTAN")).ToList();
            return View(paratransfer);
        }

        [HttpGet]
        public ActionResult ParaTransferEkle() //BOS FORM SAYFASI CAGIRIYOR
        {


            List<SelectListItem> CarilerGonderici = (from x in c.Carilers.Where(x => x.Durum == true).ToList()
                                                     select new SelectListItem
                                                     {
                                                         Text = x.CariAd + " " + x.CariSoyad,
                                                         Value = x.Cariid.ToString()
                                                     }
                  ).ToList();
            ViewBag.dgr1 = CarilerGonderici;

            List<SelectListItem> Personeller = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.Personelid.ToString()
                                                }
      ).ToList();
            ViewBag.dgr2 = Personeller;

            List<SelectListItem> finansalici = (from x in c.FinansHesaplaris.Where(x => x.Durum == true).ToList()
                                                 select new SelectListItem
                                                 {
                                                     Text = x.FinansHesapAdi,
                                                     Value = x.FinansHesapid.ToString()
                                                 }
                  ).ToList();
            ViewBag.dgr3 = finansalici;

            return View();
        }


        [HttpPost]
        public ActionResult ParaTransferEkle(FinansalHareket p) //DB KAYDETME ISLEMI
        {
            p.BelgeTuru = "PARA_GONDERME_HESAPTAN";
            p.FinansalHareketTuru = "BORC"; //PARA GONDERICININ HAREKETLERINDE ALACAK BOLUMUNDE GOSTERILIR
            p.Durum = true;//AKTIF KAYIT
            p.Tarih = DateTime.Now;
            c.FinansalHarekets.Add(p);
            c.SaveChanges();

            var kayitacanpersonelbul = c.Personels.Find(p.Personelid);
            TransactionTask yenitransaction = new TransactionTask();
            yenitransaction.Belgeid = p.FinansalHareketid;
            yenitransaction.BelgeTuru = p.BelgeTuru;
            yenitransaction.AcilisTarihi = p.Tarih;
            yenitransaction.SonIslemTarihi = p.Tarih;
            yenitransaction.KayitAcanUser = kayitacanpersonelbul.PersonelAd + " " + kayitacanpersonelbul.PersonelSoyad;
            yenitransaction.KayitOnaylayanUser = "";
            yenitransaction.Durum = p.Durum;
            d.TransactionTasks.Add(yenitransaction);
            d.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ParaTransferSil(int id)//DB SILME ISLEMI
        {
            var paratransfer = c.FinansalHarekets.Find(id);
            paratransfer.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }


    }
}