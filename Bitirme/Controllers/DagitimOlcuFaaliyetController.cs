using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class DagitimOlcuFaaliyetController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: DagitimOlcuFaaliyet
        public ActionResult Index()
        {
            var df = db.DagitimOlcuFaaliyetiliski.ToList();
            return View(df);
        }
        [HttpGet]
        public ActionResult Create()
        {
            
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            ViewBag.Do = Dagıtımolcusu;
            List<SelectListItem> faaliyet = (from i in db.Faaliyet.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.FaaliyetAd,
                                                 Value = i.FaaliyetId.ToString(),
                                             }
                                        ).ToList();
            ViewBag.Faaliyetler = faaliyet;

            return View();
        }
        [HttpPost]
        public ActionResult Create(DagitimOlcuFaaliyetiliski parametre)
        {
            
            var dao = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            parametre.DagıtımOlcu = dao;
            var fa = db.Faaliyet.Where(ba => ba.FaaliyetId == parametre.Faaliyet.FaaliyetId).FirstOrDefault();
            parametre.Faaliyet = fa;

            db.DagitimOlcuFaaliyetiliski.Add(parametre);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}