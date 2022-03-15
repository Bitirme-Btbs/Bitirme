using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class UrunController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: Urun
        public ActionResult Index()
        {
            var urun = db.Urun.ToList();
            return View(urun);
        }
        public ActionResult Remove(int id)
        {
            var remove = db.Urun.Find(id);
            db.Urun.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var edit = db.Urun.Find(id);
            return View(edit);
        }
        public ActionResult Edit(Urun parametre)
        {
            var urunum = db.Urun.Find(parametre.UrunId);
            urunum.UrunAd = parametre.UrunAd;
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(Urun parametre)
        {
            if (!ModelState.IsValid)
            {
                return View("Add");
            }
            else
            {
                db.Urun.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            
        }
    }
}