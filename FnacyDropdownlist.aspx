﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FnacyDropdownlist.aspx.cs" Inherits="FnacyDropdownlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style>
		a img{border: none;}
		ol li{list-style: decimal outside;}
		div#container{width: 780px;margin: 0 auto;padding: 1em 0;}
		div.side-by-side{width: 100%;margin-bottom: 1em;}
		div.side-by-side > div{float: left;width: 50%;}
		div.side-by-side > div > em{margin-bottom: 10px;display: block;}
		.clearfix:after{content: "\0020";display: block;height: 0;clear: both;overflow: hidden;visibility: hidden;}
		
	</style>
	<link rel="stylesheet" href="Style/chosen.css" />
</head>
<body>
	<form runat="server" id="form1">
		<div id="container">
			<h2>Selected Value :
				<asp:Label runat="server" ID="lblSelectedValue" Style="color: red"></asp:Label></h2>
			<div class="side-by-side clearfix">

				<div>

					<asp:DropDownList placeholder="Choose a Country..." runat="server" ID="cboCountry" class="chzn-select" Style="width: 350px;">
						<asp:ListItem Text="" Value=""></asp:ListItem>
						<asp:ListItem Text="Ahemdabad" Value="Ahendabad"></asp:ListItem>
						<asp:ListItem Text="Bangalore" Value="Bangalore"></asp:ListItem>
						<asp:ListItem Text="Chennai" Value="Chennai"></asp:ListItem>
						<asp:ListItem Text="Aagra" Value="Aagra"></asp:ListItem>
						<asp:ListItem Text="Mumbai" Value="Mumbai"></asp:ListItem>
						<asp:ListItem Text="Hydrabad" Value="Hydrabad"></asp:ListItem>
						<asp:ListItem Text="Calcutta" Value="Calcutta"></asp:ListItem>
						<asp:ListItem Text="Patna" Value="Patna"></asp:ListItem>
						<asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
						<asp:ListItem Text="Noida" Value="Noida"></asp:ListItem>
						<asp:ListItem Text="Mangalore" Value="Mangalore"></asp:ListItem>
						<asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
						

					</asp:DropDownList><asp:Button runat="server" ID="btnSelect" Text="Get Selected" OnClick="btnSelect_Click" />

				</div>
			</div>

		</div>
		<script src="Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
	</form>
</body>
</html>
