using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FormAuthentication : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string status = Request.QueryString["status"];

        if (status == "error")
        {
            string classi = "error-message";
            Label1.CssClass = String.Format("{0}", classi);
            Label1.Attributes.CssStyle.Add("color", "red");
        }

        HttpCookie reqCookies = Request.Cookies["userInfo"];

        try
        {
            if (reqCookies["UserName"] != null)
            {
                //do something
                Response.Redirect("FormGestionPersonne.aspx");
            }
        }
        catch (NullReferenceException err)
        {
            Response.Write("<script>console.log('" + err.Message + "')</script>");
        }

    }
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        string connetionString;
        SqlConnection cnn;
        string request = String.Format("select * from personnel where emailId='{0}' and mot_de_passe ='{1}'", TextBoxID.Text, TextBoxPassword.Text);
        connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        SqlCommand c = new SqlCommand(request, cnn);
        SqlDataReader dr = c.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                HttpCookie userInfo = new HttpCookie("userInfo");
                userInfo["Email"] = TextBoxID.Text;
                Response.Cookies.Add(userInfo);
                Response.Redirect("FormApprovisionnement.aspx?pg=add");
            }
        }
        else
        {
            Response.Redirect("FormAuthentication.aspx?status=error");
        }

        cnn.Close();
    }


}