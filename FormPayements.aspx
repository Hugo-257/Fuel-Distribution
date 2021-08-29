<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormPayements.aspx.cs" Inherits="FormPayements" %>

<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com -->
<!-- Last Published: Fri Jul 31 2020 15:12:03 GMT+0000 (Coordinated Universal Time) -->
<html
data-wf-domain="artboard.webflow.io"
data-wf-page="5f09d679d3ce59c971f12288"
data-wf-site="5d2f26e24904ea2ed96c0fac"
data-wf-status="1">
<head>
    <meta charset="utf-8" />
    <title>Contacts</title>
    <meta content="Contacts" property="og:title" />
    <meta content="Contacts" property="twitter:title" />
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
    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac833eaaf515a25aafc1_fav%20(4).png"
        rel="shortcut icon"
        type="image/x-icon" />
    <link
        href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac97e6f35af9178a5454_clip%20(2).png"
        rel="apple-touch-icon" />

        <style type="text/css">

        .chzn-single,chzn-default{
            height:41px !important;
        }

            .chzn-single span {
                margin-top:10px;
            }

            #DropDownListAbonne_chzn,.chzn-drop,chzn-search input {
                width:100% !important;
            }
                    .w-webflow-badge{
         display:none !important;
        }


            .chzn-drop {
                width:100% !important;

            }
             .chzn-search input {
                width:100% !important;

            }
                  .hidden {
    display:none !important;
}

     
    </style>
    <link rel="stylesheet" href="Style/chosen.css" />
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
                    <div class="app-main-layout-wrapper header">
                        <div class="page-heading">
                            <h2>Achat de carburant</h2>
                            <p>Page pour l'enregistrement d'achat de carburant abonnés/anonymes</p>
                        </div>
                    </div>
                </div>
                <div class="app-main-layout-wrapper">
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
                    <div class="app-main-layout-content">
                                                                    <form id="form1" runat="server">

                        <div
                            data-duration-in="300"
                            data-duration-out="100"
                            class="w-tabs">
                            <div class="align-right w-tab-menu">
                                <a
                                    data-w-tab="Tab 1"
                                    class="switcher-tab left w-inline-block w-tab-link w--current">
                                    <div>Anonymes</div>
                                </a><a
                                    data-w-tab="Tab 4"
                                    class="switcher-tab w-inline-block w-tab-link ">
                                    <div>Abonnés</div>
                                </a>
                            </div>
                            <div class="chart-tab-content w-tab-content">

                                <div data-w-tab="Tab 1" class="w-tab-pane w--tab-active">
                                    <div class="section">
                                        <div class="flex row w-row">

                                            <div class="col w-col w-col-8">
                                                <div class="card">
                                                    <h4>Achats d'anonymes</h4>
                                                    <div
                                                        data-duration-in="300"
                                                        data-duration-out="100"
                                                        class="payment-method-tabs w-tabs">
                                                       
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
                                                                                        <asp:DropDownList ID="DropDownListCarburantTypeAnonyme" CssClass="input w-input" runat="server"></asp:DropDownList>
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
                                                                                        <asp:TextBox ID="TextBoxQuantiteCarburantAnonyme" CssClass="input w-input" runat="server"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <asp:Button ID="ButtonAchatCarburantAnonyme" data-wait="Please wait..." CssClass="button button-primary w-button " runat="server" Text="Enregistrer l' ajout" OnClick="ButtonAchatCarburantAnonyme_click"/>

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div data-w-tab="Tab 4" class="w-tab-pane ">
                                  <div class="section">
                                        <div class="flex row w-row">

                                            <div class="col w-col w-col-8">
                                                <div class="card">
                                                    <h4>Achat par Abonné</h4>
                                                    <div
                                                        data-duration-in="300"
                                                        data-duration-out="100"
                                                        class="payment-method-tabs w-tabs">
                                                      

                                                        <div class="payment-method-content w-tab-content">

                                                            <div
                                                                data-w-tab="Tab 1"
                                                                class="w-tab-pane w--tab-active">
                                                                <div class="w-form">

                                                                        <div class="form-group">

                                                                            <div class="form-group">
                                                                                                                                                                   
                                                                                    <div  class=" col padding w-col w-col-12 w-col-small-6 w-col-tiny-6 d-block" style="margin-bottom:15px">
                                                                                     <asp:Label ID="LabelBeneficiaire" CssClass="label" runat="server" Text="Bénéficiaire"></asp:Label>

                                                <asp:DropDownList ID="DropDownListAbonne" CssClass="chzn-select input input-w w-select" style="width:100%" runat="server"></asp:DropDownList>
                                               </div>

                                                                                <div class="row padding w-row">

                                                                                    <div  class="col padding w-col w-col-6 w-col-small-6 w-col-tiny-6 ">
                                                                                        <label for="name" class="label">
                                                                                            Type de carburant</label>
                                                                                        <asp:DropDownList ID="DropDownListCarburantTypeAbonne" CssClass="input w-input" runat="server"></asp:DropDownList>
                                                                                    </div>
                                                                                    <div  class=" col padding w-col w-col-6 w-col-small-6 w-col-tiny-6">
                                                                                        <label for="name" class="label">
                                                                                            Quantité à ajouter</label>
                                                                                        <asp:TextBox ID="TextBoxQuantiteCarburantAbonne" CssClass="input w-input" runat="server"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <asp:Button ID="ButtonAchatCarburantAbonne" data-wait="Please wait..." CssClass="button button-primary w-button " runat="server" Text="Enregistrer l' ajout" OnClick="ButtonAchatCarburantAbonne_click" />

                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                     
                                </div>


                            </div>

                        </div>

                        </form>
                    </div>
                    <div class="footer">
                        <div class="w-row">
                            <div class="w-col w-col-6">
                                <div class="hint">
                                    © Copyright Artboard. All rights reserved
                                </div>
                            </div>
                            <div class="footer-right w-col w-col-6">
                                <div class="hint">
                                    <a href="https://webflow.com/" class="footer-link">Powered by Webflow</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script
        src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5d2f26e24904ea2ed96c0fac"
        type="text/javascript"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script
        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/js/webflow.deb7a77dd.js"
        type="text/javascript"></script>

     <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>

    <!--[if lte IE 9
      ]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script
    ><![endif]-->
</body>
</html>
