using System;
using System.Collections.Generic;

namespace SER.Entities
{
    public partial class PlanDeTrabajo
    {
        public DateTime? FechaDeAprobacion { get; set; }
        public string? PeriodoEscolar { get; set; }
        public int PlanDeTrabajoId { get; set; }
        public int? AcademiaId { get; set; }

        public virtual Academium? Academia { get; set; }
    }
}
