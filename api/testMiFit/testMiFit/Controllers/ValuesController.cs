using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using testMiFit.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace testMiFit.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {

        static ActivityDate activityDate = new ActivityDate() { StepsCount = 300, MetersCount = 12 };
        // GET api/values
        [HttpGet]
        public ActionResult<string> Get()
        {
            var serializerSettings = new JsonSerializerSettings();
            serializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            return JsonConvert.SerializeObject(activityDate, serializerSettings);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public async Task<bool> Post([FromBody] ActivityDate activity)
        {
            await Task.Delay(2000);
            activityDate.StepsCount = activity.StepsCount;
            activityDate.MetersCount= activity.MetersCount;
            return true;
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
