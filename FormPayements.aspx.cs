using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using sharpPDF;

public partial class FormPayements : System.Web.UI.Page
{
    static List<List<string>> listCarburant = new List<List<string>>();
    static List<List<string>> list = new List<List<string>>();

    protected void Page_Load(object sender, EventArgs e)
    {

        getUserPhoto();

        string status = Request.QueryString["statusAdd"];

        if (status == "error")
        {
            showErrorMessage();
           
        }
        else if (status == "success")
        {
            showSuccessMessage();
           
        }
        if (!IsPostBack)
        {
            fillComboIdUtilisateur();
            fillComboCarburantType();
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

    private void fillComboCarburantType()   
    {

        string connetionString;
        SqlConnection cnn;
        connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        string request1 = "select id_carburant,type_carburant,prix_par_litre_vente from carburant";

        cnn = new SqlConnection(connetionString);
        cnn.Open();


        SqlCommand c1 = new SqlCommand(request1, cnn);
        SqlDataReader dr1 = c1.ExecuteReader();
        DropDownListCarburantTypeAnonyme.Items.Clear();
        DropDownListCarburantTypeAbonne.Items.Add(" ");
        DropDownListCarburantTypeAnonyme.Items.Add(" ");
        while (dr1.Read())
        {
            List<string> subList = new List<string>();
            subList.Add(dr1.GetInt32(0).ToString());
            subList.Add(dr1.GetString(1));
            subList.Add(dr1.GetInt32(2).ToString());
            listCarburant.Add(subList);
            DropDownListCarburantTypeAbonne.Items.Add(dr1.GetString(1));
            DropDownListCarburantTypeAnonyme.Items.Add(dr1.GetString(1));

        }



        cnn.Close();
    }
    private void fillComboIdUtilisateur()
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
            List<string> subList = new List<string>();
            subList.Add(dr1.GetInt32(0).ToString());
            subList.Add(dr1.GetString(1));
            subList.Add(dr1.GetString(2));
            subList.Add(dr1.GetString(3));
            subList.Add(dr1.GetString(4));

            byte[] bytes = (byte[])dr1.GetValue(5);
            string strBase64 = Convert.ToBase64String(bytes);

            subList.Add(strBase64);


            list.Add(subList);

            DropDownListAbonne.Items.Add(dr1.GetString(2) + " " + dr1.GetString(3));
        }



        cnn.Close();
    }

    protected void DropDownListAbonne_SelectedIndexChanged(object sender, EventArgs e)
    {
  
    }
   


    protected void ButtonAchatCarburantAnonyme_click(object sender, EventArgs e)
    {
        enregistrerPourAnonyme();
    }

    protected void ButtonAchatCarburantAbonne_click(object sender, EventArgs e)
    {
        enregistrerPourAbonne(Int32.Parse(list[DropDownListAbonne.SelectedIndex - 1][0]));
    }



    private int enregistrerPourAbonne(int id)
    {
        if (DropDownListCarburantTypeAbonne.SelectedItem.ToString() == "Essence" && checkStockCarburant("Essence", "Abonne") < 0) return 0;
        else if (DropDownListCarburantTypeAbonne.SelectedItem.ToString() == "Diesel" && checkStockCarburant("Diesel", "Abonne") < 0) return 0;
        if (testEmptyAbonne() > 0)
        {
          int quantite = Int32.Parse(TextBoxQuantiteCarburantAbonne.Text);
          string date = DateTime.Now.ToString();
          int idCarburant=Int32.Parse(listCarburant[DropDownListCarburantTypeAbonne.SelectedIndex-1][0]);
          int cout=Int32.Parse(listCarburant[DropDownListCarburantTypeAbonne.SelectedIndex-1][2]) * Int32.Parse(TextBoxQuantiteCarburantAbonne.Text);
          int id_abonne = Int32.Parse(list[DropDownListAbonne.SelectedIndex - 1][0]) * Int32.Parse(TextBoxQuantiteCarburantAbonne.Text);
          string request1 = String.Format("insert into Distribution_abonne(date_distribution,id_carburant,quantite,cout,id_abonne) "+
                            "values('{0}','{1}','{2}','{3}','{4}')", date,idCarburant,quantite, cout, id_abonne);
          string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
          SqlConnection con = new SqlConnection(connectionString);
          con.Open();
          SqlCommand cmd = new SqlCommand(request1, con);
          var result = cmd.ExecuteNonQuery();
          if (result > 0){
              FactureAbonne(list[DropDownListAbonne.SelectedIndex - 1],listCarburant[1],Int32.Parse(TextBoxQuantiteCarburantAbonne.Text));
              Response.Redirect("/FormPayements.aspx?&statusAdd=success");}
          else{Response.Redirect("/FormPayements.aspx?statusAdd=error");}
          con.Close();
        }
        return 0;
    }

    private int enregistrerPourAnonyme()
    {
        if (testEmptyAnonyme() > 0)
        {
            if (DropDownListCarburantTypeAnonyme.SelectedItem.ToString() == "Essence" && checkStockCarburant("Essence", "Anonyme") < 0 ) return 0;
            else if (DropDownListCarburantTypeAnonyme.SelectedItem.ToString() == "Diesel" && checkStockCarburant("Diesel", "Anonyme") < 0)return 0;
            int quantite = Int32.Parse(TextBoxQuantiteCarburantAnonyme.Text);
            string date = DateTime.Now.ToString();
            int idCarburant = Int32.Parse(listCarburant[DropDownListCarburantTypeAnonyme.SelectedIndex - 1][0]);
            int cout = Int32.Parse(listCarburant[DropDownListCarburantTypeAnonyme.SelectedIndex - 1][2]) * Int32.Parse(TextBoxQuantiteCarburantAnonyme.Text);
            string request1 = String.Format("insert into Distribution_simple(date_distribution,id_carburant,quantite,cout)"+
                                "values('{0}','{1}','{2}','{3}')", date, idCarburant, quantite, cout);
            string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(request1, con);
            var result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                FactureAnonyme(listCarburant[1], Int32.Parse(TextBoxQuantiteCarburantAnonyme.Text));
                Response.Redirect("/FormPayements.aspx?&statusAdd=success");}
            else
            {
                Response.Redirect("/FormPayements.aspx?statusAdd=error");
            }
            con.Close();
             }
            return 0;
    }


    private int testEmptyAbonne()
    {
        if (DropDownListCarburantTypeAbonne.SelectedItem.ToString() == "")
        {
            showErrorMessage("Veuillez selectionner le type de carburant");
            return -1;
        }
        

        if (TextBoxQuantiteCarburantAbonne.Text== "" )
        {
            showErrorMessage("Veuillez entrer les quantités");
            return -1;
        }

       

        return 1;
    }

    private int testEmptyAnonyme()
    {

        if (DropDownListCarburantTypeAnonyme.SelectedItem.ToString() == "")
        {
            showErrorMessage("Veuillez selectionner le type de carburant");
            return -1;
        }


        if (TextBoxQuantiteCarburantAnonyme.Text == "")
        {
            showErrorMessage("Veuillez entrer les quantités");
            return -1;
        }

       

        return 1;
    }


    private void showErrorMessage(string message)
    {
        alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
        alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        errorMessage.InnerText = message;
    }

    private void showErrorMessage()
    {
        alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show hidden");
        alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        errorMessage.InnerText = "Erreur lors de l'enregistrement";
    }

    private void showSuccessMessage(string message)
    {
        alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show mt-2");
        alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show mt-2 hidden");
        successMessage.InnerText = message;
    }

    private void showSuccessMessage()
    {
        alertSucces.Attributes.Add("class", "alert alert-success alert-dismissible fade show mt-2");
        alertError.Attributes.Add("class", "alert alert-danger alert-dismissible fade show mt-2 hidden");
        successMessage.InnerText = "Enregistrement reussi";
    }


    private int checkStockCarburant(string typeCarburant,string qui)
    {
        
        int approvisionnement = 0;
        int distribution = 0;

        string connetionString;
        SqlConnection cnn;
        connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        string request1 = String.Format("select sum(A.quantite) from Carburant C,Approvisionnement A "+
                         "where A.id_carburant= C.id_carburant and C.type_carburant='{0}'",typeCarburant);

        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand c1 = new SqlCommand(request1, cnn);
        SqlDataReader dr1 = c1.ExecuteReader();

        while (dr1.Read())
        {
            try
            {
                approvisionnement = dr1.GetInt32(0);
            }
            catch (Exception errrr)
            {
                Response.Write(String.Format("<script>alert('{0}')</script>", errrr.Message));

            }

            /*----------Afficher distribution Simple*/
            string request2 = String.Format("select sum(DS.quantite)  from Distribution_simple DS,Carburant CA "+
                              "where CA.id_carburant=DS.id_carburant  and CA.type_carburant='{0}'",typeCarburant);

            SqlCommand c2 = new SqlCommand(request2, cnn);
            SqlDataReader dr2 = c2.ExecuteReader();

            while (dr2.Read())
            {
                try
                {
                    if (dr2.HasRows)
                    {
                        distribution = distribution + Decimal.ToInt32(dr2.GetDecimal(0));
                    }
                }
                catch (Exception errr)
                {
                    Response.Write(String.Format("<script>alert('{0}')</script>", errr.Message));
                }
            }

            string request3 = String.Format("select sum(DA.quantite)  from Distribution_abonne DA  ,Carburant CA"+
                            " where CA.id_carburant=DA.id_carburant  and CA.type_carburant='{0}'",typeCarburant);

            SqlCommand c3 = new SqlCommand(request3, cnn);
            SqlDataReader dr3 = c3.ExecuteReader();

            while (dr3.Read())
            {
                try
                {
                    if (dr3.HasRows)
                    {
                        distribution = distribution + Decimal.ToInt32(dr3.GetDecimal(0));
                    }
                }
                catch (Exception err)
                {
                    Response.Write(String.Format("<script>alert('{0}')</script>",err.Message));
                }
            }
            int dispo = approvisionnement - distribution;
            if (qui == "Abonne")
            {
                if (dispo < Int32.Parse(TextBoxQuantiteCarburantAbonne.Text))
                {
                    showErrorMessage("Quantité non disponible.");
                    return -1;
                }
            }else if (qui == "Anonyme")
            {
                if (dispo < Int32.Parse(TextBoxQuantiteCarburantAnonyme.Text))
                {
                    showErrorMessage("Quantité non disponible.");
                    return -1;
                }}}
        return 1;
    }

    private void FactureAbonne(List<string> abonne, List<string> carburant, int quantite)
    {
        string separator = "******************************************************************";

        pdfDocument d = new pdfDocument("Rapport", "Paiement");
        pdfPage p = d.addPage();
        p.addText(separator, 70, 655, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Facture--Fuelly", 200, 640, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 16);
        p.addText(separator, 70, 625, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);

        p.addText("Client :", 70, 570, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Carburant :", 70, 540, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Prix par litre :", 70, 510, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Nombre de litres :", 70, 480, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Prix Total :", 70, 450, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);

        string prixTotal = (quantite * Int32.Parse(carburant[2])).ToString();

        p.addText(abonne[3]+" "+abonne[2], 300, 570, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
        p.addText(carburant[1].ToString(), 300, 540, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
        p.addText(carburant[2], 300, 510, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
        p.addText(quantite.ToString(), 300, 480, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
        p.addText(prixTotal, 300, 450, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);


        d.createPDF(@"C:\Users\pc\Desktop\Paiement.pdf");
    }



    private void FactureAnonyme(List<string> carburant,int quantite)
    {
        string separator="******************************************************************";
    
        pdfDocument d = new pdfDocument("Rapport", "Paiement");
        pdfPage p = d.addPage();
        p.addText(separator, 70, 655, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Facture--Fuelly", 200, 640, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 16);
        p.addText(separator, 70, 625, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
       
        p.addText("Client :", 70, 570, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Carburant :", 70, 540, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Prix par litre :", 70, 510, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Nombre de litres :", 70, 480, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);
        p.addText("Prix Total :", 70, 450, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csHelveticaOblique), 14);


        string prixTotal = (quantite * Int32.Parse(carburant[2])).ToString();
       

            p.addText("Anonyme", 300, 570, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
            p.addText(carburant[1].ToString(), 300, 540, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
            p.addText(carburant[2], 300, 510, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
            p.addText(quantite.ToString(), 300, 480, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);
            p.addText(prixTotal, 300, 450, d.getFontReference(sharpPDF.Enumerators.predefinedFont.csCourierBoldOblique), 14);


            d.createPDF(@"C:\Users\pc\Desktop\Paiement.pdf");
    }



}