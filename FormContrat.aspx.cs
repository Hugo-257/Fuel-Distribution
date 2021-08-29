using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class FormContrat : System.Web.UI.Page
{
   static  List<List<string>> list = new List<List<string>>();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        navbarToContrat.Attributes.CssStyle.Add("background-color","#325ae7");
        navbarToContrat.Attributes.CssStyle.Add("opacity", "1");
        navbarToContrat.Attributes.CssStyle.Add("color", "#fff");


        getUserPhoto();
        string status = Request.QueryString["statusAdd"];

            if(status =="error" ){
                showErrorMessage();
            }
            else if (status == "success" )
            {
                showSuccessMessage();
            }
        string page=Request.QueryString["pg"];

        if (page == "search")
        {
            rechercheContratDiv.Attributes.CssStyle.Add("display", "block");
            ajoutContratDiv.Attributes.Add("class", "hidden");

        }

        if (page == "add")
        {
            rechercheContratDiv.Attributes.CssStyle.Add("display", "none");
            ajoutContratDiv.Attributes.CssStyle.Add("display", "block");

        }


        if (!IsPostBack)
        {
            fillComboAbonnes();
            fillDropDownPaiement();
            gridBindAll();
        }

        TextBoxSearch.Attributes.Add("placeholder","Search ...");
    
    }


    
    private void enregistrerContrat(int id)
    {
        
        if (testEmpty() > 0)
        {
            try{
                string dateDebut=CalendarDebut.Value.ToString();
                string dateFin = CalendarFin.Value.ToString();
           
                string typePaiement=DropDownListPaiement.SelectedItem.ToString();
                string request1 = String.Format("insert into contrat(date_debut,date_fin,id_abonne,type_paiement) "+
                       "values('{0}','{1}','{2}','{3}')", dateDebut,dateFin ,id, typePaiement);
                string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand(request1, con);
                var result = cmd.ExecuteNonQuery();
                 if (result > 0)
                {

                    Response.Redirect("/FormContrat.aspx?pg=add&statusAdd=success"); 
                }
                    else
                    {
                        Response.Redirect("/FormContrat.aspx?pg=add&statusAdd=error");
                    }
                con.Close();
        }
            catch(Exception e)
            {
                showErrorMessage(e.Message);
            }
        }
    }

    private void fillComboAbonnes()
    {

        string connetionString;
        SqlConnection cnn;
        connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        string request1 = "select a.id_abonne,a.emailID,p.nom,p.prenom,p.sexe,p.ImageProfileData from abonne a,personne p where p.id_personne=a.id_personne";

        cnn = new SqlConnection(connetionString);
        cnn.Open();


        SqlCommand c1 = new SqlCommand(request1, cnn);
        SqlDataReader dr1 = c1.ExecuteReader();
        DropDownListAbonne.Items.Clear();
        DropDownListAbonne.Items.Add(" ");
        while (dr1.Read())
        {
            List<string> subList=new List<string>();
            subList.Add(dr1.GetInt32(0).ToString());
            subList.Add(dr1.GetString(1));
            subList.Add(dr1.GetString(2));
            subList.Add(dr1.GetString(3));
            subList.Add(dr1.GetString(4));

            byte[] bytes = (byte[]) dr1.GetValue(5);
            string strBase64 = Convert.ToBase64String(bytes);
            subList.Add(strBase64);
            list.Add(subList);
            DropDownListAbonne.Items.Add(dr1.GetString(2) + " " + dr1.GetString(3));
        }
       
        cnn.Close();
    }

    private void fillDropDownPaiement()
    {

        DropDownListPaiement.Items.Clear();
        DropDownListPaiement.Items.Add("Mensuel");
        DropDownListPaiement.Items.Add("Annuel");


    }

    private int testEmpty()
    {

        if (CalendarDebut.Value == null || CalendarDebut.Value == ""||  CalendarDebut.Value == null || CalendarDebut.Value == "" )
        {
            showErrorMessage("Choisissez des dates valides");
            return -1;
        }

        if (DateTime.Compare(DateTime.Parse(CalendarDebut.Value),DateTime.Parse(CalendarFin.Value))>=0)
        {
            showErrorMessage("Date de debut est au dessus ou égale de la date de fin");
            return -1;
        }

        return 1;
    }


    private void showErrorMessage(string message)
    {
        alertSucces.Attributes.CssStyle.Add("display", "none !important");
        alertError.Attributes.CssStyle.Add("display", "block !important");
        errorMessage.InnerText = message;
    }

    private void showErrorMessage()
    {
        alertSucces.Attributes.CssStyle.Add("display", "none !iportant");
        alertError.Attributes.CssStyle.Add("display", "block !important"); 
        errorMessage.InnerText = "Erreur lors de l'enregistrement";
    }

    private void showSuccessMessage(string message)
    {
        alertSucces.Attributes.CssStyle.Add("display", "block !important");
        alertError.Attributes.CssStyle.Add("display", "none !important");
        successMessage.InnerText = message;
    }

    private void showSuccessMessage()
    {
        alertSucces.Attributes.CssStyle.Add("display", "block  !important");
        alertError.Attributes.CssStyle.Add("display", "none !important");
        successMessage.InnerText = "Enregistrement reussi";
    }




    protected void ButtonENregistrerContrat_Click(object sender, EventArgs e)
    {

       try{

           enregistrerContrat(Int32.Parse(list[DropDownListAbonne.SelectedIndex-1][0]));
       }catch(Exception err){

           showErrorMessage(err.Message);
       }

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

    protected void DropDownListAbonne_SelectedIndexChanged(object sender, EventArgs e)
    {
        infoMail.InnerHtml = list[DropDownListAbonne.SelectedIndex - 1][1]; 
        infoNom.InnerHtml = list[DropDownListAbonne.SelectedIndex - 1][2] + " " + list[DropDownListAbonne.SelectedIndex - 1][3];
        infoSexe.InnerHtml = list[DropDownListAbonne.SelectedIndex - 1][4];
        infoImage.ImageUrl = "data:Image/png;base64," + list[DropDownListAbonne.SelectedIndex - 1][5];
        infoBeneficiaire.Attributes.CssStyle.Add("display","block !important");
        alertError.Attributes.CssStyle.Add("display","none");
       alertSucces.Attributes.CssStyle.Add("display","none");
    }

    private void gridBind()
    {
        string query = String.Format("select a.emailID,c.date_debut,c.date_fin,c.type_paiement from contrat c,abonne a where a.emailID='{0}' and c.id_abonne=a.id_abonne", TextBoxSearch.Text);
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);

        GridViewResultSearch.DataSource = ds.Tables[0];
        GridViewResultSearch.DataBind();

        SqlDataReader dr = cmd.ExecuteReader();
        string resultsNumber= "";
        int i = 0;
        while (dr.Read())
        {
            i++;

        }
        resultsNumber = " Résultat(s) trouvé(s) : "+i;
        numberResultFound.InnerHtml=resultsNumber;
        motCleRecherche.InnerHtml=TextBoxSearch.Text;

    }
    private void gridBindAll()
    {
        string query = String.Format("select a.emailID,a.id_abonne,c.date_debut,c.date_fin,c.type_paiement from contrat c,abonne a where c.id_abonne=a.id_abonne");
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);

        GridViewResultSearch.DataSource = ds.Tables[0];
        GridViewResultSearch.DataBind();

         
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        counterResult.Attributes.CssStyle.Clear();
        counterResult.Attributes.Add("class","mb-3");
         gridBind();
       
    }



    protected void GridViewResultSearch_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Int32.Parse(GridViewResultSearch.DataKeys[e.RowIndex].Value.ToString());
        string date_debut = ((TextBox)GridViewResultSearch.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string date_fin = ((TextBox)GridViewResultSearch.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string type_paiement = ((TextBox)GridViewResultSearch.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

        try
        {
            string query = String.Format("update contrat set date_debut='{0}',date_fin='{1}',type_paiement='{2}'"+
                " where id_abonne={3}", date_debut, date_fin, type_paiement, id);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            var result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Write("<script>alert('Updated successfully')</script>");
                GridViewResultSearch.EditIndex = -1;
                gridBindAll();
            }
            else
            {
                Response.Write("<script>alert('Error updating.....')</script>");
            }
            con.Close();
        }
        catch (Exception err)
        {
            Response.Write(String.Format("<script>console.log({0})</script>", err.Message));

        }}




    protected void GridViewResultSearch_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewResultSearch.EditIndex = e.NewEditIndex;
        gridBindAll();
    }
    protected void GridViewResultSearch_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewResultSearch.EditIndex = -1;
        gridBindAll();
    }
}