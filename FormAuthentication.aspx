<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormAuthentication.aspx.cs" Inherits="FormAuthentication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta charset="utf-8" />
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <link
      href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/css/artboard.webflow.80ed7f466.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <script
      src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
      type="text/javascript"
    ></script>
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
      type="image/x-icon"
    />
    <link
      href="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/5f22ac97e6f35af9178a5454_clip%20(2).png"
      rel="apple-touch-icon"
    />
    <link href="Assets/css/StyleLogin2.css" rel="stylesheet" />
    <style >

        

.single-layout-col.right{
            background-color: #fff !important;
        }
        .mt-30 {
            margin-top:30px;
        }
    </style>
</head>
<body>
    <div class="single-layout">
      <div class="single-layout-row w-row">
        <div class="single-layout-col left w-col w-col-4">
          <div class="single-layout-left " style="margin-left:0px">
            <a href="/" class="single-layout-logo w-inline-block"
              ><img
                src="Assets/pictures/Logo2.PNG"
                width="100"
                alt=""
            /></a>
            <div>
              <h4 class="white">Bienvenu sur Fuelly!</h4>
              <p class="white text-large">
               Meilleure application pour la gestion de
              </p>
                <p  class="white text-large">   distribution de carburant.</p>
              <p class="white text-large mt-30" >Save your time and money!</p>
              <a href="#" class="button button-primary mt-20 w-button"
                >En savoir plus</a
              >
            </div>
          </div>
        </div>
        <div class="single-layout-col right w-col w-col-8">
         
          <div class="single-layout-right">
            <div class="single-layout-right-content">
              <div class="single-layout-logo-right">
                <a href="/" class="w-inline-block"
                  ><img
                    src="Assets/pictures/Logo3.png"
                    width="250"
                    alt=""
                /></a>
              </div>
              <h2 class="text-center mb-40">Sign in </h2>
                <asp:Label ID="Label1" CssClass="error-message invisible" runat="server" Text="Wrong UID or Password"></asp:Label>
                
                 <br />
                <br />
                <br />

                  
              <div class="w-form">
                <form id="form1" name="email-form" data-name="Email Form"  runat="server" >
                    
                    <asp:TextBox ID="TextBoxID"  CssClass="input w-input"
                    maxlength="256"  
                    placeholder="Enter your UID"        
                   runat="server"></asp:TextBox>
                  <asp:TextBox ID="TextBoxPassword"  CssClass="input w-input"
                    maxlength="256"  
                     placeholder="Enter your Password"       
                   runat="server" TextMode="Password"></asp:TextBox>
           
                    <label class="w-checkbox checkbox-field mb-40"
                    ><div
                      class="
                        w-checkbox-input w-checkbox-input--inputType-custom
                        checkbox
                      "
                    ></div>
                    <input
                      type="checkbox"
                      id="checkbox"
                      name="checkbox"
                      data-name="Checkbox"
                      required=""
                      style="
                        opacity: 0;
                        position: absolute;
                        z-index: -1;
                      " /><span class="hint w-form-label"
                      >Remember me<a
                        href="/"
                        target="_blank"
                        class="link"
                      ></a></span></label
                  >
    
                    <asp:Button ID="ButtonLogin" CssClass="button button-primary button-block w-button"  runat="server" 
                      Text="Login" OnClick="ButtonLogin_Click" />
                  <p class="text-center hint">
                    <a href="/forgot-password" class="link"
                      >Forgot your password?</a
                    >
                  </p>
                </form>
                <div class="success-message w-form-done">
                  <div>Thank you! Your submission has been received!</div>
                </div>
                <div class="error-message w-form-fail">
                  <div>
                    Oops! Something went wrong while submitting the form.
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
    ></script>
    <script
      src="https://uploads-ssl.webflow.com/5d2f26e24904ea2ed96c0fac/js/webflow.deb7a77dd.js"
      type="text/javascript"
    ></script>
    <!--[if lte IE 9
      ]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script
    ><![endif]-->
  
</body>
</html>
