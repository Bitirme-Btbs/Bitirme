//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bitirme.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class KaynakMaliyetEtken
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KaynakMaliyetEtken()
        {
            this.Maliyets = new HashSet<Maliyet>();
        }
    
        public int KMEId { get; set; }
        public string KMEAd { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Maliyet> Maliyets { get; set; }
    }
}
