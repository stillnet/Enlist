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
<cfif thisTag.ExecutionMode IS "start">
	<cfparam name="attributes.errors" type="struct" default="#request.event.getArg("errors", StructNew())#" />
	<cfif (not StructIsEmpty(attributes.errors))>
		<cfloop collection="#attributes.errors#" item="error">
			<p class="alert alert-error">
				<cfoutput>#attributes.errors[error]#</cfoutput>
			</p>
		</cfloop>
	</cfif>
</cfif>