﻿using System;
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
            Dagıtımolcusu.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Do = Dagıtımolcusu;
            List<SelectListItem> faaliyet = (from i in db.Faaliyet.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.FaaliyetAd,
                                                 Value = i.FaaliyetId.ToString(),
                                             }
                                        ).ToList();
            faaliyet.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Faaliyetler = faaliyet;

            return View();
        }
        [HttpPost]
        public ActionResult Create(DagitimOlcuFaaliyetiliski parametre)
        {
            if (!ModelState.IsValid)
            {
                return View("Create");
            }
            else
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
        public ActionResult Remove(int id)
        {
            var remove = db.DagitimOlcuFaaliyetiliski.Find(id);
            db.DagitimOlcuFaaliyetiliski.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            Dagıtımolcusu.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Do = Dagıtımolcusu;
            List<SelectListItem> faaliyet = (from i in db.Faaliyet.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.FaaliyetAd,
                                                 Value = i.FaaliyetId.ToString(),
                                             }
                                        ).ToList();
            faaliyet.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Faaliyetler = faaliyet;

            var ba = db.DagitimOlcuFaaliyetiliski.Find(id);
            return View(ba);

        }
        public ActionResult Edit(DagitimOlcuFaaliyetiliski parametre)
        {
            var edit = db.DagitimOlcuFaaliyetiliski.Find(parametre.Df_Id);

            var m_faaliyet = db.Faaliyet.Where(ba => ba.FaaliyetId == parametre.Faaliyet.FaaliyetId).FirstOrDefault();
            edit.FaaliyetId = m_faaliyet.FaaliyetId;

            var m_daol = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            edit.DagitimOlcuId = m_daol.DagıtımOlcu_Id;


            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}