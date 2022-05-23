using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class FaaliyetController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: Faaliyet
        public ActionResult Index()
        {
            var Faaliyet = db.Faaliyets.ToList();
            return View(Faaliyet);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Faaliyet parametre)
        {
            if (!ModelState.IsValid)
            {
                return View("Create");
            }
            else
            {
                var mukerrer = db.Faaliyets.Where(ba => ba.FaaliyetAd == parametre.FaaliyetAd).FirstOrDefault();
                if (mukerrer==null)
                {
                db.Faaliyets.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");
                }
                return View();
               
            }

        }
        public ActionResult Remove(int id) 
        {
            var remove = db.Faaliyets.Find(id);
            db.Faaliyets.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var edit = db.Faaliyets.Find(id);
            return View(edit);
        }
        public ActionResult Edit(Faaliyet parametre)
        {
            var mukerrer = db.Faaliyets.Where(ba => ba.FaaliyetAd == parametre.FaaliyetAd).FirstOrDefault();
            if (mukerrer == null)
            {
                var faaliyetdeger = db.Faaliyets.Find(parametre.FaaliyetId);
                faaliyetdeger.FaaliyetAd = parametre.FaaliyetAd;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var id = parametre.FaaliyetId;
            string yolu = "Details/" + id.ToString();
            return RedirectToAction(yolu);

        }

    }
}