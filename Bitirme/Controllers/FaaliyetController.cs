﻿using System;
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
            var Faaliyet = db.Faaliyet.ToList();
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
                db.Faaliyet.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

        }
        public ActionResult Remove(int id) 
        {
            var remove = db.Faaliyet.Find(id);
            db.Faaliyet.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var edit = db.Faaliyet.Find(id);
            return View(edit);
        }
        public ActionResult Edit(Faaliyet parametre)
        {
            var faaliyetdeger = db.Faaliyet.Find(parametre.FaaliyetId);
            faaliyetdeger.FaaliyetAd = parametre.FaaliyetAd;
            db.SaveChanges();
            return RedirectToAction("Index");

        }

    }
}