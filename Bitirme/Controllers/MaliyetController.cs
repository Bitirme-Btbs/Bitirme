using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;

namespace Bitirme.Controllers
{
    public class MaliyetController : Controller
    {
        BitirmeEntities db = new BitirmeEntities();
        // GET: Maliyet
        public ActionResult Index()
        {
            var maliyet = db.Maliyets.ToList();
            return View(maliyet);
        }
        [HttpGet]
        public ActionResult Create()
        {
            List<SelectListItem> M_Gider = (from i in db.Giders.ToList()
                                            select new SelectListItem
                                            {
                                        
                                                Text =i.HesapKodu+" "+i.HesapAd,
                                                Value = i.GiderId.ToString(),
                                            }
                                            ).ToList();
            M_Gider.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.MGider = M_Gider;
            List<SelectListItem> M_Faaliyet = (from i in db.Faaliyets.ToList()
                                               select new SelectListItem
                                               {
                                                   Text = i.FaaliyetAd,
                                                   Value = i.FaaliyetId.ToString()
                                               }
                                             ).ToList();
            M_Faaliyet.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Mfaaliyet = M_Faaliyet;

            List<SelectListItem> M_KaynakMaliyetEtken = (from i in db.KaynakMaliyetEtkens.ToList()
                                                         select new SelectListItem
                                                         {
                                                             Text = i.KMEAd,
                                                             Value = i.KMEId.ToString(),
                                                         }
                                                        ).ToList();
            M_KaynakMaliyetEtken.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Mkme = M_KaynakMaliyetEtken;

            return View();
        }
        [HttpPost]
        public ActionResult Create(Maliyet parametre)
        {

            if (!ModelState.IsValid)
            {
                return RedirectToAction("Index");
            }
            else
            {
               

                    List<SelectListItem> M_Gider = (from i in db.Giders.ToList()
                                                select new SelectListItem
                                                {

                                                    Text = i.HesapKodu + " " + i.HesapAd,
                                                    Value = i.GiderId.ToString(),
                                                }
                                           ).ToList();
              
                ViewData["MGider"] = M_Gider;
                List<SelectListItem> M_Faaliyet = (from i in db.Faaliyets.ToList()
                                                   select new SelectListItem
                                                   {
                                                       Text = i.FaaliyetAd,
                                                       Value = i.FaaliyetId.ToString()
                                                   }
                                                 ).ToList();

                ViewData["Mfaaliyet"] = M_Faaliyet;

                List<SelectListItem> M_KaynakMaliyetEtken = (from i in db.KaynakMaliyetEtkens.ToList()
                                                             select new SelectListItem
                                                             {
                                                                 Text = i.KMEAd,
                                                                 Value = i.KMEId.ToString(),
                                                             }
                                                            ).ToList();

                ViewData["Mkme"] = M_KaynakMaliyetEtken;


                var mukerrer = db.Maliyets.Where(ba => ba.GiderId == parametre.Gider.GiderId && ba.FaaliyetId==parametre.Faaliyet.FaaliyetId && ba.KMEId==parametre.KaynakMaliyetEtken.KMEId && ba.Onay.ToString()==parametre.Onay.ToString()).FirstOrDefault();
                if (mukerrer == null)
                {

                    var Gider = db.Giders.Where(ba => ba.GiderId == parametre.Gider.GiderId).FirstOrDefault();
                    parametre.Gider = Gider;

                    var faaliyet = db.Faaliyets.Where(ba => ba.FaaliyetId == parametre.Faaliyet.FaaliyetId).FirstOrDefault();
                    parametre.Faaliyet = faaliyet;

                    var kme = db.KaynakMaliyetEtkens.Where(ba => ba.KMEId == parametre.KaynakMaliyetEtken.KMEId).FirstOrDefault();
                    parametre.KaynakMaliyetEtken = kme;

                    db.Maliyets.Add(parametre);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
                return View();
            }
            
            
        }
        public ActionResult Remove(int id)
        {
            var maliyet = db.Maliyets.Find(id);
            db.Maliyets.Remove(maliyet);

            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            List<SelectListItem> M_Gider = (from i in db.Giders.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.HesapKodu + " " + i.HesapAd,
                                                Value = i.GiderId.ToString(),
                                            }
                                          ).ToList();
            ViewBag.MGider = M_Gider;
            List<SelectListItem> M_Faaliyet = (from i in db.Faaliyets.ToList()
                                               select new SelectListItem
                                               {
                                                   Text = i.FaaliyetAd,
                                                   Value = i.FaaliyetId.ToString()
                                               }
                                             ).ToList();
            ViewBag.Mfaaliyet = M_Faaliyet;

            List<SelectListItem> M_KaynakMaliyetEtken = (from i in db.KaynakMaliyetEtkens.ToList()
                                                         select new SelectListItem
                                                         {
                                                             Text = i.KMEAd,
                                                             Value = i.KMEId.ToString(),
                                                         }
                                                        ).ToList();
            ViewBag.Mkme = M_KaynakMaliyetEtken;
            var maliyet=db.Maliyets.Find(id);
            return View(maliyet);

        }
        public ActionResult Edit(Maliyet parametre)
        {
            var mukerrer = db.Maliyets.Where(ba => ba.GiderId == parametre.Gider.GiderId && ba.FaaliyetId == parametre.Faaliyet.FaaliyetId && ba.KMEId == parametre.KaynakMaliyetEtken.KMEId && ba.Onay.ToString() == parametre.Onay.ToString()).FirstOrDefault();
            if (mukerrer == null)
            {

                var m = db.Maliyets.Find(parametre.MaliyetId);

                m.Adet = parametre.Adet;

                var mGider = db.Giders.Where(ba => ba.GiderId == parametre.Gider.GiderId).FirstOrDefault();
                m.GiderId = mGider.GiderId;

                var mfaaliyet = db.Faaliyets.Where(ba => ba.FaaliyetId == parametre.Faaliyet.FaaliyetId).FirstOrDefault();
                m.FaaliyetId = mfaaliyet.FaaliyetId;

                var mKaynakMaliyetEtken = db.KaynakMaliyetEtkens.Where(ba => ba.KMEId == parametre.KaynakMaliyetEtken.KMEId).FirstOrDefault();
                m.KMEId = mKaynakMaliyetEtken.KMEId;

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var id = parametre.MaliyetId;
            string yol = "Details/" + id.ToString();
            return RedirectToAction(yol);

        }

    }
}