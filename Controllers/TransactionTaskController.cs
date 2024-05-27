using System;
using System.Collections.Generic;
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
        Context c = new Context();
        public ActionResult Index()
        {
            var transaction = c.TransactionTasks.Where(x => x.Durum == true && x.OnayStatusu.Contains("Bekliyor")).ToList();
            return View(transaction);
        }
    }
}