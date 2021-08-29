<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormApprovisionnement.aspx.cs" Inherits="FormApprovisionnement" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>  
<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com -->
<!-- Last Published: Fri Jul 31 2020 15:12:03 GMT+0000 (Coordinated Universal Time) -->
<html
data-wf-domain="artboard.webflow.io"
data-wf-page="5e8759674f2c6f4e45842b89"
data-wf-site="5d2f26e24904ea2ed96c0fac"
data-wf-status="1">
<head>
    <meta charset="utf-8" />
    <title>Approvisionnement</title>

    <meta content="width=device-width, initial-scale=1" name="viewport" />
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
    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac833eaaf515a25aafc1_fav%20(4).png"
        rel="shortcut icon"
        type="image/x-icon" />
    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac97e6f35af9178a5454_clip%20(2).png"
        rel="apple-touch-icon" />
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .hidden {
            display: none !important;
        }

          .backgroundEssence {  
        background-image: linear-gradient(<%= Val1 %>, <%= ColorCode %> 50%, rgba(0, 0, 0, 0) 50%, rgba(0, 0, 0, 0)), linear-gradient(<%= Val2 %>, <%= ProgressColorEssence %>  50%, #f1f1f1 50%, #f1f1f1);  
         }  
  
              .backgroundDiesel {  
        background-image: linear-gradient(<%= Val1d %>, <%= ColorCodeDiesel %> 50%, rgba(0, 0, 0, 0) 50%, rgba(0, 0, 0, 0)), linear-gradient(<%= Val2d %>, <%= ProgressColorDiesel %>  50%, #f1f1f1 50%, #f1f1f1);  
    }  
  
    /* ------------------------------------- 
     * Bar container 
     * ------------------------------------- */  
    .circularprogress {  
        float: left;  
        margin-left: 30%;  
        margin-top: 5px;  
        position: relative;  
        width: 180px;  
        height: 170px;  
        border-radius: 50%;  
    }  
  
        /* ------------------------------------- 
         * Optional centered circle w/text 
         * ------------------------------------- */  
        .circularprogress .overlay {  
            position: absolute;  
            width: 130px;  
            height: 120px;  
            color: white;  
            background-color: #CF5760;  
            border-radius: 50%;  
            margin-left: 25px;  
            margin-top: 23px;  
            text-align: center;  
            line-height: 90px;  
            font-size: 35px;  
            padding-top: 20px;  
        } 
        #ProgressTextEssence{
        padding-top:15px;
        background-color:#fff;
        font-size:30px;
        color:#325ae7;
         } 
         #ProgressTextDiesel{
        padding-top:15px;
        background-color:#fff;
        font-size:30px;
        color:#325ae7;
         } 
        .pd-0{
        padding:15px 0px 0px 0px;
        }

        .d-inline{
        display:inline;
        }
        .w-webflow-badge{
         display:none !important;
        }

    </style>
    <link href="Style.css" rel="stylesheet" />
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
                            <a href="/signup" class="menu-dropdown-link w-inline-block">
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
                    <div class="app-main-layout-wrapper header">
                        <div class="page-heading">
                            <h2>Approvisionnement</h2>
                        </div>
                        <div class="page-tabs-menu">
                            <a
                                href="/FormApprovisionnement.aspx?pg=add"
                                class="page-tab-link traffic w--current">Ajout</a>
                            <a href="/FormApprovisionnement.aspx?pg=historique" class="page-tab-link revenue">Historique</a>
                        </div>
                    </div>
                </div>
                <div class="app-main-layout-wrapper">
                    <div class="app-main-layout-content">
                        <div class="page-tabs-content">
                         <form   id="Form1" runat="server">
                            <div id="statusProgressDiv" class="section"  runat="server">
                                <div class="flex row w-row">
                                    <div class="col w-col w-col-4">
                                        <div class="card text-center pd-0">
                                            <div class="card-heading center mb-2">
                                                <div class="caption mb-0">Quantité Essence SP98 (E5): <span id="quantiteEssence" class="d-inline" runat="server"></span></div>
                                            </div>
                                            <div class="key-price-value">
                                                 <div id="circularProgessEssence" class="circularprogress backgroundEssence" runat="server">  
                                                   <div id="ProgressTextEssence" class="overlay" runat="server"></div>  
                                                 </div>  
                                            </div>
                                            <div id="dataStatusEssence" class="data-status" runat="server">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col w-col w-col-4">
                                        <div class="card text-center pd-0">
                                            <div class="card-heading center mb-2">
                                                <div class="caption mb-0">QUANTITE DIESEL [B7]: <span id="quantiteDiesel"  class="d-inline" runat="server"></span></div>
                                            </div>
                                            <div class="key-price-value">
                                                  <div id="circularProgessDiesel" class="circularprogress backgroundDiesel" runat="server">  
                                                   <div id="ProgressTextDiesel" class="overlay" runat="server"></div>  
                                                 </div> 
                                            </div>
                                            <div id="dataStatusDiesel" class="data-status up" runat="server">
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="section">
                                  
                                <div id="ajoutCarburantDiv" class="flex row w-row"  runat="server">
                                    <div class="col w-col w-col-8">
                                        <div class="card">
                                            <h4>Ajouter du carburant au stock</h4>
                                            <div
                                                data-duration-in="300"
                                                data-duration-out="100"
                                                class="payment-method-tabs w-tabs">
                                                <div id="successMessageDiv" class="success-message w-form-done mt-3" runat="server">
                                                    <div>
                                                        Ajout du carburant enregistré avec succés.
                                                    </div>
                                                </div>
                                                <div id="errorMessageDiv" class="error-message w-form-fail  mt-3" runat="server">
                                                    <div>
                                                        Oops!Erreur lors de l'enregistrement.
                                    <p id="errorMessage" runat="server"></p>
                                                    </div>
                                                </div>

                                                <div class="payment-method-content w-tab-content">
                                                    <div
                                                        data-w-tab="Tab 1"
                                                        class="w-tab-pane w--tab-active">
                                                        <div class="w-form">

                                                                <div class="form-group">

                                                                    <div class="form-group">
                                                                        <div class="row padding w-row">
                                                                            <div
                                                                                class="
                                          col
                                          padding
                                          w-col
                                          w-col-6
                                          w-col-small-6
                                          w-col-tiny-6
                                        ">
                                                                                <label for="name" class="label">
                                                                                    Type de carburant</label>
                                                                                <asp:DropDownList ID="DropDownListCarburantType" CssClass="input w-input" runat="server"></asp:DropDownList>
                                                                            </div>
                                                                            <div
                                                                                class="
                                          col
                                          padding
                                          w-col
                                          w-col-6
                                          w-col-small-6
                                          w-col-tiny-6
                                        ">
                                                                                <label for="name" class="label">
                                                                                    Quantité à ajouter</label>
                                                                                <asp:TextBox ID="TextBoxQuantiteCarburant" CssClass="input w-input" runat="server"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <asp:Button ID="ButtonAjouterCarburant" data-wait="Please wait..." CssClass="button button-primary w-button " runat="server" Text="Enregistrer l' ajout" OnClick="ButtonAjouterCarburant_Click" PostBackUrl="~/FormApprovisionnement.aspx" />
                                                         

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                  <div id="historiqueAjoutDiv" class="flex row w-row"  runat="server">
                                    <div class="col w-col w-col-8">
                                             <h5 >Recherche par date:</h5>

                                         <div class="search-2 w-form">
                                                <input id="Calendar" type="date" class="input input-w" runat="server" />
                                                 <asp:Button ID="Button1" runat="server" CssClass="button button-primary w-button" Text="Search" OnClick="Button1_Click" />
                                            </div>

                                             <div id="counterResult" class="mb-3 hidden" runat="server">
                                                    <div
                                                        class="search-result-item mt-20 w-inline-block">
                                                        <h5 id="numberResultFound" runat="server"></h5>
                                                        <div>
                                                            <span>Resultats correspondant à la recherche.</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            <asp:GridView ID="GridViewResultSearch" runat="server" AutoGenerateColumns="False"  BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="10" GridLines="Horizontal" Width="1000px">
                                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                                <Columns>
                                                    <asp:BoundField DataField="id_approvisionnement" HeaderText="Id" />
                                                    <asp:BoundField DataField="type_carburant" HeaderText="Carburant" />
                                                    <asp:BoundField DataField="quantite" HeaderText="Quantité" />
                                                    <asp:BoundField DataField="cout" HeaderText="Coût" />
                                                    <asp:BoundField DataField="date_approvisionnemt" HeaderText="Date" />
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
                                      
                            </div>
                        </form>
                    </div>
                    </div>
                  
                </div>
            </div>
        </div>
    </div>
    <script
        src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.4.1.min.220afd743d.js?site=5d2f26e24904ea2ed96c0fac"
        type="text/javascript"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
    <script
        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/js/webflow.deb7a77dd.js"
        type="text/javascript"></script>
    <!--[if lte IE 9
      ]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script
    ><![endif]-->
</body>
</html>
