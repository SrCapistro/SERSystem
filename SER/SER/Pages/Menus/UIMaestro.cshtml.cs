using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace SER.Pages.Menus
{
    public class UIMaestroModel : PageModel
    {
        public void OnGet()
        {
        }

        public IActionResult OnPostExpedientes()
        {
            return Redirect("../UIMaestro/Expedientes?id=" + Request.Query["id"]);
        }
        
        public IActionResult OnPostExperiencias()
        {
            return Redirect("../UIMaestro/Experiencias?id=" + Request.Query["id"]);
        }
    }
}
