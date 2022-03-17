using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class MaliyetUrunController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: MaliyetUrun
        public ActionResult Index()
        {
            var urunmaliyetler = db.MaliyetUrun.ToList();
            return View(urunmaliyetler);
        }
        public ActionResult Remove(int id)
        {
            var remove = db.MaliyetUrun.Find(id);
            db.MaliyetUrun.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Create()
        {
            List<SelectListItem> urun = (from i in db.Urun.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.UrunAd,
                                             Value = i.UrunId.ToString(),
                                         }
                                         ).ToList();
            ViewBag.Urunler = urun;
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            ViewBag.Do = Dagıtımolcusu;
         

            return View();
        }
        [HttpPost]
        public ActionResult Create(MaliyetUrun parametre)
        {
            var urn = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
            parametre.Urun = urn;
            var dao = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            parametre.DagıtımOlcu = dao;
            

            db.MaliyetUrun.Add(parametre);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(MaliyetUrun parametre)
        {
            var m = db.MaliyetUrun.Find(parametre.MaliyetUrunId);

            m.UrunDagitimAdet = parametre.UrunDagitimAdet;
            var urun = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
            parametre.Urun = urun;
            var daol = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            parametre.DagıtımOlcu = daol;
          


            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            List<SelectListItem> urun = (from i in db.Urun.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.UrunAd,
                                             Value = i.UrunId.ToString(),
                                         }
                                         ).ToList();
            ViewBag.Urunler = urun;
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            ViewBag.Do = Dagıtımolcusu;
           

            var dt = db.MaliyetUrun.Find(id);
            return View(dt);
        }
    }
}