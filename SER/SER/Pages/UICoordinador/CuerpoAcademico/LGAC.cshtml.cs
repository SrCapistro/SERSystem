using System.Data.Entity.Core.Objects;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore.Internal;
using SER.Context;
using SER.Entities;
using Lgac = SER.DTO.Lgac;


namespace SER.Pages.UICoordinador.CuerpoAcademico;

[Authorize(Roles = "Coordinador")]
public class LGAC : PageModel
{
    
    private readonly MySERContext _context;

    public List<Lgac> Lgacs { get; set; }
    public LGAC(MySERContext context)
    {
        _context = context;
        Lgacs = new List<Lgac>();
    }
    public void OnGet()
    {
        try
        {
            getLgacs();
        }
        catch (Exception ex)
        {
            TempData["ErrorMessage"] = "Error al cargar LGACs";
        }
    }
    
    public IActionResult OnPostModificar()
    {
        var id = Request.Query["id"];
        return Redirect("EditarLGAC?id="+id);
    }

    public void getLgacs()
    {
        var listaLgacs = _context.Lgacs.ToList();
        var listaCuerpo = _context.CuerpoAcademicos.ToList();
        var query = listaLgacs.Join(listaCuerpo, lgac => lgac.CuerpoAcademicoId,
            academico => academico.CuerpoAcademicoId, (lgac, academico) => new
            {
                idLgac = lgac.LgacId,
                nombreLgac = lgac.Nombre,
                nombreCuerpo = academico.Nombre
            });
        foreach (var lgac_academico in query)
        {
            Lgac lgac = new Lgac(lgac_academico.nombreLgac, lgac_academico.idLgac, lgac_academico.nombreCuerpo);
            Lgacs.Add(lgac);
        }

    }
}