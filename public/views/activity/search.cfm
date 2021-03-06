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

$Id: search.cfm 181 2011-06-16 04:56:27Z peterjfarrell $

Notes:
--->
	<cfimport prefix="view" taglib="/MachII/customtags/view" />
	<cfimport prefix="form" taglib="/MachII/customtags/form" />
	<cfset copyToScope("${event.events}") />
	<view:message key="event.activity" var="variables.activityName"/>
	<view:message key="links.event.search" var="variables.string" arguments="#variables.activityName#"/>

	<view:meta type="title" content="#variables.string#" />

	<view:script>
		$(function() {
			$( "#startDate" ).datepicker();
			$( "#endDate" ).datepicker();
		});
	</view:script>
</cfsilent>
<cfoutput>	
	
<h3>#variables.string#</h3>
<form:form actionEvent="activity.doSearch">
	<table>
		<tr>
			<th><view:message key="form.activity.label.event" /></th>
			<td>
				<view:message key="form.activity.label.select" var="variables.labelSelect"/>
				<form:select path="eventId" items="#variables.events#">
					<form:option value="" label="#variables.labelSelect#" />
				</form:select>
			</td>
		</tr>
		<tr>
			<th><view:message key="form.activity.label.title" /></th>
			<td><form:input path="title" size="40" maxlength="200" /></td>
		</tr>
 		<tr>
			<th><view:message key="form.activity.label.description" /></th>
			<td><form:input path="description" size="40" maxlength="200" /></td>
		</tr>
		<tr>
			<th><view:message key="form.activity.label.number" /></th>
			<td><form:input path="numPeople" size="40" maxlength="4" /></td>
		</tr>
		<tr>
			<th><view:message key="form.activity.label.startdate" /></th>
			<td><form:input path="startDate" size="40" maxlength="10" /></td>
		</tr>
		<tr>
			<th><view:message key="form.activity.label.enddate" /></th>
			<td><form:input path="endDate" size="40" maxlength="10" /></td>
		</tr>
		<tr>
			<th><view:message key="form.activity.label.hours" /></th>
			<td><form:input path="pointHours" size="40" maxlength="4" /></td>
		</tr>
		<tr>
			<th><view:message key="form.activity.label.location" /></th>
			<td><form:input path="location" size="40" maxlength="20" /></td>
		</tr>
		<tr>
			<td></td>
			<view:message key="buttons.save" var="variables.save" arguments="#variables.activityName#" />
			<td><form:button type="submit" name="search" value="#variables.save#" class="btn-primary"/></td>
		</tr>
	</table>
</form:form>
</cfoutput>