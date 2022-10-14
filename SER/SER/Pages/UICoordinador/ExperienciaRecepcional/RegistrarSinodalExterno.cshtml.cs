using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SER.DBContext;
using SER.Entidades;

namespace SER.Pages.UICoordinador.ExperienciaRecepcional;

public class RegistrarSinodalExterno : PageModel
{
    private readonly MySERContext _context;
    public List<Organizacion> Organizacions { get; set; }
    
    [BindProperty]
    public SinodalDelTrabajo SinodalDelTrabajo { get; set; }
    
    [BindProperty]
    public string apellidoPaterno { get; set; }
        
    [BindProperty]
    public string apellidoMaterno { get; set; }
    
    public RegistrarSinodalExterno(MySERContext context)
    {
        _context = context;
        Organizacions = new List<Organizacion>();
    }

    
    public void OnGet()
    {
        cargarOrganizaciones();
    }
    
    public void OnPost()
    {
        try
        {
            SinodalDelTrabajo.Nombre = Request.Form["NombreSinodal"] + " " + apellidoMaterno + " " + apellidoPaterno;
            SinodalDelTrabajo.OrganizacionId = Convert.ToInt32(Request.Form["OrgId"]);
            SinodalDelTrabajo.Nombre = SinodalDelTrabajo.Nombre.ToUpper();
            var sinodalesExistentes = _context.SinodalDelTrabajos.ToList();
            bool sinodalYaExiste = sinodalesExistentes.Any(s => s.Nombre == SinodalDelTrabajo.Nombre && s.CorreoElectronico == SinodalDelTrabajo.CorreoElectronico);
            if (sinodalYaExiste)
            {
                TempData["ErrorMessage"] = "El sinodal que intentas registrar ya se encuentra registrado";
                cargarOrganizaciones();
            }
            else
            {
                _context.SinodalDelTrabajos.Add(SinodalDelTrabajo);
                _context.SaveChanges();
                TempData["Success"] = "Sinodal registrado correctamente";
            }
        }
        catch (Exception e)
        {
            TempData["ErrorMessage"] = "Ha ocurrido un error al completar el registro " + e.Message;
        }
    }
    
    
    public void cargarOrganizaciones()
    {
        try
        {
            var listaOrgs = _context.Organizacions.ToList();
            foreach (var org in listaOrgs)
            {
                Organizacion organizacion = new Organizacion()
                {
                    Nombre = org.Nombre,
                    OrganizacionId = org.OrganizacionId
                };
                Organizacions.Add(organizacion);
            }
        }
        catch (Exception e)
        {
            TempData["ErrorMessage"] = "Error al cargar las organizaciones";
        }
    }
}