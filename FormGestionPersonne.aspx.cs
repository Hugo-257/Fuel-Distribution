using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.IO;

public partial class FormGestionPersonne : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
        try
        {
            getUserPhoto();
        

            string status = Request.QueryString["form"];

            if (status == "personnel")
            {
                card_abonne.Attributes.CssStyle.Add("display", "none");
                link_to_personnel_form.Attributes.Remove("class");
                link_to_personnel_form.Attributes.Add("class", "page-tab-link payment-details w--current");
                location.Attributes.Remove("class");
                location.Attributes.Add("class", "sidebar-navbar-link link-login w-dropdown-link ");
               
                
            }
            else if (status == "abonne")
            {
                card_personnel.Attributes.CssStyle.Add("display", "none");
                link_to_abonne_form.Attributes.Remove("class");
                link_to_abonne_form.Attributes.Add("class", "page-tab-link subscription w--current");
                location.Attributes.Remove("class");
                location.Attributes.Add("class", "sidebar-navbar-link link-login  w-dropdown-link  ");
                location.Attributes.Add("href", "/FormGestionPersonne.aspx?form=abonne");

               
            }
            else if (status == "" || status==null)
            {
                Response.Redirect("/FormGestionPersonne.aspx?form=personnel");
            }
        }
        catch (Exception err)
        {


        }

        if (!IsPostBack)
        {

            fillDropDownSexe(DropDownListSexe);
            fillDropDownSexe(DropDownListSexeAbonne);
            fillDropDownCategorie();
        }
    }

    private void fillDropDownSexe(DropDownList dr)
    {
       
        dr.Items.Clear();
        dr.Items.Add("Homme");
        dr.Items.Add("Femme");


    }

    private void fillDropDownCategorie()
    {

        DropDownListCategorie.Items.Clear();
        DropDownListCategorie.Items.Add("Simple");
        DropDownListCategorie.Items.Add("Administrateur");


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        enregistrerPersonnel();

    }
    protected void ButtonEnregistrerAbonne_Click(object sender, EventArgs e)
    {
        enregistrerAbonne();
       

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
  
    private void enregistrerPersonnel()
    {
        if(testEmpty()<0)
        {
            try
            {

                  HttpPostedFile postedFile = FileUploadPicPersonnel.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

               
                    string query1 = "insert into personne(nom,prenom,sexe,ImageProfileData) values(@nom,@prenom,@sexe,@ImageProfileData)";

                    string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(connectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query1, con);
                    cmd.Parameters.AddWithValue("@nom", TextBoxNom.Text);
                    cmd.Parameters.AddWithValue("@prenom", TextBoxPrenom.Text);
                    cmd.Parameters.AddWithValue("@sexe", DropDownListSexe.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@ImageProfileData", bytes);
                    var result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        string query2 = "select * from Personne where id_Personne = (select Max(id_Personne) from personne)";

                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        SqlDataReader dr = cmd2.ExecuteReader();
                        string idPersonne = "";
                        while (dr.Read())
                        {
                            idPersonne = dr["id_personne"].ToString();

                        }

                        string query3 = String.Format("insert into Personnel(categorie,mot_de_passe,id_personne,emailID) values('{0}','{1}','{2}','{3}')", DropDownListCategorie.SelectedItem.ToString(), TextBoxPassword.Text, idPersonne, TextBoxMail.Text);

                        SqlCommand cmd3 = new SqlCommand(query3, con);
                        var result2 = cmd3.ExecuteNonQuery();

                        if (result2 > 0)
                        {
                            alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show");
                            alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show hidden");
                            successMessage.InnerText = "Enregistrement reussi";

                      
                        }
                        else
                        {
                            alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
                            alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                            errorMessage.InnerText = "Erreur lors de l'enregistrement";
                        }

                    }
                    con.Close();
                }
                else
                {
                    showErrorText("Only images (.jpg, .png, .gif and .bmp) can be uploaded");
                }

            }
            catch (Exception e)
            {
                alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
                alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                errorMessage.InnerText = e.Message;

            }
        }

          
    }


    private void enregistrerAbonne()
    {
        if (testEmptyAbonne() < 0)
        {
            try
            {
                HttpPostedFile postedFile = FileUploadPicAbonne.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                    string query1 = "insert into personne(nom,prenom,sexe,ImageProfileData) "+
                    "values(@nom,@prenom,@sexe,@ImageProfileData)";
                
                    string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(connectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query1, con);
                    cmd.Parameters.AddWithValue("@nom", TextBoxNomAbonne.Text);
                    cmd.Parameters.AddWithValue("@prenom",TextBoxPrenomAbonne.Text);
                    cmd.Parameters.AddWithValue("@sexe", DropDownListSexeAbonne.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@ImageProfileData", bytes); 
                    var result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        string query2 = "select * from Personne where id_Personne = (select Max(id_Personne) "+"from personne)";

                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        SqlDataReader dr = cmd2.ExecuteReader();
                        string idPersonne = "";
                        while (dr.Read())
                        {
                            idPersonne = dr["id_personne"].ToString();
                        }

                        string query3 = String.Format("insert into Abonne(mot_de_passe,id_personne,emailID) "+
                            "values('{0}','{1}','{2}')", TextBoxPasswordAbonne.Text, idPersonne, TextBoxEmailAbonne.Text);

                        SqlCommand cmd3 = new SqlCommand(query3, con);
                        var result2 = cmd3.ExecuteNonQuery();

                        if (result2 > 0)
                        {

                            alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show");
                            alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show hidden");
                            successMessage.InnerText = "Enregistrement reussi";
                        }
                        else
                        {
                            alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
                            alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                            errorMessage.InnerText = "Erreur lors de l'enregistrement";
                        }
                    }
                    con.Close();
                }
                else
                {
                    showErrorText("Only images (.jpg, .png, .gif and .bmp) can be uploaded");
                }
            }
            catch (Exception e)
            {
                alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
                alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                errorMessage.InnerText = e.Message;
            }}}


    private int testEmpty()
    {
        if (TextBoxNom.Text == "" )
        {
            showErrorText("Veuillez saisir le nom ");
            return 1;
        }
        if (TextBoxPrenom.Text == "" )
        {   
               showErrorText("Veuillez saisir le prenom");
               return 1;

        }

        if (TextBoxMail.Text == "" )
        {
            showErrorText("Veuillez saisir l'adresse email");
            return 1;

        }

        if (TextBoxPassword.Text == "" )
        {
            showErrorText("Veuillez saisir le mot de passe");
            return 1;

        }
        if (TextBoxVerifyPassword.Text == "")
        {
            showErrorText("Veuillez saisir mot de passe de vérification");
            return 1;

        }
        if (TextBoxVerifyPassword.Text != TextBoxPassword.Text)
        {
            showErrorText("Mots de passe saisis ne correspondent pas");
            return 1;

        }

        return -1;
    }

    private int testEmptyAbonne()
    {
        if (TextBoxNomAbonne.Text == "")
        {
            showErrorText("Veuillez saisir le nom ");
            return 1;
        }
        if (TextBoxPrenomAbonne.Text == "")
        {
            showErrorText("Veuillez saisir le prenom");
            return 1;

        }

        if (TextBoxEmailAbonne.Text == "")
        {
            showErrorText("Veuillez saisir l'adresse email");
            return 1;

        }

        if (TextBoxPasswordAbonne.Text == "")
        {
            showErrorText("Veuillez saisir le mot de passe");
            return 1;

        }
        if (TextBoxVerifyPasswordAbonne.Text == "")
        {
            showErrorText("Veuillez saisir mot de passe de vérification");
            return 1;

        }
        if (TextBoxVerifyPasswordAbonne.Text != TextBoxPasswordAbonne.Text)
        {
            showErrorText("Mots de passe saisis ne correspondent pas");
            return 1;

        }

        return -1;
    }


    private void showErrorText(string message)
    {
        alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
        alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        errorMessage.InnerText = message;
    }



  
}