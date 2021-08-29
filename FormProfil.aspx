<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormProfil.aspx.cs" Inherits="FormProfil" %>

<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com -->
<!-- Last Published: Fri Jul 31 2020 15:12:03 GMT+0000 (Coordinated Universal Time) -->
<html
data-wf-domain="artboard.webflow.io"
data-wf-page="5d5049328e83095ac07527a5"
data-wf-site="5d2f26e24904ea2ed96c0fac"
data-wf-status="1">
<head>
    <meta charset="utf-8" />
    <title>User Profile</title>
    <meta content="User Profile" property="og:title" />
    <meta content="User Profile" property="twitter:title" />
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
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <style type="text/css">
                    .w-webflow-badge{
         display:none !important;
        }
        .modal {
            text-align: center;
        }

        @media screen and (min-width: 768px) {
            .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
            }
        }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }
    </style>
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
                            <h2>User Profile</h2>
                            <p>
                                Components for editing profile, friends list, public profile
                  and post view.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="app-main-layout-wrapper">
                    <div class="app-main-layout-content">
                        <div class="section">
                            <div class="row w-row">
                                <div class="col w-col w-col-8">
                                    <div class="card">
                                        <div class="profile-bg">
                                            <a href="#" class="edit-profile-bg w-inline-block" data-toggle="modal" data-target="#exampleModalLong"></a>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Edit Profil</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                             <asp:Label ID="LabelNom" CssClass="label" runat="server" Text="Nom "></asp:Label>
                                                <input id="inputNom" type="date" class="input input-w" runat="server" />
                                                <br />       
                                                  <asp:Label ID="LabelPrenom" CssClass="label" runat="server" Text="Prenom "></asp:Label>
                                                <input id="inputPrenom" type="date" class="input input-w" runat="server" />
                                                <br /> 
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Save changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-info">
                                            <div id="userAvatar" class="avatar big" runat="server"></div>
                                            <div class="profile-details">
                                                <h5 id="nomPersonnel" class="profile-name" runat="server"></h5>
                                                <div id="hashTagNomPersonnel" runat="server"></div>
                                            </div>
                                            <div class="profile-follow">
                                                <a
                                                    href="#"
                                                    class="button button-small button-primary w-button">Follow</a>
                                            </div>
                                        </div>
                                        <div
                                            data-duration-in="300"
                                            data-duration-out="100"
                                            class="w-tabs">
                                            <div class="tabs-content w-tab-content">
                                                <div
                                                    data-w-tab="Tab 1"
                                                    class="w-tab-pane w--tab-active"
                                                    id="w-tabs-1-data-w-pane-0"
                                                    role="tabpanel"
                                                    aria-labelledby="w-tabs-1-data-w-tab-0"
                                                    style="opacity: 1; transition: opacity 300ms ease 0s;">
                                                    <div class="row w-row">
                                                        <div class="col w-col w-col-6">
                                                            <div class="flex-center profile-about-row">
                                                                <div class="profile-info-heading">
                                                                    <strong>Phone</strong>
                                                                </div>
                                                                <div id="phoneNumber" runat="server"></div>
                                                            </div>
                                                            <div class="flex-center profile-about-row">
                                                                <div class="profile-info-heading">
                                                                    <strong>Email</strong>
                                                                </div>
                                                                <div id="emailPersonnel" runat="server"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col w-col w-col-6">
                                                            <div class="flex-center profile-about-row">
                                                                <div class="profile-info-heading">
                                                                    <strong>Date of Birth</strong>
                                                                </div>
                                                                <div id="dateNaissancePersonnel" runat="server"></div>
                                                            </div>
                                                            <div class="flex-center profile-about-row">
                                                                <div class="profile-info-heading">
                                                                    <strong>Location</strong>
                                                                </div>
                                                                <div id="locationPersonnel" runat="server"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="devider transparent"></div>
                                                    <div class="profile-info-heading">
                                                        <strong>Position</strong>
                                                    </div>
                                                    <p><strong id="positionPersonnel" runat="server"></strong></p>
                                                    <div class="devider transparent"></div>
                                                    <div class="profile-info-heading">
                                                        <strong>Bio</strong>
                                                    </div>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing
                              elit. Suspendisse varius enim in eros elementum
                              tristique. Duis cursus, mi quis viverra ornare,
                              eros dolor interdum nulla, ut commodo diam libero
                              vitae erat. Aenean faucibus nibh et justo cursus
                              id rutrum lorem imperdiet. Nunc ut sem vitae risus
                              tristique posuere.
                                                    </p>
                                                </div>
                                                <div
                                                    data-w-tab="Tab 3"
                                                    class="w-tab-pane"
                                                    id="w-tabs-1-data-w-pane-1"
                                                    role="tabpanel"
                                                    aria-labelledby="w-tabs-1-data-w-tab-1"
                                                    style="">
                                                    <div class="w-form">
                                                        <form
                                                            id="wf-form-profile"
                                                            name="wf-form-profile"
                                                            data-name="profile">
                                                            <div class="form-group">
                                                                <div class="avatar-container">
                                                                    <div class="upload-photo">
                                                                        <img
                                                                            src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5e96fbc0c475b704982d5d94_icons8-upload-to-the-cloud-100.png"
                                                                            width="25"
                                                                            alt=""
                                                                            class="upload-photo-icon" /><a href="#" class="link">Upload photo</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">
                                                                    First Name</label><input
                                                                        type="text"
                                                                        class="input w-input"
                                                                        maxlength="256"
                                                                        name="name-3"
                                                                        data-name="Name 3"
                                                                        placeholder="Mark"
                                                                        id="name-3" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">
                                                                    Last Name</label><input
                                                                        type="text"
                                                                        class="input w-input"
                                                                        maxlength="256"
                                                                        name="name-2"
                                                                        data-name="Name 2"
                                                                        placeholder="Roster"
                                                                        id="name-2" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">
                                                                    Date of Birth</label>
                                                                <div class="row padding w-row">
                                                                    <div
                                                                        class="
                                        col
                                        padding
                                        w-col
                                        w-col-4
                                        w-col-small-4
                                        w-col-tiny-tiny-stack
                                      ">
                                                                        <select
                                                                            id="field-4"
                                                                            name="field-4"
                                                                            data-name="Field 4"
                                                                            class="input w-select">
                                                                            <option value="day">Day</option>
                                                                            <option value="01">01</option>
                                                                            <option value="02">02</option>
                                                                            <option value="03">03</option>
                                                                            <option value="04">04</option>
                                                                            <option value="05">05</option>
                                                                            <option value="06">06</option>
                                                                            <option value="07">07</option>
                                                                            <option value="08">08</option>
                                                                            <option value="09">09</option>
                                                                            <option value="10">10</option>
                                                                            <option value="11">11</option>
                                                                            <option value="12">12</option>
                                                                            <option value="13">13</option>
                                                                            <option value="14">14</option>
                                                                            <option value="15">15</option>
                                                                            <option value="16">16</option>
                                                                            <option value="17">17</option>
                                                                            <option value="18">18</option>
                                                                            <option value="19">19</option>
                                                                            <option value="20">20</option>
                                                                            <option value="21">21</option>
                                                                            <option value="22">22</option>
                                                                            <option value="23">23</option>
                                                                            <option value="24">24</option>
                                                                            <option value="25">25</option>
                                                                            <option value="26">26</option>
                                                                            <option value="27">27</option>
                                                                            <option value="28">28</option>
                                                                            <option value="29">29</option>
                                                                            <option value="30">30</option>
                                                                            <option value="31">31</option>
                                                                        </select>
                                                                    </div>
                                                                    <div
                                                                        class="
                                        col
                                        padding
                                        w-col
                                        w-col-4
                                        w-col-small-4
                                        w-col-tiny-tiny-stack
                                      ">
                                                                        <select
                                                                            id="field-2"
                                                                            name="field-2"
                                                                            data-name="Field 2"
                                                                            class="input w-select">
                                                                            <option value="month">Month</option>
                                                                            <option value="01">01</option>
                                                                            <option value="02">02</option>
                                                                            <option value="03">03</option>
                                                                            <option value="04">04</option>
                                                                            <option value="05">05</option>
                                                                            <option value="06">06</option>
                                                                            <option value="07">07</option>
                                                                            <option value="08">08</option>
                                                                            <option value="09">09</option>
                                                                            <option value="10">10</option>
                                                                            <option value="11">11</option>
                                                                            <option value="12">12</option>
                                                                        </select>
                                                                    </div>
                                                                    <div
                                                                        class="
                                        col
                                        padding
                                        w-col
                                        w-col-4
                                        w-col-small-4
                                        w-col-tiny-tiny-stack
                                      ">
                                                                        <select
                                                                            id="field-3"
                                                                            name="field-3"
                                                                            data-name="Field 3"
                                                                            class="input w-select">
                                                                            <option value="year">Year</option>
                                                                            <option value="1990">1990</option>
                                                                            <option value="1991">1991</option>
                                                                            <option value="1992">1992</option>
                                                                            <option value="1993">1993</option>
                                                                            <option value="1994">1994</option>
                                                                            <option value="1995">1995</option>
                                                                            <option value="1996">1996</option>
                                                                            <option value="1997">1997</option>
                                                                            <option value="1998">1998</option>
                                                                            <option value="1999">1999</option>
                                                                            <option value="2000">2000</option>
                                                                            <option value="2001">2001</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">Gender</label><label class="radio w-radio"><input
                                                                    type="radio"
                                                                    data-name="Radio"
                                                                    id="radio"
                                                                    name="radio"
                                                                    value="Radio"
                                                                    class="
                                        w-form-formradioinput w-radio-input
                                      " /><span class="hint w-form-label">Male</span></label><label class="radio w-radio"><input
                                          type="radio"
                                          data-name="Radio"
                                          id="radio1"
                                          name="radio"
                                          value="Radio"
                                          class="
                                        w-form-formradioinput w-radio-input
                                      " /><span class="hint w-form-label">Female</span></label>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">
                                                                    Company Name</label><input
                                                                        type="text"
                                                                        class="input w-input"
                                                                        maxlength="256"
                                                                        name="name-2"
                                                                        data-name="Name 2"
                                                                        placeholder="Webflow Inc."
                                                                        id="Text1" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">
                                                                    Contact Email</label><input
                                                                        type="email"
                                                                        class="input w-input"
                                                                        maxlength="256"
                                                                        name="name-2"
                                                                        data-name="Name 2"
                                                                        placeholder="markroster@gmail.com"
                                                                        id="Email1" /><label for="name" class="label">Phone</label><input
                                                                            type="tel"
                                                                            class="input w-input"
                                                                            maxlength="256"
                                                                            name="name-2"
                                                                            data-name="Name 2"
                                                                            placeholder="+35278953712"
                                                                            id="Tel1" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">
                                                                    Location</label><input
                                                                        type="text"
                                                                        class="input w-input"
                                                                        maxlength="256"
                                                                        name="name-2"
                                                                        data-name="Name 2"
                                                                        placeholder="Ukraine, Kyiv"
                                                                        id="Text2" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name" class="label">Bio</label><textarea
                                                                    placeholder="Example Text"
                                                                    maxlength="5000"
                                                                    id="field-5"
                                                                    name="field-5"
                                                                    class="textarea w-input"></textarea>
                                                            </div>
                                                            <input
                                                                type="submit"
                                                                value="Save changes"
                                                                data-wait="Please wait..."
                                                                class="button button-primary w-button" />
                                                        </form>
                                                        <div class="success-message w-form-done">
                                                            <div>Saved!</div>
                                                        </div>
                                                        <div class="error-message w-form-fail">
                                                            <div>
                                                                Oops! Something went wrong while submitting
                                  the form.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    data-w-tab="Tab 4"
                                                    class="w-tab-pane"
                                                    id="w-tabs-1-data-w-pane-2"
                                                    role="tabpanel"
                                                    aria-labelledby="w-tabs-1-data-w-tab-2">
                                                    <div class="w-row">
                                                        <div class="w-col w-col-6">
                                                            <div class="friend-item">
                                                                <div class="friend-photo-container">
                                                                    <img
                                                                        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5d3e1c7273102c1b34c484bf_christopher-campbell-rDEOVtE7vOs-unsplash.png"
                                                                        width="50"
                                                                        alt=""
                                                                        class="friend-photo" />
                                                                    <div class="online-status off"></div>
                                                                </div>
                                                                <div>
                                                                    <div>Izabella Watson</div>
                                                                </div>
                                                            </div>
                                                            <div class="friend-item">
                                                                <div class="friend-photo-container">
                                                                    <img
                                                                        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5d3e1c61b1eba40b1d1e4e36_alex-blajan-QDPFWFCHes4-unsplash.png"
                                                                        width="50"
                                                                        alt=""
                                                                        class="friend-photo" />
                                                                    <div class="online-status on"></div>
                                                                </div>
                                                                <div>
                                                                    <div>Huan Trent</div>
                                                                </div>
                                                            </div>
                                                            <div class="friend-item">
                                                                <div class="friend-photo-container">
                                                                    <img
                                                                        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5d3e1c4e850abc7f8dc47373_gabriel-silverio-u3WmDyKGsrY-unsplash.png"
                                                                        width="50"
                                                                        alt=""
                                                                        class="friend-photo" />
                                                                    <div class="online-status"></div>
                                                                </div>
                                                                <div>
                                                                    <div>Eva Jonson</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="w-col w-col-6">
                                                            <div class="friend-item">
                                                                <div class="friend-photo-container">
                                                                    <img
                                                                        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5d3e1c30c89f6a9caf29137d_jared-sluyter-das6NrjLoM0-unsplash.png"
                                                                        width="50"
                                                                        alt=""
                                                                        class="friend-photo" />
                                                                    <div class="online-status on"></div>
                                                                </div>
                                                                <div>
                                                                    <div>Naton Rodson</div>
                                                                </div>
                                                            </div>
                                                            <div class="friend-item">
                                                                <div class="friend-photo-container">
                                                                    <img
                                                                        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5d3e1c20c89f6a7e69291364_ivana-cajina-_7LbC5J-jw4-unsplash.png"
                                                                        width="50"
                                                                        alt=""
                                                                        class="friend-photo" />
                                                                    <div class="online-status"></div>
                                                                </div>
                                                                <div>
                                                                    <div>Jim Cosper</div>
                                                                </div>
                                                            </div>
                                                            <div class="friend-item">
                                                                <div class="friend-photo-container">
                                                                    <img
                                                                        src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5d3e1c0973102c629bc483c4_michael-dam-mEZ3PoFGs_k-unsplash.png"
                                                                        width="50"
                                                                        alt=""
                                                                        class="friend-photo" />
                                                                    <div class="online-status off"></div>
                                                                </div>
                                                                <div>
                                                                    <div>Anny Sanders</div>
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
    <script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })
    </script>
</body>
</html>
