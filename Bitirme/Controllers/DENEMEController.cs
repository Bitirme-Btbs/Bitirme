using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class DENEMEController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: DENEME
        public ActionResult Index()
        {
            var a = db.ProductPrice1();

            return View(a);
        }
        public void dizin(TutarUrunFaaliyet burak)
        {
            SqlConnection con = new SqlConnection("");
        }
    }
}