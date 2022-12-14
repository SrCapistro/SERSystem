using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SER.Context;
using SER.Entities;

namespace SER.Pages.UIAdministrador;
[Authorize(Roles = "Administrador")]
public class RegistrarAlumno : PageModel
{

    private readonly MySERContext _context;
    
    public List<Alumno> Alumnos { get; set; }
    
    public Alumno alumnoRegistrar { get; set; }
    
    public RegistrarAlumno(MySERContext context)
    {
        _context = context;
        Alumnos = new List<Alumno>();
        alumnoRegistrar = new Alumno();
    }
    
    public void OnGet() {}

    public void OnPost()
    {
        try
        {
            string matricula = Request.Form["Matricula"];
            if (matricula.StartsWith("s") || matricula.StartsWith("S"))
            {
                alumnoRegistrar.Nombre = Request.Form["Nombre"] + " " + Request.Form["ApellidoPaterno"] + " " +
                                         Request.Form["ApellidoMaterno"];
                alumnoRegistrar.Nombre = alumnoRegistrar.Nombre.ToUpper();
                alumnoRegistrar.CorreoElectronico = Request.Form["correo"];
                alumnoRegistrar.Matricula = Request.Form["Matricula"].ToString().ToUpper();
                bool existe = _context.Alumnos.ToList().Any(a => a.Matricula == alumnoRegistrar.Matricula);
                if (!existe)
                {
                    _context.Alumnos.Add(alumnoRegistrar);
                    _context.SaveChanges();
                    TempData["Success"] = "Alumno registrado correctamente";
                }
                else
                {
                    TempData["Error"] = "El alumno que intenta registrar ya existe";
                }
            }
            else
            {
                TempData["Error"] = "La matricula debe iniciar con S";

            }
        }
        catch (Exception e)
        {
            TempData["Error"] = "Ha ocurrido un error" + e.Message;
        }
    }
}