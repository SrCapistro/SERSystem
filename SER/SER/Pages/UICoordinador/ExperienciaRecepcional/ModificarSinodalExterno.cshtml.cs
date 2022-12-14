using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SER.Context;
using SER.Entities;

namespace SER.Pages.UICoordinador.ExperienciaRecepcional;
[Authorize(Roles = "Coordinador")]
public class ModificarSinodalExterno : PageModel
{
    private readonly MySERContext _context;
    
    [BindProperty] public SinodalDelTrabajo SinodalDelTrabajo { get; set; }
    [BindProperty] public string apellidoMaterno { get; set; }
    [BindProperty] public string apellidoPaterno { get; set; }
    [BindProperty] public List<Organizacion> Organizacions { get; set; }
    
    [BindProperty] public string nombreSinodal { get; set; }

    public ModificarSinodalExterno(MySERContext context)
    {
        _context = context;
        SinodalDelTrabajo = new SinodalDelTrabajo();
        apellidoMaterno = "";
        apellidoPaterno = "";
        nombreSinodal = "";
        Organizacions = new List<Organizacion>();
    }

    [HttpPost]
    public async Task<IActionResult> OnPostCerrarSesion()
    {
        await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        return new JsonResult(new { succes = true });
    }
    
    public void OnPost()
    {
        try
        {
            var sinodal =
                _context.SinodalDelTrabajos.First(s => s.SinodalDelTrabajoId == Int32.Parse(Request.Query["id"]));
            sinodal.Nombre = Request.Form["nombreSinodal"].ToString().ToUpper();
            sinodal.Nombre = sinodal.Nombre + " " + Request.Form["aPaterno"].ToString().ToUpper();
            sinodal.Nombre = sinodal.Nombre + " " + Request.Form["aMaterno"].ToString().ToUpper();
            sinodal.OrganizacionId = Int32.Parse(Request.Form["orgId"]);
            sinodal.Telefono = Request.Form["telefonoSinodal"];
            sinodal.CorreoElectronico = Request.Form["emailSinodal"];
            _context.SaveChanges();
            TempData["Success"] = "Se ha actualziado la informaci??n correctamente";
        }
        catch (Exception e)
        {
            TempData["ErrorMessage"] = "Ha ocurrido un error al actualizar la informaci??n del sinodal, " + e.Message;
        }
    }
    
    public void OnGet()
    {
        try
        {
            cargarInfoSinodal();
            cargarOrganizaciones();
        }
        catch (Exception e)
        {
            TempData["ErrorMessage"] = "Ha ocurrido un error cargar la informaci??n, " + e.Message;
        }
    }

    public void cargarOrganizaciones()
    {
        var organizaciones = _context.Organizacions.ToList();
        foreach (var org in organizaciones)
        {
            Organizacion organizacion = new Organizacion()
            {
                OrganizacionId = org.OrganizacionId,
                Nombre = org.Nombre
            };
            Organizacions.Add(organizacion);
        }
    }

    public void cargarInfoSinodal()
    {
        var sinodal = _context.SinodalDelTrabajos.First(s=>s.SinodalDelTrabajoId == Int32.Parse(Request.Query["id"]));
        SinodalDelTrabajo.CorreoElectronico = sinodal.CorreoElectronico;
        SinodalDelTrabajo.Telefono = sinodal.Telefono;
        SinodalDelTrabajo.OrganizacionId = sinodal.OrganizacionId;
        SinodalDelTrabajo.SinodalDelTrabajoId = sinodal.SinodalDelTrabajoId;
        String[] nombre = sinodal.Nombre.Split(" ");
        nombreSinodal = nombre[0];
        apellidoPaterno = nombre[1];
        apellidoMaterno = nombre[2];
    }
}