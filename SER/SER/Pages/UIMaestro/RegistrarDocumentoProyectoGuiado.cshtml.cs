using System.Dynamic;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SER.Context;
using SER.Entities;
using Microsoft.EntityFrameworkCore;

namespace SER.Pages
{
    [Authorize(Roles = "Maestro")]
    [IgnoreAntiforgeryToken]
    public class RegistrarDocumentoProyectoGuiadoModel : PageModel
    {
        private readonly MySERContext _context;
        private IWebHostEnvironment Environment;
        public List<TipoDocumento> TipoDocumentos { get; set; }
        public Archivo archivoPg { get; set; }
        [BindProperty] public Documento documento { get; set; }
        public RegistrarDocumentoProyectoGuiadoModel(MySERContext context, IWebHostEnvironment _environment)
        {
            _context = context;
            Environment = _environment;
            TipoDocumentos = new List<TipoDocumento>();
            documento = new Documento();
            archivoPg = new Archivo();
        }

        [HttpPost]
        public async Task<IActionResult> OnPostCerrarSesion()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return new JsonResult(new { succes = true });
        }
        
        public async Task<IActionResult> OnPost(IFormFile fileProyecto)
        {
            try
            {
                var id = Request.Query["id"];
                var tipo = _context.TipoDocumentos.FirstOrDefault(t => t.IdTipo == Int32.Parse(Request.Form["tipo"]));
                bool existe = _context.Documentos.Any(d => d.TipoDocumentoId == documento.TipoDocumentoId && d.TrabajoRecepcionalId == Int32.Parse(id));
                if (!existe)
                {
                    if (fileProyecto != null)
                    {
                        documento.TrabajoRecepcionalId = Int32.Parse(id);
                        string fecha = DateTime.Now.ToString().Replace("/", "");
                        string fileName = "PG_" + fecha.Replace(" ", "").Replace(":", "") + id;
                        var archivo = Path.Combine(Environment.WebRootPath, "Archivos", fileName);
                        using (var fileStream = new FileStream(archivo, FileMode.Create))
                        {
                            await fileProyecto.CopyToAsync(fileStream);
                        }
                        archivoPg.NombreArchivo = fileName;
                        archivoPg.IdFuente = Int32.Parse(id);
                        archivoPg.Direccion = "Archivos/" + fileName;
                        archivoPg.Fuente = tipo.NombreDocumento;
                        _context.Documentos.Add(documento);
                        _context.Archivos.Add(archivoPg);
                        _context.SaveChanges();
                        TempData["Success"] = "El documento se ha subido correctamente";
                    }
                    else
                    {
                        TempData["Error"] = "Debes de seleccionar un archivo";
                    }
                }
                else
                {
                    TempData["Error"] = "El documento que intentas subir ya esta registrado";
                }
            }
            catch (Exception e)
            {
                TempData["Error"] = "Ha ocurrido un error al registrar el documento "+e.Message;
            }
            return Page();
        }

        public void OnGet()
        {
            try
            {
                getTiposDocumento();
            }
            catch (Exception e)
            {
                TempData["Error"] = "Ha ocurrido un error al cargar la informaci??n de registro, "+e.Message;
            }
        }
        
        public void getTiposDocumento()
        {
            var listaTipos = _context.TipoDocumentos.ToList().Where(t=> t.ExperienciaEducativa=="Proyecto gu??ado");
            foreach (var tipo in listaTipos)
            {
                TipoDocumento tipoDocumento = new TipoDocumento()
                {
                    NombreDocumento = tipo.NombreDocumento,
                    IdTipo = tipo.IdTipo
                };
                TipoDocumentos.Add(tipoDocumento);
            }
        }
    }
}
