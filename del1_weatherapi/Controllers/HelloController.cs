using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace del1_weatherapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return "Hello kabir";
        }
    }
}
