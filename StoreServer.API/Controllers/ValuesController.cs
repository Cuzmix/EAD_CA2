using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StoreServer.API.Data;
using StoreServer.API.Models;
using Microsoft.Data.Sqlite;
using Microsoft.Extensions.Options;

namespace StoreServer.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly DataContext _context;

        public ValuesController(DataContext context)
        {
            _context = context;
        }

        [HttpGet("getProducts")] //http://localhost:5000/api/values/getProducts
        public async Task<IActionResult> GetProducts()
        {
            var products = await _context.Products.ToListAsync();

            return Ok(products);
        }

        [HttpPost("purchaseBasket")] //http://localhost:5000/api/values/purchaseBasket/
        public IActionResult PurchaseBasket([FromBody]List<Models.Product> basket)
        {
            if (basket.Count == 0) {
                return BadRequest();
            }
            string command;
            foreach(Product item in basket) {
            command = $"update Products set Quantity = Quantity -1 where Name = '{item.Name}'";   
            using (SqliteConnection con = new SqliteConnection("Data Source=Shop.db")) {
                con.Open();
                using (SqliteCommand cmd = con.CreateCommand()){
                    cmd.CommandText = command;
                    cmd.ExecuteNonQuery();
                }
                con.Close();
            }
            }
            return Ok();
        }



        /*
[
    {
        "id": 1,
        "name": "Milk",
        "price": 1.5,
        "quantity": 6
    },
    {
        "id": 2,
        "name": "Cookies",
        "price": 2,
        "quantity": 44
    }
]
        
        
         */
        
    }
}
