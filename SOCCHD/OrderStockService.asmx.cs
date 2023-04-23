using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace SOCCHD
{
    /// <summary>
    /// Summary description for OrderStockService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class OrderStockService : System.Web.Services.WebService
    {
        SqlConnection sqlCon = null;
        int temp = 0;

        public SqlConnection getConnection()
        {
            try
            {
                sqlCon = new SqlConnection("Data Source=DESKTOP-0LT6VSC;Initial Catalog=SaberSilk;Integrated Security=True");
                sqlCon.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Connecting to DB" + ex);
            }
            return sqlCon;
        }

     /*   [WebMethod]
        public DataSet getProductName()
        {
           DataSet dsN = new DataSet();

            try
            {
                string CategoryType = new obj.InserProduct
                getConnection();
                SqlCommand cmdDepartment = new SqlCommand("Select Product from Category", sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmdDepartment);
                da.Fill(ds, "Category");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Category Name" + ex);
            }
            return ds;
        }


    */
    

    }
}
