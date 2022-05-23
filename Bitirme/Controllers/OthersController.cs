using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class OthersController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: ORANvTUTAR
        public ActionResult Oran()
        {
            var oran = db.Orans.ToList();
            return View(oran);
        }

        //FaaliyetMaliyet
        public ActionResult Tutar()
        {
            var tutar = db.GenelTutars.ToList();
            return View(tutar);
        }

       
        public ActionResult FaaliyetToplam()
        {
            var ft = db.ToplamFaaliyetTutars.ToList();
            return View(ft);
        }
        public ActionResult Endirekt()
        {
            var endirekt = db.EndirektUretimMaliyetis.ToList();
            return View(endirekt);
        }


    }
}