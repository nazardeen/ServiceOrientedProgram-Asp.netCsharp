using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;

namespace SOCCHD
{
    /// <summary>
    /// Summary description for stock
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class stock : System.Web.Services.WebService
    {
         string categoryIDdrop = null;
         string Items="";

         string CategoryID = "";
         string ProductName = "";
         string ProductID = "";
         int temp = 0;
        SqlConnection sqlCon = null;

      
        
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

        [WebMethod]
        public bool buyProduct(string ProductID, int ProductQuantity)
        {

            bool records = false;

            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("UPDATE Stock SET ProductQuantity=ProductQuantity- " +ProductQuantity + " WHERE ProductID='" + ProductID + "'", sqlCon);
                SqlDataReader zrr = cmd.ExecuteReader();

                records = zrr.HasRows;
                zrr.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Update Stock"+ex);
            }
            return records;
        }

        [WebMethod]
        public string AutoID()
        {

            string AutoAddID  = null;

            try
            {
                getConnection();
                SqlCommand cmdAutoID = new SqlCommand("SELECT ProductID FROM Stock", sqlCon);
                SqlDataReader dr = cmdAutoID.ExecuteReader();
                string id = "";

                Boolean records = dr.HasRows;

                if(records)
                {
                    while (dr.Read ())
                    {
                        id = dr[0].ToString();
                    }
                    string idString = id.Substring(1);
                    int CTR = Int32.Parse(idString);
                    if(CTR>=1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        AutoAddID = "P00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        AutoAddID = "P0" + CTR;
                    }
                    if (CTR > 1 )
                    {
                        CTR = CTR + 1;
                        AutoAddID = "P00" + CTR;
                    }
                }
                else
                {
                    AutoAddID = "P001";
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                AutoAddID = ex.ToString();
            }
            return AutoAddID;
        }






        [WebMethod]
        public DataSet getCategoryName()
        {
            DataSet ds = new DataSet();

            try
            {
                getConnection();
                SqlCommand cmdDepartment = new SqlCommand("Select CategoryName from Category", sqlCon);
                SqlDataAdapter da = new SqlDataAdapter(cmdDepartment);
                da.Fill(ds, "Category");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Category Name" + ex);
            }
            return ds;
        }


       


        [WebMethod]
        public DataSet SearchProduct(String ProductName)
        {
            DataSet dn = new DataSet();

            try
            {
                getConnection();
                SqlCommand cmdSearch = new SqlCommand("Select * from Stock WHERE ProductName='"+ProductName+"'", sqlCon);
                SqlDataAdapter db = new SqlDataAdapter(cmdSearch);
                db.Fill(dn, "Stock");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Product" + ex);
            }
            return dn;
        }


        [WebMethod]
        public DataSet SearchIDD(String ProductID)
        {
            DataSet mn = new DataSet();

            try
            {
                getConnection();
                SqlCommand cmdSearc = new SqlCommand("Select * from Stock WHERE ProductID='" + ProductID + "'", sqlCon);
                SqlDataAdapter mb = new SqlDataAdapter(cmdSearc);
                mb.Fill(mn, "Stock");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Product" + ex);
            }
            return mn;
        }


        [WebMethod]
        public DataSet Availibility(String Name)
        {
            DataSet zn = new DataSet();

            try
            {
                getConnection();
                SqlCommand c = new SqlCommand("Select * from Stock WHERE ProductID='" + Name + "'", sqlCon);
                SqlDataAdapter db = new SqlDataAdapter(c);
                db.Fill(zn, "Stock");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error searching Product" + ex);
            }
            return zn;
        }
/*
        [WebMethod]
                public string getProductName(string categoryIDdrop)
                {


                    try
                    {
                        getConnection();
                        SqlCommand cmdD = new SqlCommand("Select CategoryID from Stock WHERE ProductName='" + ProductName + "'", sqlCon);
                        SqlDataAdapter da = new SqlDataAdapter(cmdD);
                        SqlDataReader dr = cmdD.ExecuteReader();

                        Boolean records = dr.HasRows;
                        if (records)
                        {
                            while (dr.Read())
                            {
                                ProductName = dr["ProductName"].ToString();
                            }
                        }
                        dr.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error searching Product Name" + ex);
                    }
                    return ProductName;
                }

                */

       
                [WebMethod]
                public string getCategoryID(string categoryName)
                {


                    try
                    {
                        getConnection();
                        SqlCommand cmd = new SqlCommand("Select CategoryID from Category where CategoryName = '"+categoryName +"'", sqlCon);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        SqlDataReader dr = cmd.ExecuteReader();

                        Boolean records = dr.HasRows;
                        if(records)
                        {
                            while(dr.Read())
                            {
                                CategoryID = dr[0].ToString();
                            }
                        }
                        dr.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error searching Category Name" + ex);
                    }
                    return CategoryID;
                }
             
      /*  [WebMethod]
        public string updateProduct(string productID, string productName, string productDes, string category, int qty, int price)
        {
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("UPDATE Stock SET ('" + productID + "','" + productName + "','" + productDes + "','" + category + "'," + qty + "," + price + ");", sqlCon);
                temp = cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            return temp.ToString();
        }*/


        [WebMethod]
        public string insertProduct(string productID, string productName, string productDes, string category, int qty, int price)
        {



            try
            {   
                getConnection();
                SqlCommand cmd = new SqlCommand("INSERT INTO Stock Values ('" + productID + "','" + productName + "','" + productDes + "','" + category + "'," + qty + "," + price + ");", sqlCon);
                temp = cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            return temp.ToString();
        }

       /* 
        [WebMethod]
        public string updateProduct(string productID, string productName, string productDes, string category, int qty, int price)
        {
            try
            {
                getConnection();
                SqlCommand cmd = new SqlCommand("Update Stock set ('" + productID + "','" + productName + "','" + productDes + "','" + category + "'," + qty + "," + price + ");", sqlCon);
                temp = cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            return temp.ToString();
        }*/

    }

 
    
}
