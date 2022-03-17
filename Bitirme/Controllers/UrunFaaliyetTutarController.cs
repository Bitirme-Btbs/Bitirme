using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class UrunFaaliyetTutarController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: UrunFaaliyetTutar
        public ActionResult Index()
        {
            var tuf = db.TutarUrunFaaliyet.ToList();
            return View(tuf);
        }
    }
}