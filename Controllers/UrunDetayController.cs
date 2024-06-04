using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_net_Crm.Models.Siniflar;

namespace mvc_net_Crm.Controllers
{
    public class UrunDetayController : Controller
    {
        // GET: UrunDetay
        Context c = new Context();  
        public ActionResult Index()
        {
            SanalDetay cs= new SanalDetay();    
            cs.Deger1=c.Uruns.Where(x => x.Urunid == 1).ToList();//KOSULLU LISTELEME
            cs.Deger2 = c.Detays.Where(y => y.Detayid == 1).ToList();
            //var urunler = c.Uruns.Where(x => x.Durum == true).ToList();//KOSULLU LISTELEME
            return View(cs);

        }
    }
}