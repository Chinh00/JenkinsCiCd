using Microsoft.AspNetCore.Mvc;

namespace JenkinsCiCd.Controllers;

public class TestController : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> HandleTestAsync(CancellationToken cancellationToken)
    {
        return Ok(Task.FromResult("Hello world"));
    }
}