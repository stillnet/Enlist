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

$Id$
--->
<cfcomponent
	displayname="Application"
	extends="mach-ii"
	output="false">

	<!---
	PROPERTIES - APPLICATION SPECIFIC
	--->
	<cfset this.name = "enlist" />
	<cfset this.loginStorage = "session" />
	<cfset this.sessionManagement = true />
	<cfset this.setClientCookies = true />
	<cfset this.setDomainCookies = false />
	<cfset this.sessionTimeOut = CreateTimeSpan(0,0,30,0) />
	<cfset this.applicationTimeOut = CreateTimeSpan(1,0,0,0) />
	<cfset this.datasource = "enlist" />

	<!---
	OPENBD SPECIFIC
	--->
	<cfmapping logicalpath="/enlist" relativepath="../enlist" />
	<cfmapping logicalpath="/MachII" relativepath="../lib/MachII" />
	<cfmapping logicalpath="/coldspring" relativepath="../lib/coldspring" />

	<!---
	PROPERTIES - MACH-II SPECIFIC
	--->
	<cfset MACHII_CONFIG_PATH = ExpandPath("/enlist/config/mach-ii.xml") />
	<cfset MACHII_HANDLE_ONLOAD = false />

	<!---
		Most of the rest of the properties, methods, etc. have "intelligent defaults"
		set in MachII.mach-ii (which Application.cfc extends). The typical Mach-II
		properties such as MACHII_CONFIG_PATH, MACHII_APP_KEY, MACHII_CONFIG_MODE, etc.
		can be overridden here, as can the Application CFC methods to which you wish
		to add custom functionality.

		If you do override any of the methods, make sure to call super or copy/paste
		the contents from MachII.mach-ii into your overridden methods. This is particularly
		important with:
		* onApplicationStart(): this must call loadFramework()
		* onRequestStart(): this must call handleRequest()
	--->

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="onApplicationStart" access="public" returntype="void" output="false"
		hint="Overrides the Mach-II bootstrapper and then calls the super method.">

		<!--- Setup datasource and create db schema --->
		<cfset DatasourceCreate("enlist"
			, {
				drivername: "org.h2.Driver"
				, hoststring: "jdbc:h2:" & ExpandPath('./') & "/WEB-INF/bluedragon/h2databases/enlist;AUTO_SERVER=TRUE;IGNORECASE=false;MODE=MySQL"
				, initstring: "RUNSCRIPT FROM '#ExpandPath("../docs/sql")#/mysql_createDB.sql'\\;"
				, databasename: "enlist"
				, username: "enlist"
				, password: "enlist"
			}) />

		<cfset super.init() />
	</cffunction>

	<cffunction name="onRequestStart" access="public" returntype="void" output="true"
		hint="Overrides the Mach-II bootstrapper and then calls the super method.">
		<cfargument name="targetPage" type="string" required="true" />

		<cfif StructKeyExists(url, "reloadApp")>
			<cfset reloadConfig() />
		</cfif>

		<!--- TODO: remove before putting into production --->
		<cfif StructKeyExists(url, "recreateDb")>
			<cfquery datasource="enlist">
				drop all objects;
			</cfquery>
			<cfset datasourceDelete("enlist") />
			<cfset onApplicationStart() />
		</cfif>

		<cfset super.onRequestStart(arguments.targetPage) />
	</cffunction>

</cfcomponent>