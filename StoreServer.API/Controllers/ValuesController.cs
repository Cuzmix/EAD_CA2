using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StoreServer.API.Data;
using StoreServer.API.Models;
using Microsoft.Extensions.Options;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
namespace StoreServer.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly DataContext _context;
        string connectionString = "Server=tcp:ead-sql-server.database.windows.net,1433;Initial Catalog=ead-sql-database;Persist Security Info=False;User ID=x00142153;Password=Qazwsx09;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

        public ValuesController(DataContext context)
        {
            _context = context;
        }

        [HttpGet("getProducts")]
        public async Task<IActionResult> GetProducts()
        {
            try
            {
                var products = await _context.Products.ToListAsync();
                return Ok(products);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }

        }
        [HttpGet("searchProduct/{nameIn}")]
        public async Task<IActionResult> searchProduct(String nameIn)
        {
            try
            {
                var products = await _context.Products.ToListAsync();
                var results = products.Where(p => p.Name.ToLower().Contains(nameIn));


                if (results != null)
                {
                    return Ok(results);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPost("purchaseItem/{prodId}/{amt}")]
        public async Task<IActionResult> PurchaseItem(int prodId, int amt)
        {
            try
            {
                Models.Product products = await _context.Products.FirstOrDefaultAsync(p => p.ID == prodId);
                if (products.Quantity < amt)
                {
                    return BadRequest("Not enough in stock");
                }
                if (products.Quantity > 0)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {

                        SqlCommand command = new SqlCommand($"update [dbo].[Products] set [Quantity] = [Quantity] -{amt} where [Id] = {prodId}", connection);
                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();
                    }
                }


            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }

            return Ok();
        }
    }
}
