﻿<cfsilent>
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
	
	$Id: list.cfm 182 2011-06-16 06:09:00Z peterjfarrell $
	
	Notes:
	--->
	<cfimport prefix="view" taglib="/MachII/customtags/view" />
	<cfimport prefix="tags" taglib="/enlist/customtags" />
	<cfset copyToScope("${event.activities}") />
	

	<cfif event.getName() EQ "activity.doSearch">
		<view:message key="meta.title.activity.listSearch" var="variables.title" />
	<cfelse>
		<view:message key="meta.title.activity.list" var="variables.title" />
	</cfif>
	<!--- setting a variable name into the variables scope from i18n --->
	<view:message key="event.activity" var="variables.activityName"/>

	<view:meta type="title" content="#variables.title#" />
	
</cfsilent>
<cfoutput>

<h3>#variables.title#</h3>
<br><br>
<cfif variables.activities.recordcount gte 1>	
<tags:datatable>
<div class="content">	
	<div class="row">
		<div class="span12">
			<table id="chapters" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th><view:message key="form.activity.label.title" /></th>
						<th><view:message key="form.activity.label.number" /></th>
						<th><view:message key="form.activity.label.startdate" /></th>
						<th><view:message key="form.activity.label.enddate" /></th>
						<th><view:message key="form.activity.label.hours" /></th>
						<th><view:message key="form.activity.label.location" /></th>
						<th><view:message key="form.label.events" /></th>
						<th><view:message key="form.label.actions" /></th>
					</tr>
				</thead>
				<tbody id="chaptersList">
					<cfloop query="variables.activities">
						<tr>
							<td>#variables.activity.title#</td>
							<td>#variables.activity.numPeople#</td>
							<td>#variables.activity.startDate#</td>
							<td>#variables.activity.endDate#</td>
							<td>#variables.activity.pointHours#</td>
							<td>#variables.activity.location#</td>
							<!--- <td>#variables.activity.event().getName()#</td> --->
							<view:message key="links.edit" var="variables.edit" />
							<td><view:a event="activity.edit" p:id="#variables.activity.id#" label="#variables.edit#" /></td>
						</tr>	
					</cfloop>
				</tbody>
			</table>
		</div>
	</div>
	<div class="clear"><br><br></div>
</div>
</tags:datatable>
<cfelse>
<div><view:message key="message.noRecords" /></div>
</cfif>
</cfoutput>