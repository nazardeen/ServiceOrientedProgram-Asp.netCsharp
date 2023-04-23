using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SOCCHD
{
    public partial class stockForm : System.Web.UI.Page
    {
        stockReference.stockSoapClient obj = new stockReference.stockSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                DataSet ds = obj.getCategoryName();
                dlCategory.DataSource = ds;
                dlCategory.DataBind();
                dlCategory.DataValueField = "CategoryName";
                dlCategory.DataBind();


              /*  DataSet dss = obj.getProductName(dlType);
                dlCategory.DataSource = dss;
                dlCategory.DataBind();
                dlCategory.DataValueField = "CategoryName";
                dlCategory.DataBind();

    */

                txtID.Text = obj.AutoID();

            }
        }


        protected void btnAdd_CLick(object sender, EventArgs e)
        {
           string CategoryID = obj.getCategoryID(dlCategory.Text);
            if(Page.IsValid)
            {
                lblresult.Text = obj.insertProduct(txtID.Text, txtName.Text, txtDes.Text, CategoryID, Convert.ToInt32(txtQty.TextMode), Convert.ToInt32(txtPrice.TextMode));
            }
            
            
        }

        protected void dlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}