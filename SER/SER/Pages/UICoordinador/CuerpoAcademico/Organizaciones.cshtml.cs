using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SER.Context;
using SER.Entities;

namespace SER.Pages.UICoordinador.CuerpoAcademico;
[Authorize(Roles = "Coordinador")]
public class Organizaciones : PageModel
{
    private readonly MySERContext _context;
    
    [BindProperty]
    public Organizacion Organizacion { get; set; }
    public List<Organizacion> OrganizacionesList { get; set;}

    public Organizaciones(MySERContext context)
    {
        _context = context;
        OrganizacionesList = new List<Organizacion>();
    }

    
    public void OnGet()
    {
        try
        {
            CargarOrganizaciones();
        }
        catch (Exception e)
        {
            TempData["ErrorMessage"] = "Ha ocurrido un error al cargar las organizaciones";
        }
    }

    
    public IActionResult OnPostModificar()
    {
        var id = Request.Query["id"];
        return Redirect("EditarOrganizacion?id="+id);
    }

    public IActionResult OnPostEliminar(int idEliminar)
    {
        try
        {
            var registroProyectos = _context.Vinculacions.Any(v => v.OrganizacionIid == idEliminar);
            var registroSinodales = _context.SinodalDelTrabajos.Any(s => s.OrganizacionId == idEliminar);
            if (!registroProyectos && !registroSinodales)
            {
                var org = _context.Organizacions.FirstOrDefault(o => o.OrganizacionId == idEliminar);
                _context.Organizacions.Remove(org);
                _context.SaveChanges();
                return new JsonResult(new { success = true, responseText = "Organizacion registrada correctamente" });
            }
            else
            {
                return new JsonResult(new { success = false, responseText = "No se ha podido eliminar debido a que existen registros vinculados." });
            }
        }
        catch (Exception e)
        {
            return new JsonResult(new { success = false, responseText = "Error al eliminar"+e.Message });

        }
    }
    
    public void CargarOrganizaciones()
    {
        var listaOrganizaciones = _context.Organizacions.ToList();
        foreach (var organizacion in listaOrganizaciones)
        {
            Organizacion org = new Organizacion()
            {
                Nombre = organizacion.Nombre,
                OrganizacionId = organizacion.OrganizacionId
            };
            OrganizacionesList.Add(org);
        }
    }
}