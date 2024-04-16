using Microsoft.AspNetCore.Mvc;

namespace JenkinsCiCd.Controllers;

public class TestController : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> HandleTestAsync(CancellationToken cancellationToken)
    {
        //goai
        return Ok(Task.FromResult("Hello world"));
    }
}