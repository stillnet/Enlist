<cfsilent>
	<!---
	
	    Enlist - Volunteer Management Software
	    Copyright (C) 2011 GreatBizTools, LLC
	
	    This program is free software: you can redistribute it and/or modify
	    it under the terms of the GNU General Public License as published by
	    the Free Software Foundation, either version 3 of the License, or
	    (at your option) any later version.
	
	    This program is distributed in the hope that it will be useful,
	    but WITHOUT ANY WARRANTY; without even the implied warranty of
	    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	    GNU General Public License for more details.
	
	    You should have received a copy of the GNU General Public License
	    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	    
	    Linking this library statically or dynamically with other modules is
	    making a combined work based on this library.  Thus, the terms and
	    conditions of the GNU General Public License cover the whole
	    combination.
	
	$Id: wrapper.cfm 181 2011-06-16 04:56:27Z peterjfarrell $
	
	Notes:
	
	==========================================================
		Created by Devit Schizoper                          
		Created HomePages http://LoadFoo.starzonewebhost.com
		Created Day 01.12.2006                              
	==========================================================

	--->
	<cfimport prefix="view" taglib="/MachII/customtags/view" />
	<cfimport prefix="tags" taglib="/Enlist/customtags" />
</cfsilent>
<cfoutput>
<view:doctype />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<view:style href="/bootstrap/css/bootstrap.css" media="screen"/>
	<view:style href="south-street/jquery-ui-1.8.9.custom.css" media="screen"/>
	<view:link type="icon" href="/favicon.ico" />
	<view:asset package="jquery" outputType="inline" />
	<view:asset package="datatables" outputType="inline" />
</head>

<body>
	
<div class="container-fluid" style="margin: 12px auto;width:960px;">
  <div class="row">
	<div id="top" class="span12">
       #event.getArg("layout.header")#<br>
	</div>
  </div>
  <div class="row-fluid">
    <div class="span12">
      	<!--SubNav content-->
		#event.getArg('layout.subnav', "no subnav defined")#
		<!--Messages content-->
		<tags:displaymessage />
		<tags:displayerror />
		<!--Body content-->
		#event.getArg("layout.content")#
    </div>
  </div>
  </div class="row">
    <div id="footer" class="span12">
     <br><br> #event.getArg("layout.footer")#
    </div>
  </div>
</div>	

</body>
</html>
</cfoutput>
