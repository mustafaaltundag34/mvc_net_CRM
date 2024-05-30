using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;
using static Google.Protobuf.Compiler.CodeGeneratorResponse.Types;

namespace mvc_net_Crm.Controllers
{
    public class TransactionTaskController : Controller
    {
        // GET: TransactionTask
        Context c = new Context(); //TRANSACTION DATASET
        Context d = new Context(); //FATURA-FATURAKALEM DATASET
        Context e = new Context(); //STOKHAREKET DATASET
        Context f = new Context(); //FINANSALHAREKET DATASET
        public ActionResult Index()
        {
            //var transaction = c.TransactionTasks.Where(x => x.Durum == true && x.OnayStatusu.Contains("Bekliyor")).ToList();
            var transaction = c.TransactionTasks.Where(x => x.Durum == true).ToList();
            return View(transaction);
        }


        [HttpPost]
        public ActionResult TransactionTaskEkle(TransactionTask k) //DB KAYDETME ISLEMI
        {
            //k.Durum = true;
            //c.Ambars.Add(k);
            //c.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult TransactionTaskGetir(int id) //DB KAYDETME ISLEMI
        {
            var Transaction = c.TransactionTasks.Find(id);
            List<SelectListItem> onaycilar = (from x in c.Personels.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.PersonelAd + " " + x.PersonelSoyad,
                                                    Value = x.PersonelAd + " " + x.PersonelSoyad,
                                                }
                              ).ToList();
            ViewBag.dgr1 = onaycilar;

            List<SelectListItem> OnayParametrelistesi = new List<SelectListItem>();
            OnayParametrelistesi.Add(new SelectListItem { Text = "OnayBekliyor", Value = "OnayBekliyor" });
            OnayParametrelistesi.Add(new SelectListItem { Text = "Onaylandi", Value = "Onaylandi" });
            OnayParametrelistesi.Add(new SelectListItem { Text = "RedEdildi", Value = "RedEdildi" });

            ViewBag.dgr2 = OnayParametrelistesi;
            return View("TransactionTaskGetir", Transaction);
        }

        public ActionResult TransactionTaskGuncelle(TransactionTask k) //DB KAYDETME ISLEMI
        {
            var Transaction = c.TransactionTasks.Find(k.TransactionTaskid);
            int id  = c.TransactionTasks.Find(k.TransactionTaskid).Belgeid;
            var fatura = d.Faturalars.Find(id);
            var stokhareket=e.StokHarekets.Find(id);
            var finansalhareket = f.FinansalHarekets.Find(id);
            Transaction.OnayStatusu = k.OnayStatusu;
            Transaction.SonIslemTarihi = DateTime.Now;
            Transaction.KayitOnaylayanUser = k.KayitOnaylayanUser;
            if (Transaction.BelgeTuru.Contains("FATURA"))
            {
                fatura.OnayStatusu = k.OnayStatusu;
                e.FaturaKalems.AsEnumerable().Where(x => x.Faturaid == id).ToList().ForEach(x =>
                {
                    x.OnayStatusu = k.OnayStatusu;
                });
                c.SaveChanges();
                d.SaveChanges();
                e.SaveChanges();
            }

            if (Transaction.BelgeTuru.Contains("IRSALIYE"))
            {
                stokhareket.OnayStatusu = k.OnayStatusu;
                c.SaveChanges();
                e.SaveChanges();
            }

            if ((Transaction.BelgeTuru.Contains("ODEME")) || (Transaction.BelgeTuru.Contains("TAHSILAT")))
            {
                finansalhareket.OnayStatusu = k.OnayStatusu;
                c.SaveChanges();
                f.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        public ActionResult TransactionTaskSil(int id)//DB SILME ISLEMI
        {
            var transaction = c.TransactionTasks.Find(id);
            transaction.Durum = false;
            c.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}