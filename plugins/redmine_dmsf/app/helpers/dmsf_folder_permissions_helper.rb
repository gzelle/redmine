# encoding: utf-8
#
# Redmine plugin for Document Management System "Features"
#
# Copyright © 2011    Vít Jonáš <vit.jonas@gmail.com>
# Copyright © 2011-19 Karel Pičman <karel.picman@kontron.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

module DmsfFolderPermissionsHelper

  def users_checkboxes(users)
    s = ''
     users.each do |user|
      content = check_box_tag('permissions[user_ids][]', user.id, true, id: nil) + user.name
      s << content_tag(:label, content, id: "user_permission_ids_#{user.id}", class: 'inline')
     end
     s.html_safe
   end

  def render_principals_for_new_folder_permissions(users)
    principals_check_box_tags 'user_ids[]', users
  end

end