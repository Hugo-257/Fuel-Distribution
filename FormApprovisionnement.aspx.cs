using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

public partial class FormApprovisionnement : System.Web.UI.Page
{
    private string val1 = "90deg";

    public string Val1
    {
        get { return val1; }
        set { val1 = value; }
    }

    private string val1d = "90deg";

    public string Val1d
    {
        get { return val1d; }
        set { val1d = value; }
    }

    private string val2 = "90deg";

    public string Val2
    {
        get { return val2; }
        set { val2 = value; }
    }

    private string val2d = "90deg";

    public string Val2d
    {
        get { return val2d; }
        set { val2d = value; }
    }


    private string colorCode = "#f1f1f1";

    public string ColorCode
    {
        get { return colorCode; }
        set { colorCode = value; }
    }

    private string progressColorDiesel = "#325ae7";

    public string ProgressColorDiesel
    {
        get { return progressColorDiesel; }
        set { progressColorDiesel = value; }
    }

    private string progressColorEssence = "#325ae7";

    public string ProgressColorEssence
    {
        get { return progressColorEssence; }
        set { progressColorEssence = value; }
    }

    private string colorCodeDiesel = "#f1f1f1";

    public string ColorCodeDiesel
    {
        get { return colorCodeDiesel; }
        set { colorCodeDiesel = value; }
    }
   

    private void CalculateActiveEssenceAngle(int TotalEssence)
    {
        //int TotalUser = 50;  

        if (TotalEssence == 0)
        {
            Val2 = "90deg";
            Val1 = "90deg";
            ColorCode = "#f1f1f1";
        }
        else if (TotalEssence < 50 && TotalEssence > 0)
        {
            double percentageOfWholeAngle = 360 * (Convert.ToDouble(TotalEssence) / 100);
            Val2 = (90 + percentageOfWholeAngle).ToString() + "deg";
            Val1 = "90deg";
            ColorCode = "#f1f1f1";
        }
        else if (TotalEssence > 50 && TotalEssence < 100)
        {
            double percentage = 360 * (Convert.ToDouble(TotalEssence) / 100);
            Val1 = (percentage - 270).ToString() + "deg";
            Val2 = "270deg";
            ColorCode = "#325ae7";
        }
        else if (TotalEssence == 50)
        {
            Val1 = "-90deg";
            Val2 = "270deg";
            ColorCode = "#325ae7";
        }
        else if (TotalEssence >= 100)
        {
            Val1 = "90deg";
            Val2 = "270deg";
            ColorCode = "#325ae7";
        }

        if (TotalEssence < 15)
        {
            ProgressTextEssence.Attributes.CssStyle.Add("background-color", "#fff !important");
            ProgressTextEssence.Attributes.CssStyle.Add("color", "#CF5760 !important");
            ProgressColorEssence = "#CF5760"; 
           
        }

        ProgressTextEssence.InnerText = TotalEssence + "%";

    }


    private void CalculateActiveDieselAngle(int TotalDiesel)
    {

        if (TotalDiesel == 0)
        {
            Val2d = "90deg";
            Val1d = "90deg";
            ColorCodeDiesel = "#f1f1f1";
        }
        else if (TotalDiesel < 50 && TotalDiesel > 0)
        {
            double percentageOfWholeAngle = 360 * (Convert.ToDouble(TotalDiesel) / 100);
            Val2d = (90 + percentageOfWholeAngle).ToString() + "deg";
            Val1d = "90deg";
            ColorCodeDiesel = "#f1f1f1";
        }
        else if (TotalDiesel > 50 && TotalDiesel < 100)
        {
            double percentage = 360 * (Convert.ToDouble(TotalDiesel) / 100);
            Val1d = (percentage - 270).ToString() + "deg";
            Val2d = "270deg";
            ColorCodeDiesel = "#325ae7";
        }
        else if (TotalDiesel == 50)
        {
            Val1d = "-90deg";
            Val2d = "270deg";
            ColorCodeDiesel = "#325ae7";
        }
        else if (TotalDiesel >= 100)
        {
            Val1d = "90deg";
            Val2d = "270deg";
            ColorCodeDiesel = "#325ae7";
        }

        if (TotalDiesel < 15)
        {
            ProgressTextDiesel.Attributes.CssStyle.Add("background-color", "#fff !important");
            ProgressTextDiesel.Attributes.CssStyle.Add("color", "#CF5760 !important");
            ProgressColorDiesel = "#CF5760"; 

        }

        ProgressTextDiesel.InnerText = TotalDiesel + "%";

    }
    /**********************************************************************************************************************/
    static List<List<string>> listCarburant = new List<List<string>>();

    protected void Page_Load(object sender, EventArgs e)
    {
      navbarToApprovisionnement.Attributes.CssStyle.Add("background-color","#325ae7");
      navbarToApprovisionnement.Attributes.CssStyle.Add("opacity", "1");
      navbarToApprovisionnement.Attributes.CssStyle.Add("color", "#fff");


        getStockStateEssence();
        getStockStateDiesel();


        string status = Request.QueryString["statusAdd"];

        if (status == "error")
        {
            showErrorText("Please try again!");
       
        }
        else if (status == "success")
        {
            showSuccessMessage();
    
        }

        string page = Request.QueryString["pg"];
        if (page == "historique")
        {
            statusProgressDiv.Attributes.CssStyle.Add("display", "none !important");
            ajoutCarburantDiv.Attributes.CssStyle.Add("display", "none !important");

        }
        else
        {
            historiqueAjoutDiv.Attributes.CssStyle.Add("display", "none !important");
        }
        if (!IsPostBack)
        {
            getUserPhoto();
            fillComboCarburantType();
        
        }

        gridBindAll();
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
        string request1 = "select id_carburant,type_carburant,prix_par_litre_achat from carburant";

        cnn = new SqlConnection(connetionString);
        cnn.Open();


        SqlCommand c1 = new SqlCommand(request1, cnn);
        SqlDataReader dr1 = c1.ExecuteReader();
        DropDownListCarburantType.Items.Clear();
        DropDownListCarburantType.Items.Add(" ");
        while (dr1.Read())
        {
            List<string> subList = new List<string>();
            subList.Add(dr1.GetInt32(0).ToString());
            subList.Add(dr1.GetString(1));
            subList.Add(dr1.GetInt32(2).ToString());
            listCarburant.Add(subList);

            DropDownListCarburantType.Items.Add(dr1.GetString(1));
        }



        cnn.Close();
    }
    protected void ButtonAjouterCarburant_Click(object sender, EventArgs e)
    {
        enregistrerAjout();
    }

    private void enregistrerAjout()
    {
        if (testEmpty() < 0)
        {
            try
            {


                String Timenow=DateTime.Now.ToString();
                int quantite=Int32.Parse(TextBoxQuantiteCarburant.Text);
                int idCarburant = Int32.Parse(listCarburant[DropDownListCarburantType.SelectedIndex - 1][0]);
                int cout = Int32.Parse(listCarburant[DropDownListCarburantType.SelectedIndex - 1][2]) * Int32.Parse(TextBoxQuantiteCarburant.Text);
                
                string query1 = String.Format("insert into approvisionnement(date_approvisionnemt,quantite,id_carburant,cout) values('{0}',{1},{2},{3})", Timenow, quantite, idCarburant,cout);

                    string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(connectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query1, con);
                    var result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Redirect("/FormApprovisionnement.aspx?statusAdd=success"); 

                }
                else
                {
                    Response.Redirect("/FormApprovisionnement.aspx?statusAdd=error");
                 }
            }
            catch (Exception e)
            {
                showErrorText(e.Message);}}
    }


    private int testEmpty()
    {
        if (TextBoxQuantiteCarburant.Text == "")
        {
            showErrorText("Veuillez selectionner le type de carburant");
            return 1;
        }
        if (DropDownListCarburantType.SelectedItem.ToString() == " ")
        {
            showErrorText("Veuillez saisir le prenom");
            return 1;

        }

  

        return -1;
    }

    private void showErrorText(string message)
    {
        errorMessageDiv.Attributes.CssStyle.Add("display","block");
        errorMessage.InnerHtml = message;
        successMessageDiv.Attributes.CssStyle.Add("display", "hidden");

    }

    private void showErrorText()
    {
        fillComboCarburantType();
        errorMessageDiv.Attributes.CssStyle.Add("display", "block");
        successMessageDiv.Attributes.CssStyle.Add("display", "hidden");

    }

    private void showSuccessMessage()
    { 
        successMessageDiv.Attributes.CssStyle.Add("display", "block");
        errorMessageDiv.Attributes.CssStyle.Add("display", "hidden");
    }

    private void getStockStateEssence()
    {
        
            int approvisionnement = 0;
            int distribution = 0;

            string connetionString;
            SqlConnection cnn;
            connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            string request1 = "select sum(A.quantite) from Carburant C,Approvisionnement A where A.id_carburant= C.id_carburant and C.type_carburant='essence' ";

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
                }

                /*----------Afficher distribution Simple*/
                string request2 = "select sum(DS.quantite)  from Distribution_simple DS  ,Carburant CA where CA.id_carburant=DS.id_carburant  and CA.type_carburant='Essence'";

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
                    catch (Exception errrrrr)
                    {
                    }
                }

                string request3 = "select sum(DA.quantite)  from Distribution_abonne DA  ,Carburant CA where CA.id_carburant=DA.id_carburant  and CA.type_carburant='Essence'";

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
                    }
                }

                int dispo = approvisionnement - distribution;
                quantiteEssence.InnerHtml = dispo  + " L";
                ProgressTextEssence.InnerText = "0%";
                int prct =  (int)(dispo* 100 / 5000);
                CalculateActiveEssenceAngle(prct);  

                if ((approvisionnement - distribution) < 1000)
                {

                    quantiteEssence.Attributes.Add("class", "data-status down d-inline ");
                }
                else
                {
                    quantiteEssence.Attributes.Add("class", "data-status up d-inline");

                }

            }
          
    }

 

    private void getStockStateDiesel()
    {

        int approvisionnement = 0;
        int distribution = 0;

        string connetionString;
        SqlConnection cnn;
        connetionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        
        string request1 = "select sum(A.quantite) from Carburant C,Approvisionnement A where A.id_carburant= C.id_carburant and C.type_carburant='diesel' ";

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
            catch (Exception errrrr)
            {
            }

            /*----------Afficher distribution Simple*/
            string request2 = "select sum(DS.quantite)  from Distribution_simple DS  ,Carburant CA where CA.id_carburant=DS.id_carburant  and CA.type_carburant='Diesel'";

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
                }
            }

            string request3 = "select sum(DA.quantite)  from Distribution_abonne DA  ,Carburant CA where CA.id_carburant=DA.id_carburant  and CA.type_carburant='Diesel'";

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

                }
            }

            int dispo = approvisionnement - distribution;
            quantiteDiesel.InnerHtml = dispo + " L";
            ProgressTextDiesel.InnerText = "0%";
            int prct = (int)(dispo * 100 / 5000);
            CalculateActiveDieselAngle(prct); 
           
            if ((approvisionnement - distribution) < 1000)
            {

                quantiteDiesel.Attributes.Add("class", "data-status down d-inline");
            }
            else
            {
                quantiteDiesel.Attributes.Add("class", "data-status up d-inline");

            }

        }

    }


    protected void Chart1_Load(object sender, EventArgs e)
    {
    }

    private void gridBind()
    {
        string query = String.Format("select id_approvisionnement,date_approvisionnemt,quantite,cout,type_carburant from Approvisionnement A,Carburant "+
            "C where A.id_carburant=C.id_carburant and A.date_approvisionnemt='{0}'", Calendar.Value.ToString());
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
        string resultsNumber = "";
        int i = 0;
        while (dr.Read())
        {
            i++;

        }
        resultsNumber = " Résultat(s) trouvé(s) : " + i;
        numberResultFound.InnerHtml = resultsNumber;

    }

    private void gridBindAll()
    {
        string query = String.Format("select id_approvisionnement,date_approvisionnemt,quantite,cout,type_carburant from Approvisionnement A,Carburant C where A.id_carburant=C.id_carburant;");
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
        counterResult.Attributes.Add("class", "mb-3");
        gridBind();
    }
}