using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FormPersonne : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (!IsPostBack)
        {
                     
            fillDropDOwnSexe();
            gridBind();
        }
    }

    private void fillDropDOwnSexe()
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("Homme");
        DropDownList1.Items.Add("Femme");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        enregistrerPersonne();
    }
    private void gridBind() 
    {
        string query = "select * from personne";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        da.Fill(ds);

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
    }
    private void enregistrerPersonne()
    {
        try
        {

            string query = String.Format("insert into personne(nom,prenom,sexe) values('{0}','{1}','{2}')", TextBox1.Text, TextBox2.Text, DropDownList1.SelectedItem.ToString());

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            var result = cmd.ExecuteNonQuery();
           
            gridBind();
            if (result > 0)
            {
                Response.Write("<script>alert('Added successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error adding.....')</script>");
            }

            con.Close();
        }catch(Exception e)
        {
            Response.Write(String.Format("<script>console.log({0})</script>",e.Message));

        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       

        GridViewRow row = GridView1.SelectedRow;

        // Display the first name from the selected row.
        // In this example, the third column (index 2) contains
        // the first name.
        TextBox1.Text = row.Cells[1].Text;
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        gridBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Int32.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
        string nom = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string prenom = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string sexe = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

        try
        {

            string query = String.Format("update personne set nom='{0}',prenom='{1}',sexe='{2}' where id_personne={3}", nom, prenom, sexe , id);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            var result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Write("<script>alert('Updated successfully')</script>");
                GridView1.EditIndex = -1;
                gridBind();
                
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

        }

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        gridBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Int32.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

        try
        {

            string query = String.Format("delete from personne where id_personne={0}",id);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            var result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Write("<script>alert('Deleted successfully')</script>");
                GridView1.EditIndex = -1;
                gridBind();

            }
            else
            {
                Response.Write("<script>alert('Error Deleting.....')</script>");
            }

            con.Close();
        }
        catch (Exception err)
        {
            Response.Write(String.Format("<script>console.log({0})</script>", err.Message));

        }
    }
}