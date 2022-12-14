using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SER.Context;
using SER.Entities;

namespace SER.Pages.UICoordinador.ExperienciaRecepcional;

[Authorize(Roles = "Coordinador")]
public class TrabajosRecepcionales : PageModel
{
    
    private readonly MySERContext _context;
    public List<TrabajoRecepcional> trabajoRecepcionals { get; set; }

    public TrabajosRecepcionales(MySERContext context)
    {
        _context = context;
        trabajoRecepcionals = new List<TrabajoRecepcional>();

    }
    
    public IActionResult OnPostModificarTrabajo()
    {
        return Redirect("ModificarTrabajoRecepcional?id="+Request.Query["id"]);
    }
    
    [HttpPost]
    public async Task<IActionResult> OnPostCerrarSesion()
    {
        await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        return new JsonResult(new { succes = true });
    }
    
    public void OnGet()
    {
        try
        {
            getTrabajosRecepcionales();
            
        }
        catch (Exception ex)
        {
            TempData["ErrorMessage"] = "Ha ocurrido un error al cargar los trabajos recepcionales, "+ex.Message;
        }
    }

    public void OnPost()
    {
        
    }
    
    public void OnPostBuscar()
    {
        Console.WriteLine("Buscar");
    }
 
    public IActionResult OnPostEstudiantes()
    {
        var id = Request.Query["id"];
        return Redirect("AsignarAlumnos?id="+id);
    }

    public IActionResult OnPostSinodales()
    {
        return Redirect("AsignarSinodales?id=" + Request.Query["id"]);
    }

    public IActionResult OnPostDocumento()
    {
        var id = Request.Query["id"];
        var experiencia = Request.Query["experiencia"];
        if (experiencia.Equals("pg"))
        {
            return Redirect("RegistrarDocumentoProyectoGuiado?id="+id);
        }
        else
        {
            return Redirect("RegistrarDocumentoExperiencia?id="+id);
        }
    }

    
    public void getTrabajosRecepcionales()
    {
        var trabajosRegistrados = _context.TrabajoRecepcionals.ToList();
        foreach (var trabajo in trabajosRegistrados)
        {
            TrabajoRecepcional trabajoRecepcional = new TrabajoRecepcional()
            {
                Nombre = trabajo.Nombre,
                Modalidad = trabajo.Modalidad,
                Estado = trabajo.Estado,
                Fechadeinicio = trabajo.Fechadeinicio,
                Duracion = trabajo.Duracion,
                TrabajoRecepcionalId = trabajo.TrabajoRecepcionalId,
                ExperienciaActual = trabajo.ExperienciaActual
            };
            trabajoRecepcionals.Add(trabajoRecepcional);
        }
    }
}