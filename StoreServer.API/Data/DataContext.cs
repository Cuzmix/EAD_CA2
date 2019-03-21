using Microsoft.EntityFrameworkCore;
using StoreServer.API.Models;

namespace StoreServer.API.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options){}

        public DbSet<Product> Products {get;set;}
        //
    }
}