<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormContrat.aspx.cs" Inherits="FormContrat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />

    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/css/artboard.webflow.80ed7f466.min.css"
        rel="stylesheet"
        type="text/css" />
    <script
        src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
        type="text/javascript"></script>
    <script type="text/javascript">
        WebFont.load({ google: { families: ["DM Sans:regular,500,700"] } });
    </script>
    <!--[if lt IE 9
      ]><script
        src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"
        type="text/javascript"
      ></script
    ><![endif]-->
    <script type="text/javascript">
        !(function (o, c) {
            var n = c.documentElement,
              t = " w-mod-";
            (n.className += t + "js"),
              ("ontouchstart" in o ||
                (o.DocumentTouch && c instanceof DocumentTouch)) &&
                (n.className += t + "touch");
        })(window, document);
    </script>

    <script type="text/javascript">
        function AfficherAjouterContrat() {
            document.getElementById("ajoutContratDiv").style.display = "block";

        }

        function CacherAjouterContrat() {
            document.getElementById("ajoutContratDiv").style.display = "none";
            document.getElementById("alertSucces").style.display = "none ";
            document.getElementById("alertError").style.display = "none ";

        }
    </script>
    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac833eaaf515a25aafc1_fav%20(4).png"
        rel="shortcut icon"
        type="image/x-icon" />
    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac97e6f35af9178a5454_clip%20(2).png"
        rel="apple-touch-icon" />
    <!-- Custum css added -->

    <link href="Style.css" rel="stylesheet" />
    <title>Enregistrement</title>
    <style type="text/css">
        .w-select {
        }
        table input {
           padding:5px 20px;
            background-color:#456aeb;
            color:#fff;
            font-size: 1rem;
        }
        #form1 {
            height: 24px;
        }

        @media (min-width: 560px) {
            .input-w {
                width: 460px;
                height: 42px;
            }

            .search-select {
                width: 200px;
            }

            .search-btn {
                width: 100px;
            }

            ol li {
                list-style: decimal outside;
            }

            div#container {
                width: 780px;
                margin: 0 auto;
                padding: 1em 0;
            }

            div.side-by-side {
                width: 100%;
                margin-bottom: 1em;
            }

                div.side-by-side > div {
                    float: left;
                    width: 50%;
                }

                    div.side-by-side > div > em {
                        margin-bottom: 10px;
                        display: block;
                    }

            .clearfix:after {
                content: "\0020";
                display: block;
                height: 0;
                clear: both;
                overflow: hidden;
                visibility: hidden;
            }
        
        }
            .hidden {
    display:none !important;
}

        .chzn-single,chzn-default{
            height:41px !important;
        }

            .chzn-single span {
                margin-top:10px;
            }
               .w-webflow-badge{
         display:none !important;
        }

     
    </style>
    <link rel="stylesheet" href="Style/chosen.css" />
    <!--Search box style-->
    <link href="Assets/searchBox/css/main.css" rel="stylesheet" />
    <!-- Bootstrap js and min css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="body">
    <div class="app-layout">
                 <div class="app-nav-layout">
            <div
                data-collapse="medium"
                data-animation="over-left"
                data-duration="400"
                data-easing="ease-in-out"
                data-easing2="ease-in-out"
                role="banner"
                class="sidebar-navbar w-nav">
                <div class="sidebar-navbar-container w-container">
                    <div class="sidebar-navbar-heading">
                        <div class="sidebar-navbar-menu-button w-nav-button"></div>
                        <a href="/" class="sidebar-navbar-brand w-nav-brand">
                            <img
                                src="Assets/pictures/Logo2.PNG"
                                height="40"
                                alt=""
                                class="sidebar-navbar-brand-logo" /></a>
                    </div>
                    <nav role="navigation" class="sidebar-navbar-menu w-nav-menu">
                        <div class="sidebar-navbar-body">
                            <div class="sidebar-navbar-body-container">
                  <a id="navbarToApprovisionnement" href="/FormApprovisionnement.aspx?pg=add" class="sidebar-navbar-link link-projects w-nav-link w--current" runat="server">Approvisionnement<br />
                                </a>
                            <a
                                        id="navbarToContrat"
                                        href="/FormContrat.aspx?pg=add"
                                        class="sidebar-navbar-link link-signup w-dropdown-link " runat="server">Contrats</a>
                              
                                 
                     <a href="/FormPayements.aspx"  class="sidebar-navbar-link link-payment w-nav-link" style="max-width: 940px;">Payments</a>
                               <a
                                    id="location"
                                    href="/FormGestionPersonne.aspx?form=personnel"
                                    class="sidebar-navbar-link link-login w-dropdown-link" runat="server">Nouveau</a>
                                <a href="/FormProfil.aspx" class="sidebar-navbar-link link-profile w-nav-link" style="max-width: 940px;">User Profile</a>
                            </div>
                        </div>
                        <div class="sidebar-navbar-footer">
                        <a
                                    href="/FormLogout.aspx"
                                    class="sidebar-navbar-link link-logout w-nav-link">Logout</a>
                        </div>
                        <div class="sidebar-navbar-footer nav-toggle">
                            <a
                                data-w-id="c953acc7-394f-2eba-e671-0dd464d91c76"
                                href="#"
                                class="sidebar-navbar-toggle-button w-button"></a>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="app-navbar-container">
                <div class="app-navbar-menu">
                    <div class="app-navbar-menu-item">
                        <div data-delay="0" class="menu-dropdown w-dropdown">
                            <div class="menu-dropdown-toggle w-dropdown-toggle" style="width: 50px; height: 50px">
                                <asp:Image ID="Image1" CssClass="icon-profile" runat="server" />

                            </div>
                            <nav class="menu-dropdown-list w-dropdown-list">
                                <a
                                    href="/FormProfil.aspx"
                                    class="menu-dropdown-link w-inline-block">
                                    <div class="munu-dropdown-link-container">
                                        <img
                                            src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5e8a0ba64fbaead7c8227773_icons8-male-user-100%20(3).png"
                                            width="20"
                                            alt=""
                                            class="menu-dropdown-link-icon" />
                                        <div>Profile</div>
                                        <div class="hint grey-text">Public profile</div>
                                    </div>
                                </a>
                            <a href="/FormLogout.aspx" class="menu-dropdown-link w-inline-block">
                                    <div class="munu-dropdown-link-container">
                                        <img
                                            src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5e8a0c2aa6b2c1d212a8243c_icons8-logout-rounded-left-100%20(1).png"
                                            width="20"
                                            alt=""
                                            class="menu-dropdown-link-icon" />
                                        <div>Logout</div>
                                    </div>
                                </a>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="app-main-layout-container">
            <div class="app-main-layout-mask"></div>
            <div class="app-main-layout">
                <div class="app-main-layout-header">
                    <div class="app-main-layout-wrapper header pt-0">
                        <div class="page-heading with-button">
                            <h2>Gestion contrats</h2>
                        </div>
                        <div class="page-tabs-menu">
                            <a
                                id="link_to_ajout_contrat"
                                href="/FormContrat.aspx?pg=add"
                                class="page-tab-link add-icon" runat="server">Ajouter</a><a
                                    id="link_to_recherche_contrat"
                                    href="/FormContrat.aspx?pg=search"
                                    class="page-tab-link search-icon" runat="server">Recherche</a>
                        </div>
                    </div>
                </div>
                <div class="app-main-layout-wrapper" style="padding-top: 25px">
                    <div class="app-main-layout-content">
                        <div class="section">
                            <div class="row flex w-row">
                                <div class="col w-col w-col-12">
                                    <!-- Success Alert -->
                                    <div id="alertSucces" class="alert alert-success alert-dismissible fade show  hidden" runat="server">
                                        <strong>Success! </strong>
                                        <p class="d-inline" id="successMessage" runat="server"></p>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>
                                    <!-- Error Alert -->
                                    <div id="alertError" class="alert alert-danger alert-dismissible fade show  hidden" runat="server">
                                        <strong>Error!</strong>
                                        <p class="d-inline" id="errorMessage" runat="server"></p>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>



                                    <form id="form1" runat="server">

                                        <!--div  pour enregistrement de cotrats-->
                                        <div id="ajoutContratDiv" class="col w-col w-col-6  mt-3  hidden d-flex" runat="server">


                                            <div class="card">
                                                <h4 class="card-heading-small">Nouveau contrat</h4>
                                                <asp:Label ID="LabelBeneficiaire" CssClass="label" runat="server" Text="Bénéficiaire"></asp:Label>

                                                <asp:DropDownList ID="DropDownListAbonne" CssClass="chzn-select input input-w w-select" runat="server" OnSelectedIndexChanged="DropDownListAbonne_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                                <br />

                                                <asp:Label ID="LabelDateDebut" CssClass="label" runat="server" Text="Date début "></asp:Label>
                                                <input id="CalendarDebut" type="date" class="input input-w" runat="server" />
                                                <br />
                                                <asp:Label ID="LabelDateFin" CssClass="label" runat="server" Text="Date fin "></asp:Label>
                                                <input id="CalendarFin" type="date" class="input input-w" runat="server" />
                                                <br />
                                                <asp:Label ID="LabelPaiement" CssClass="label" runat="server" Text="Type de paiement "></asp:Label>
                                                <asp:DropDownList ID="DropDownListPaiement" CssClass="input w-select input-w" runat="server">
                                                </asp:DropDownList>

                                                <br />

                                                <asp:Button ID="ButtonENregistrerContrat" runat="server" CssClass="button button-primary button-group-item input-w" OnClick="ButtonENregistrerContrat_Click" Text="Enregistrer" />
                                                <button id="ButtonAnnulerEnregistrement" runat="server" type="button" class="button  button-group-item  input-w" onclick="CacherAjouterContrat();return false;" causesvalidation="False">Annuler</button>


                                            </div>
                                            <div id="infoBeneficiaire" runat="server" class="infoBeneficiaire card hidden" style="width: 400px; margin-left: 30px">
                                                <div class="portrait">
                                                    <asp:Image ID="infoImage" runat="server" />
                                                </div>
                                                <br />
                                                <p id="infoNom" class="mb-1 name" runat="server">NTORE HUGUES </p>
                                                <p id="infoAbonnemt" class="mb-1 " runat="server">Homme, 28ans </p>
                                                <p id="infoMail" class="mb-1" runat="server">Full Stack Developer</p>
                                                <p id="infoSexe" class="mb-1" runat="server"> Bay Area, San Francisco, CA</p>



                                            </div>

                                        </div>

                                        <!--div pour recherche et consulter contrat-->

                                        <!--div  pour enregistrement de cotrats-->
                                        <div id="rechercheContratDiv" class="col w-col w-col-6  mt-3  " runat="server">

                                            <div class="search-2 w-form">
                                                <asp:TextBox ID="TextBoxSearch" CssClass="input search-result w-input" runat="server" TextMode="Search" AutoPostBack="True"></asp:TextBox>
                                                <asp:Button ID="Button1" runat="server" CssClass="button button-primary w-button" Text="Search" OnClick="Button1_Click" />
                                            </div>

                                            <div id="resultsSearch" class="">
                                                <div id="counterResult" class="mb-3 hidden" runat="server">
                                                    <div
                                                        class="search-result-item mt-20 w-inline-block">
                                                        <h5 id="numberResultFound" runat="server"></h5>
                                                        <div>
                                                            <span>Resultats correspondant à la recherche "</span> <span id="motCleRecherche" runat="server"></span><span>" .</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:GridView ID="GridViewResultSearch" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="10" GridLines="Horizontal" Width="1000px" OnRowEditing="GridViewResultSearch_RowEditing" OnRowUpdating="GridViewResultSearch_RowUpdating" DataKeyNames="id_abonne" OnRowCancelingEdit="GridViewResultSearch_RowCancelingEdit">
                                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                                    <Columns>
                                                        <asp:BoundField DataField="emailID" HeaderText="Email" ReadOnly="True" />
                                                        <asp:BoundField DataField="date_debut" HeaderText="Date début" />
                                                        <asp:BoundField DataField="date_fin" HeaderText="Date fin" />
                                                        <asp:BoundField DataField="type_paiement" HeaderText="Type de paiement" />
                                                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                                </asp:GridView>
                                            </div>


                                        </div>

                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script
        src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.4.1.min.220afd743d.js?site=5d2f26e24904ea2ed96c0fac"
        type="text/javascript"></script>
    <script
        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/js/webflow.deb7a77dd.js"
        type="text/javascript"></script>
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>


    <!--[if lte IE 9
      ]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script
    ><![endif]-->
    <!--for the search box -->

</body>
</html>
