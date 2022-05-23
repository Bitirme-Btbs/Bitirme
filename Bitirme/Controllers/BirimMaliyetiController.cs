using Bitirme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bitirme.Controllers
{
    public class BirimMaliyetiController : Controller
    {
        // GET: BirimMaliyeti
        BitirmeEntities db = new BitirmeEntities();
        public ActionResult Index()
        {
            var objects = db.BirimMaliyets.ToList();
            return View(objects);
        }
        public ActionResult ToplamMaliyet()
        {
            var ba = db.SPToplamMaliyet();
            return View(ba);
        }
        public ActionResult BirimMaliyetTutar()
        {
            var ba = db.BirimMaliyetSP1();
            return View(ba);
        }
        [HttpGet]
        public ActionResult Create()
        {
            
            List<SelectListItem> urun = (from i in db.Uruns.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.UrunAd,
                                             Value = i.UrunId.ToString(),
                                         }
                                         ).ToList();
            urun.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            List<SelectListItem> dagitim = (from i in db.DagıtımOlcu.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.DagıtımOlcu_Ad,
                                             Value = i.DagıtımOlcu_Id.ToString(),
                                         }
                                         ).ToList();
            dagitim.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Dagitim = dagitim;
            ViewBag.Urunler = urun;
            return View();
        }
        [HttpPost]
        public ActionResult Create(BirimMaliyet parametre)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            else
            {
                
                    db.BirimMaliyets.Add(parametre);
                    db.SaveChanges();
                    return RedirectToAction("Index");      
            }


        }
        public ActionResult Remove(int id)
        {
            var remove = db.BirimMaliyets.Find(id);
            db.BirimMaliyets.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {

            List<SelectListItem> urun = (from i in db.Uruns.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.UrunAd,
                                             Value = i.UrunId.ToString(),
                                         }
                                         ).ToList();
            urun.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            List<SelectListItem> dagitim = (from i in db.DagıtımOlcu.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.DagıtımOlcu_Ad,
                                                Value = i.DagıtımOlcu_Id.ToString(),
                                            }
                                         ).ToList();
            dagitim.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Dagitim = dagitim;
            ViewBag.Urunler = urun;

            var data = db.BirimMaliyets.Find(id);
            return View(data);
        }
        public ActionResult Edit(BirimMaliyet parametre)
        {
           

                var m = db.BirimMaliyets.Find(parametre.BM_Id);

                m.Dimmg = parametre.Dimmg;
                m.Dig = parametre.Dig;

                var m_urun = db.Uruns.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
                m.Urun_ID = m_urun.UrunId;

            var dd = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            m.BirimDagitimOlcu = dd.DagıtımOlcu_Id;

            db.SaveChanges();
                return RedirectToAction("Index");
           
        }


    }

}