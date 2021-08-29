<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormGestionPersonne.aspx.cs" Inherits="FormGestionPersonne" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

            .w-700 {
                width:650px;
            }
                .w-webflow-badge{
         display:none !important;
        }

        }

    </style>

    <!-- Bootstrap js and min css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
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
                            <h2>Enregistrer utilisateurs</h2>
                        </div>
                        <div class="page-tabs-menu">
                            <a
                                id="link_to_personnel_form"
                                href="/FormGestionPersonne.aspx?form=personnel"
                                class="page-tab-link  payment-details" runat="server">Personnel</a><a
                                    id="link_to_abonne_form"
                                    href="/FormGestionPersonne.aspx?form=abonne"
                                    class="page-tab-link subscription" runat="server">Abonné</a>
                        </div>
                    </div>
                </div>
                <div class="app-main-layout-wrapper header">
                    <div class="app-main-layout-content">
                        <div class="section">
                            <div class="row flex w-row">
                                <div class="col w-col w-col-12">
                                    <!-- Success Alert -->
                                    <div id="alertSucces" class="alert alert-success alert-dismissible fade show hidden" runat="server">
                                        <strong>Success! </strong>
                                        <p class="d-inline" id="successMessage" runat="server"></p>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>
                                    <!-- Error Alert -->
                                    <div id="alertError" class="alert alert-danger alert-dismissible fade show hidden" runat="server">
                                        <strong>Error!</strong>
                                        <p class="d-inline" id="errorMessage" runat="server"></p>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>

                                    <form id="form1" runat="server">
                                        <div id="card_personnel" class="col w-col w-col-6" runat="server">
                                            <div class="card w-700">
                                                <h4 class="card-heading-small">Nouveau personnel de service</h4>

                                            

                                                    <asp:Label ID="LabelNom" CssClass="label" runat="server" Text="Nom"></asp:Label>
        <asp:TextBox ID="TextBoxNom" CssClass="input w-input input-w" runat="server"></asp:TextBox>

                                                    <asp:Label ID="LabelPrenom" CssClass="label" runat="server" Text="Prenom"></asp:Label>
        <asp:TextBox ID="TextBoxPrenom" CssClass="input w-input input-w" runat="server"></asp:TextBox>

                                                    <asp:Label ID="LabelEmail" CssClass="label" runat="server" Text="Email"></asp:Label>
                                                    <asp:TextBox ID="TextBoxMail" CssClass="input w-input input-w" runat="server" TextMode="Email"></asp:TextBox>

                                                    <asp:Label ID="LabelPassowrd" CssClass="label" runat="server" Text="Password"></asp:Label>
                                                    <asp:TextBox ID="TextBoxPassword" CssClass="input w-input input-w " runat="server" TextMode="password"></asp:TextBox>
                                                    <asp:Label ID="Label2" CssClass="label" runat="server" Text="VerifyPassword"></asp:Label>
                                                    <asp:TextBox ID="TextBoxVerifyPassword" CssClass="input w-input input-w " runat="server" TextMode="Password"></asp:TextBox>

                                                    <asp:Label ID="Label3" CssClass="label" runat="server" Text="Sexe"></asp:Label>
                                                    <asp:DropDownList ID="DropDownListSexe" CssClass="input w-select input-w " runat="server">
        </asp:DropDownList>

                                                    <asp:Label ID="LabelCategorie" CssClass="label" runat="server" Text="Categorie"></asp:Label>
                                                  <asp:DropDownList ID="DropDownListCategorie" CssClass="input w-select input-w" runat="server">
        </asp:DropDownList>

                                                
                                                    <asp:Label ID="Label1" CssClass="label" runat="server" Text="Photo"></asp:Label>
                                                    <br />
                                                    <asp:FileUpload ID="FileUploadPicPersonnel"  CssClass="input w-select input-w pl-0" runat="server" />



                                                    <br />

                                                    <asp:Button ID="Button1" runat="server" CssClass="button button-primary button-group-item input-w" OnClick="Button1_Click" Text="Enregistrer" />
                                                    <br />
                                                    <br />
                                                </div>


                                      

                                        </div>
                                        <div id="rechercheContraDiv" class="col w-col w-col-6    " runat="server">
                                            </div>

                                        <div id="card_abonne" class="col w-col w-col-6 " runat="server">
                                            <div class="card w-700">
                                                <h4 class="card-heading-small">Nouvel abonné</h4>

                                                <div>


                                                    <asp:Label ID="LabelNomAbonne" CssClass="label" runat="server" Text="Nom"></asp:Label>
        <asp:TextBox ID="TextBoxNomAbonne" CssClass="input w-input input-w" runat="server"></asp:TextBox>

                                                    <asp:Label ID="LabelPrenomAbonne" CssClass="label" runat="server" Text="Prenom"></asp:Label>
        <asp:TextBox ID="TextBoxPrenomAbonne" CssClass="input w-input input-w" runat="server"></asp:TextBox>

                                                    <asp:Label ID="LabelEmailAbonne" CssClass="label" runat="server" Text="Email"></asp:Label>
                                                    <asp:TextBox ID="TextBoxEmailAbonne" CssClass="input w-input  input-w" runat="server" TextMode="Email"></asp:TextBox>

                                                    <asp:Label ID="LabelPasswordABonne" CssClass="label" runat="server" Text="Password"></asp:Label>
                                                    <asp:TextBox ID="TextBoxPasswordAbonne" CssClass="input w-input input-w" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:Label ID="LabelVerifyPasswordAbonne" CssClass="label" runat="server" Text="VerifyPassword"></asp:Label>
                                                    <asp:TextBox ID="TextBoxVerifyPasswordAbonne" CssClass="input w-input input-w" runat="server" TextMode="Password"></asp:TextBox>

                                                    <asp:Label ID="LabelSexeAbonne" CssClass="label" runat="server" Text="Sexe"></asp:Label>
        <asp:DropDownList ID="DropDownListSexeAbonne" CssClass="input w-select input-w" runat="server">
        </asp:DropDownList>

                                                    <asp:Label ID="LabelPhoto" CssClass="label" runat="server" Text="Photo"></asp:Label>
                                                    <br />
                                                    <asp:FileUpload CssClass="input w-select input-w pl-0"  ID="FileUploadPicAbonne" runat="server" />

                                                    <asp:Button ID="ButtonEnregistrerAbonne" runat="server" CssClass="button button-primary button-group-item input-w" OnClick="ButtonEnregistrerAbonne_Click" Text="Enregistrer" />
                                                    <br />
                                                    <br />
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
        </div>
    </div>

    <script
        src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.4.1.min.220afd743d.js?site=5d2f26e24904ea2ed96c0fac"
        type="text/javascript"></script>
    <script
        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/js/webflow.deb7a77dd.js"
        type="text/javascript"></script>
    <!--[if lte IE 9
      ]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script
    ><![endif]-->

</body>
</html>
