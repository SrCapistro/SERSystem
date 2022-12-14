using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Remotion.Linq.Clauses;
using SER.Context;
using SER.Entities;

namespace SER.Pages.UICoordinador.CuerpoAcademico;

[Authorize(Roles = "Coordinador")]
public class EditarCuerpoAcademico : PageModel
{
    public string idCuerpo { get; set; }

    public readonly MySERContext _Context;

    [BindProperty]
    public Entities.CuerpoAcademico _cuerpoAcademico { get; set; }
    public EditarCuerpoAcademico(MySERContext context)
    {
        _Context = context;
        _cuerpoAcademico = new Entities.CuerpoAcademico();
    }
    public void OnGet()
    {
        try
        {
            idCuerpo = Request.Query["id"];
            getCuerpo();
        }
        catch (Exception e)
        {
            TempData["ErrorMessage"] = "Ha ocurrido un error al cargar la información de registro, "+e.Message;
        }
    }

    public void OnPost()
    {
        try
        {
            var cuerposExistentes = _Context.CuerpoAcademicos.ToList();
            idCuerpo = Request.Query["id"];
            var cuerpo = _Context.CuerpoAcademicos.First(c => c.CuerpoAcademicoId == Int32.Parse(idCuerpo));
            bool existeCuerpo = cuerposExistentes.Any(c => c.Nombre.Equals(_cuerpoAcademico.Nombre));
            if (cuerpo.Nombre == _cuerpoAcademico.Nombre)
            {
                cuerpo.Objetivogeneral = _cuerpoAcademico.Objetivogeneral;
                _Context.SaveChanges();
                TempData["SuccessMessage"] = "Cuerpo academico actualizado correctamente";
            }
            else
            {
                if (!existeCuerpo)
                {
                    cuerpo.Nombre = _cuerpoAcademico.Nombre;
                    cuerpo.Objetivogeneral = _cuerpoAcademico.Objetivogeneral;
                    _Context.SaveChanges();
                    TempData["SuccessMessage"] = "Cuerpo academico actualizado correctamente";
                }else
                {
                    TempData["ErrorMessage"] = "El nombre del cuerpo a ingresar ya existe";
                }
            }
            
        }
        catch (Exception e)
        {
            TempData["ExceptionMessage"] = e.Data;
        }
    }
    

    public void getCuerpo()
    {
        var cuerpo = _Context.CuerpoAcademicos.FirstOrDefault(c => c.CuerpoAcademicoId == Int64.Parse(idCuerpo));
        _cuerpoAcademico.Nombre = cuerpo.Nombre;
        _cuerpoAcademico.Objetivogeneral = cuerpo.Objetivogeneral;
    }
}