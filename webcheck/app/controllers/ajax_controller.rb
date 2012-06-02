# Copyright (C) 2007, 2008 Corey Kump
# Copyright (C) 2007, 2008 Jason Sauppe
# Copyright (C) 2007, 2008 Andy Spencer <spenceal@rose-hulman.edu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class AjaxController < ApplicationController
	before_filter :admin_required
	def set()
		entity    = case params[:class]
								when 'Assignment'; Assignment.find(params[:id])
								when 'Problem';       Problem.find(params[:id])
								when 'Testcase';     Testcase.find(params[:id])
								end
		value  = entity.send("#{params[:attr]}=", params[:value])
		entity.save
		render :text => (value || "")
	end
end