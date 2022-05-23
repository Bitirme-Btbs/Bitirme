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
            var Uruns = db.Uruns.ToList();
            return View(Uruns);
        }
        public ActionResult Remove(int id)
        {
            var remove = db.Uruns.Find(id);
            db.Uruns.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var edit = db.Uruns.Find(id);
            return View(edit);
        }
        public ActionResult Edit(Urun parametre)
        {

            var mukerrer = db.Uruns.Where(ba => ba.UrunAd == parametre.UrunAd).FirstOrDefault();
            if (mukerrer == null)
            {
                var Urunum = db.Uruns.Find(parametre.UrunId);
                Urunum.UrunAd = parametre.UrunAd;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var id = parametre.UrunId;
            string yolu = "Details/" + id.ToString();
            return RedirectToAction(yolu);

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
                return View();
            }
            else
            {
                var mukerrer = db.Uruns.Where(ba => ba.UrunAd == parametre.UrunAd).FirstOrDefault();
                if (mukerrer==null)
                {
                    db.Uruns.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");

                }
                return View();

            }
            
            
        }
    }
}