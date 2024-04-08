using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MySql.Data;
using MySql.Data.MySqlClient;

namespace mvc_net_Crm.Controllers
{
    public class HomeController : Controller
    {
        public void baglanti()
        {
            //
            string connStr = "server=localhost;user=root1;database=crmtest;port=3306;password=root";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT * FROM crmtest";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Console.WriteLine(rdr[0] + " -- " + rdr[1]);
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            conn.Close();
            Console.WriteLine("Done.");
        }






        public ActionResult Index()
        {
            baglanti();

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            baglanti();
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            baglanti();
            return View();
        }
    }
}