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
<cfcomponent
	displayname="EmailNotificationListener"
	extends="MachII.framework.Listener"
	output="false"
	depends="emailService"
	hint="A simple listener example.">

	<!---
	PROPERTIES
	--->

	<!---
	CONFIGURATION / INITIALIZATION
	--->
	<cffunction name="configure" access="public" returntype="void" output="false"
		hint="Configures the listener.">
		
	</cffunction>
	
	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="sendNotification" output="false" access="public" returntype="void"
		hint="I am a boilerplate function">
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset getEmailService().send(
			to:event.getArg("user").getAltEmail(),
			from:getProperty("defaultEmail"),
			subject:"New User Notification",
			message: event.getArg("email.message")
		) />
	</cffunction>

	<cffunction name="buildI18NArgs" output="false" access="public" returntype="string"
		hint="I am a boilerplate function">
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<cfset var strResult = "" />
		<cftry>
			<cfset strResult = getEmailService().buildI18NArgs(event.getArg('user'),event.getArg('activity')) />
			<cfcatch><cflog application="true" text="Email Message was not able to be created."></cfcatch>
		</cftry>
		<cfreturn strResult />
	</cffunction>
</cfcomponent>