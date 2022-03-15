using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class DagıtımOlcuController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: DagıtımOlcu
        public ActionResult Index()
        {
            var DagıtımOlcu = db.DagıtımOlcu.ToList();
            return View(DagıtımOlcu);
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(DagıtımOlcu parametre)
        {
            if (!ModelState.IsValid)
            {
                return View("Add");
            }
            else
            {
                db.DagıtımOlcu.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }


        }
        public ActionResult Details(int id)
        {
            var edit = db.DagıtımOlcu.Find(id);
            return View(edit);
        }
        public ActionResult Edit(DagıtımOlcu parametre)
        {
            var daol = db.DagıtımOlcu.Find(parametre.DagıtımOlcu_Id);
            daol.DagıtımOlcu_Ad = parametre.DagıtımOlcu_Ad;
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        public ActionResult Remove(int id)
        {
            var remove = db.DagıtımOlcu.Find(id);
            db.DagıtımOlcu.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}