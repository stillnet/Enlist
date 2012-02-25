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
	
	$Id: list.cfm 186 2011-08-20 21:22:32Z peterjfarrell $
	
	Notes:
	--->
	<cfimport prefix="view" taglib="/MachII/customtags/view" />
	<cfimport prefix="tags" taglib="/enlist/customtags" />
	<cfset copyToScope("${event.events}") />
	
	<cfif event.getName() EQ "event.doSearch">
		<cfset variables.title = "Event Search Results" />
	<cfelse>
		<cfset variables.title = "List Events" />
	</cfif>
	<view:meta type="title" content="#variables.title#" />
</cfsilent>

<cfoutput><h3>#variables.title#</h3></cfoutput>
<br><br>
<cfif events.RecordCount GT 0>
	
<tags:datatable>
<div class="content">	
	<div class="row">
		<div class="span12">
			<table id="chapters" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Status</th>
						<th>Event</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Location</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody id="chaptersList">
					<cfoutput query="events">
						<tr>
							<td>#status#</td>
							<td>#name#</td>
							<td>#dateFormat(startDate, "m/d/yyyy")#</td>
							<td>#dateFormat(endDate, "m/d/yyyy")#</td>
							<td>#location#</td>
							<td>
								<view:a event="event.edit" p:id="#id#">Edit</view:a> | 
								<view:a event="activity.doSearch" p:eventId="#id#">Activities</view:a>
							</td>
						</tr>	
					</cfoutput>
				</tbody>
			</table>
		</div>
	</div>
	<div class="clear"><br><br></div>
</div>
</tags:datatable>
<cfelse>
<div>No events found.</div>
</cfif>

