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

Notes:
--->
<cfcomponent displayname="EventService" 
	output="false" 
	extends="enlist.model.BaseService">

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="EventService" output="false"
		hint="Initializes the service.">
		<cfset super.init(argumentcollection = arguments) />
		<cfreturn this />
	</cffunction>
	
	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="getEvent" access="public" returntype="enlist.model.event.Event" output="false">
		<cfargument name="eventID" type="string" required="false" default="">
		<cfreturn getGateway().read(arguments.eventID) />
	</cffunction> 
	
	<cffunction name="getEvents" access="public" returntype="array" output="false">
		<cfreturn getGateway().list() />
	</cffunction>
	
	<cffunction name="saveEvent" access="public" returntype="void" output="false">
		<cfargument name="event" type="enlist.model.event.Event" required="true">
		<cfset getGateway().save(arguments.event) />
	</cffunction> 

	<cffunction name="getEventsBySearch" access="public" returntype="array" output="false">
		<cfargument name="id" type="string" required="false" default="" />
		<cfargument name="name" type="string" required="false" default="" />
		<cfargument name="location" type="string" required="false" deafult="" />
		<cfargument name="startDate" type="string" required="false" default="" />
		<cfargument name="endDate" type="string" required="false" default="" />
		<cfargument name="status" type="string" required="false" default="" />
		<cfreturn getGateway().listByPropertyMap( arguments ) />
	</cffunction>
	
</cfcomponent>