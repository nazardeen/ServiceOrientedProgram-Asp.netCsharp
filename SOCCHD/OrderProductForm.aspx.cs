using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SOCCHD
{
    public partial class OrderProductForm : System.Web.UI.Page
    {
        stockReference.stockSoapClient obj = new stockReference.stockSoapClient();
        string CategoryValuee = "";
        string ProductValue = "";
        string ProoName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            stockReference.stockSoapClient obj = new stockReference.stockSoapClient();

            if (!IsPostBack)
            {

                cascadingdropdown();
            }

        }




        protected void btnSearchName_Click1(object sender, EventArgs e)
        {
            
            dlTable.DataSource = obj.SearchProduct(txtName.Text);
            dlTable.DataBind();
        }


        protected void btnCheck_Click(object sender, EventArgs e)
        {

            if(Page.IsValid)
            {
                dl2.DataSource = obj.Availibility(txtProductID.Text);
                dl2.DataBind();
            }
        }

        protected void cascadingdropdown()
        {

            SqlConnection sqlconn = new SqlConnection("Data Source=DESKTOP-0LT6VSC;Initial Catalog=SaberSilk;Integrated Security=True");
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand("SELECT * FROM Category", sqlconn);
            sqlcomm.CommandType = CommandType.Text;
            dlFabric.DataSource = sqlcomm.ExecuteReader();
            dlFabric.DataTextField = "CategoryName";
            dlFabric.DataValueField = "CategoryID";
            dlFabric.DataBind();
            dlFabric.Items.Insert(0, new ListItem("--Select Fabric Type--","0"));
        }

        protected void dlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryValuee = dlFabric.SelectedItem.Value.ToString();

            SqlConnection sqlconn = new SqlConnection("Data Source=DESKTOP-0LT6VSC;Initial Catalog=SaberSilk;Integrated Security=True");
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand("SELECT * FROM Stock WHERE CategoryID='" + CategoryValuee + "'", sqlconn);
            sqlcomm.CommandType = CommandType.Text;
            dlAvailable.DataSource = sqlcomm.ExecuteReader();
            dlAvailable.DataTextField = "ProductName";
            dlAvailable.DataValueField = "ProductID";
            dlAvailable.DataBind();
            dlAvailable.Items.Insert(0, new ListItem("--Select Product Type--", "0"));
            
        }

        protected void dlAvailable_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProductValue = dlAvailable.SelectedItem.Value.ToString();
          

            SqlConnection sqlconn = new SqlConnection("Data Source=DESKTOP-0LT6VSC;Initial Catalog=SaberSilk;Integrated Security=True");
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand("SELECT * FROM Stock WHERE ProductID='" + ProductValue + "'", sqlconn);

            
            sqlcomm.CommandType = CommandType.Text;

            dlPP.DataSource = sqlcomm.ExecuteReader();
            dlPP.DataTextField = "ProductPrice";
            dlPP.DataValueField = "ProductID";
            dlPP.DataBind();




        }


       /* protected void dlQty_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ProductQuantity = Convert.ToInt32(dlQuantity.SelectedItem.Value.ToString());
            ProductValue = dlAvailable.SelectedItem.Value.ToString();

            SqlConnection sqlconn = new SqlConnection("Data Source=DESKTOP-0LT6VSC;Initial Catalog=SaberSilk;Integrated Security=True");
            sqlconn.Open();
            SqlCommand sqlcomm = new SqlCommand("SELECT * FROM Stock WHERE ProductID='" + ProductValue + "'", sqlconn);

            sqlcomm.CommandType = CommandType.Text;

            dlPrice.DataSource = sqlcomm.ExecuteReader();
            dlPrice.DataTextField = "ProductPrice";
            dlPrice.DataValueField = "ProductID";
            dlPrice.DataBind();

        }*/




        protected void btnOrder_Click(object sender, EventArgs e)
        {
            string Selectedx = "";

            // string nn = ProductValue;
            // int x = ProductQuantity;

            if (txtBuyQty.Text == "")
            {
                lblOrderResult.Text = "Please enter values";
            }
            else
            {
                Selectedx = dlAvailable.SelectedItem.Value;
                if (Page.IsValid)
                {
                    obj.buyProduct(Selectedx, Convert.ToInt32(txtBuyQty.Text));

                    dlOrderss.DataSource = obj.SearchIDD(Selectedx);
                    dlOrderss.DataBind();
                    lblOrderResult.Text = "Order Placed";
                }
            }
        }




        /*   protected void dlQuantity_SelectedIndexChanged(object sender, EventArgs e)
           {
               ProductValue = dlAvailable.SelectedItem.Value.ToString();


               SqlConnection sqlconn = new SqlConnection("Data Source=DESKTOP-0LT6VSC;Initial Catalog=SaberSilk;Integrated Security=True");
               sqlconn.Open();
               SqlCommand sqlcomm = new SqlCommand("SELECT * FROM Stock WHERE ProductID='" + ProductValue + "'", sqlconn);


               sqlcomm.CommandType = CommandType.Text;

               dlPrice.DataSource = sqlcomm.ExecuteReader();
               dlPrice.DataTextField = "ProductQuantity";
               dlPrice.DataValueField = "ProductID";
               dlPrice.DataBind();
           }*/
    }
}