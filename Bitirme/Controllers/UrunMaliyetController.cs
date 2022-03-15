using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class UrunMaliyetController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: UrunMaliyet
        public ActionResult Index()
        {
            var urunmaliyetler = db.UrunMaliyet.ToList();
            return View(urunmaliyetler);
        }
        public ActionResult Remove(int id)
        {
            var remove = db.UrunMaliyet.Find(id);
            db.UrunMaliyet.Remove(remove);
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
            List<SelectListItem> faaliyet = (from i in db.Faaliyet.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.FaaliyetAd,
                                             Value = i.FaaliyetId.ToString(),
                                         }
                                        ).ToList();
            ViewBag.Faaliyetler = faaliyet;

            var dt = db.UrunMaliyet.Find(id);
            return View(dt);
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
        public ActionResult Create(UrunMaliyet parametre)
        {
            var urn = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
            parametre.Urun = urn;
            var dao = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            parametre.DagıtımOlcu = dao;
            var fa = db.Faaliyet.Where(ba => ba.FaaliyetId == parametre.Faaliyet.FaaliyetId).FirstOrDefault();
            parametre.Faaliyet = fa;

            db.UrunMaliyet.Add(parametre);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(UrunMaliyet parametre)
        {
            var m = db.UrunMaliyet.Find(parametre.UrunMaliyet_Id);

            m.UrunDagıtımAdet = parametre.UrunDagıtımAdet;
            var urun = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
            parametre.Urun = urun;
            var daol = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            parametre.DagıtımOlcu = daol;
            var faal = db.Faaliyet.Where(ba => ba.FaaliyetId == parametre.Faaliyet.FaaliyetId).FirstOrDefault();
            parametre.Faaliyet = faal;


            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}