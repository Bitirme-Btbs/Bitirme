using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class ORANvTUTARController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: ORANvTUTAR
        public ActionResult Oran()
        {
            var oran = db.Oran.ToList();
            return View(oran);
        }

        //FaaliyetMaliyet
        public ActionResult Tutar()
        {
            var tutar = db.GenelTutar.ToList();
            return View(tutar);
        }
    
            }
}