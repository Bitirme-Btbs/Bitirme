using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class KaynakMaliyetEtkenController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: KaynakMaliyetEtken
        public ActionResult Index()
        {
            var KME = db.KaynakMaliyetEtkens.ToList();
            return View(KME);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(KaynakMaliyetEtken parametre)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            else
            {
                var mukerrer = db.KaynakMaliyetEtkens.Where(ba => ba.KMEAd == parametre.KMEAd).FirstOrDefault();
                if (mukerrer==null)
                {
                 db.KaynakMaliyetEtkens.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");
                }
                return View();
            }
        }
        public ActionResult Remove(int id)
        {
            var remove = db.KaynakMaliyetEtkens.Find(id);
            db.KaynakMaliyetEtkens.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var details = db.KaynakMaliyetEtkens.Find(id);
            return View(details);
        }
        public ActionResult Edit(KaynakMaliyetEtken parametre)
        {
            var mukerrer = db.KaynakMaliyetEtkens.Where(ba => ba.KMEAd == parametre.KMEAd).FirstOrDefault();
            if (mukerrer==null)
            {
            var edit = db.KaynakMaliyetEtkens.Find(parametre.KMEId);
            edit.KMEAd = parametre.KMEAd;
            db.SaveChanges();
            return RedirectToAction("Index");
            }
            var id = parametre.KMEId;
            string yolu = "Details/" + id.ToString();
            return RedirectToAction(yolu);
            
        }
    }
}