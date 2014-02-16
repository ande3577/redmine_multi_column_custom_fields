# Redmine Multi-Column Custom Fields Plugin

## Overview

Redmine Multi-Column Custom Fields is a plugin that aids in
formatting an issue containing custom fields by allowing a
custom field to span the entire row of the fields table.

Tested on Redmine 2.1, 2.2 and 2.3 (trunk as of 8/14/13).

Users of Redmine 2.0.x must use 2.0-stable branch.  Issue 
editing display support is only present on the 2.1 (master)
branch.


## Installation instructions

1. Install to plugins/redmine_multi_column_custom_fields
2. Run 
 
```
rake redmine:plugins:migrate RAILS_ENV=production
```

3. Restart server


## Usage

Adds a multi-column option to the custom field settings.  If 
this is set to true, the field will span both rows of the 
issue field (both for editing and for viewing).  For best
results, the multi-column fields should be the last fields
on the issue.

### Before

#### Editing 

![EditingBefore](img/edit_before.png "Editing Before")

#### Viewing

![ViewingBefore](img/view_before.png "Viewing Before")

### After

#### Editing 

![EditingAfter](img/edit_after.png "Editing After")

#### Viewing

![ViewingAfter](img/view_after.png "Viewing After")


## License

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
