using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FormProfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getUserPhoto();
        fillInfos();
    }

    private void getUserPhoto()
    {
        try
        {
             SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            con.Open();

            string email = "";

            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null || reqCookies["Email"] != null)
            {
                email = reqCookies["Email"].ToString();

                SqlCommand cmd = new SqlCommand("select ImageProfileData from personne where id_personne = (select id_personne from personnel where emailId= @email)", con);

                cmd.Parameters.AddWithValue("@email", email);

                byte[] bytes = (byte[])cmd.ExecuteScalar();
                string strBase64 = Convert.ToBase64String(bytes);

                Image1.ImageUrl = "data:Image/png;base64," + strBase64;
                Image1.Attributes.CssStyle.Add("border-radius", "50%");
                Image1.Attributes.CssStyle.Add("width", "50px");
                Image1.Attributes.CssStyle.Add("height", "50px");
                
                userAvatar.Attributes.CssStyle.Add("background-image",String.Format("url('{0}')","data:Image/png;base64," + strBase64));
            }
            else
            {
                Response.Redirect("FormAuthentication.aspx");
            }
        }
        catch (Exception e)
        {
            if (e.Message == "Object reference not set to an instance of an object.")
            {
                Response.Redirect("FormAuthentication.aspx");

            }

        }



    }

    private void fillInfos()
    {
         HttpCookie reqCookies = Request.Cookies["userInfo"];
          string email=reqCookies["email"]; 
        string connetionString;
        SqlConnection cnn;
        connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        string request1 = String.Format("select pe.id_personne,pe.emailID,p.nom,p.prenom,p.sexe,p.ImageProfileData,pe.categorie"+
            " from personnel pe,personne p where p.id_personne=pe.id_personne and pe.emailId='{0}'",email);

        cnn = new SqlConnection(connetionString);
        cnn.Open();


        SqlCommand c1 = new SqlCommand(request1, cnn);
        SqlDataReader dr1 = c1.ExecuteReader();
    
        while (dr1.Read())
        {
            nomPersonnel.InnerHtml= dr1.GetString(2) + " " + dr1.GetString(2);
            hashTagNomPersonnel.InnerHtml = "@" + dr1.GetString(2) + dr1.GetString(2);
            phoneNumber.InnerHtml = "+25761161213";
            locationPersonnel.InnerHtml = "Kamenge Av N_11";
            dateNaissancePersonnel.InnerHtml = "11-01-1995";
            emailPersonnel.InnerHtml = dr1.GetString(1);
            positionPersonnel.InnerHtml=dr1.GetString(6);
            byte[] bytes = (byte[])dr1.GetValue(5);
            string strBase64 = Convert.ToBase64String(bytes);
          
        }
        cnn.Close();
    }}