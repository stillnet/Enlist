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

<!---
	Class: ActivityListener
	Listener for activities in the system. Activities are some thing that can be done
	by one or more people at a specific event. They have a date range, as well as a
	point value and location.

	Extends:
		MachII.framework.Listener

	Depends:
		- <enlist.model.event.activity.ActivityService>
		- <enlist.model.event.EventService>
		- SessionFacade
--->
<cfcomponent
	displayname="ActivityListener"
	extends="MachII.framework.Listener"
	output="false"
	depends="activityService,eventService,sessionFacade">

	<!---
	PROPERTIES
	--->

	<!---
	CONFIGURATION / INITIALIZATION
	--->
	<cffunction name="configure" access="public" returntype="void" output="false"
		hint="Configures the listener.">
		<!--- Put custom configuration for this listener here. --->
	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="getActivityVolunteerHistoryForUser" returntype="array" access="public" output="false">
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset var authentication = getSessionFacade().getProperty("authentication")/>
		<cfset var user = ""/>
		<cfset var result = arrayNew(1)/>

		<cfif authentication.hasUser() and authentication.getIsAuthenticated()>
			<cfset user = authentication.getUser()/>
			<cfset result = getActivityService().getActivityVolunteerHistoryByUser( user.getId() ) />
		</cfif>
		<cfreturn result/>
	</cffunction>

	<!---
		Function: getActivity
		Retrieves an activity, either by ID from the event, or a new, empty <Activity> bean.

		Visibility:
			public

		Parameters:
			event - A <MachII.framework.Event> object

		Returns:
			An instance of an <enlist.model.event.activity.Activity> bean
	--->
	<cffunction name="getActivity" access="public" returntype="enlist.model.event.activity.Activity" output="false">
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfset var bean = "" />

		<cfscript>
			if (not arguments.event.isArgDefined("activity")) {
				bean = getActivityService().getActivity(arguments.event.getArg("id", ""));
			} else {
				bean = arguments.event.getArg("activity");
			}
		</cfscript>

		<cfreturn bean />
	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="saveActivity" access="public" returntype="void" output="false"
		hint="Processes the activity forms (registration, admin new/edit activity) and saves the activity">
		<cfargument name="event" type="MachII.framework.Event" required="true" />

		<cfscript>
			var activity = arguments.event.getArg("activity");
			var errors = getActivityService().saveActivity(activity);

			if (not StructIsEmpty(errors)) {
				arguments.event.setArg("message", "Please correct the following errors:");
				arguments.event.setArg("errors", errors);
				redirectEvent("fail", "", true);
			} else {
				arguments.event.setArg("message", "Activity Saved");
				arguments.event.removeArg("activity");
				redirectEvent("pass", "", true);
			}
		</cfscript>
	</cffunction>

</cfcomponent>