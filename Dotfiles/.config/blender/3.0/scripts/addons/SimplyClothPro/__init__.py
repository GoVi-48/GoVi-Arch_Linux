'''
Copyright (C) 2020 Vjaceslav Tissen
vjaceslavt@gmail.com

Created by Vjaceslav Tissen

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
'''

bl_info ={
	"name" 		: "Simply-Cloth-Pro",
	"author"	: "Vjaceslav Tissen",
	"description":"Cloth Setup Helper for Blender",
	"version" : (1,2,2),
	"blender" : (2,90,0),
	"location" : "Right 3d View Panel -> Simply Cloth Pro",
	"category" : "Object",
	}

import bpy

from . import properties


def register():
	properties.register()
	pass

def unregister():
	properties.unregister()
	pass


if __name__ == "__main__":
	register()
