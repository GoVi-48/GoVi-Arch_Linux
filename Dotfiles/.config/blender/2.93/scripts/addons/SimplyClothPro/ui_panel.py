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

import bpy
import mathutils
import os
import bpy.utils.previews

from . import ui_panel
from . import presets


from bpy.props import StringProperty,FloatProperty, BoolProperty, EnumProperty

custom_icons = None

class ClothPresetPanel(bpy.types.Panel):
	bl_label = "Simply Cloth Pro"
	bl_idname = "SIMPLYCLOTH_PT_layout"
	bl_space_type = 'VIEW_3D'
	bl_region_type = 'UI'
	bl_category = "Simply Cloth Pro"

	def checkCounter(self, context):
		count= -1
		for i, vs in enumerate(context.active_object.vertex_slider):
			count = i
		if count > -1:
			return True
		elif count == -1:
			return False
	def draw(self, context):
		layout = self.layout

		global custom_icons
		active_object = context.active_object
		########### SCULPT MODE ##########
		if context.mode == "SCULPT" and active_object is not None:
			box = layout.box()
			row = box.row(align=True)
			row.emboss="NONE"
			row.template_icon_view(context.scene, "brushes", scale=5, scale_popup=5.0, show_labels=True)
			row = box.row()
			if active_object.brushForceFalloff == True:
				text = "Radial"
				fallOffIcon = custom_icons["brush_radial"].icon_id
			elif active_object.brushForceFalloff == False:
				fallOffIcon = custom_icons["brush_plane"].icon_id
				text = "Plane"
			row.label(text="Force Falloff")
			# row = box.row()
			row.emboss = "NONE"
			row.prop(active_object, "brushForceFalloff", text=text, icon_value=fallOffIcon)

			iconMaskBrush = custom_icons["sculpt_mask"].icon_id

			iconMaskInvert = custom_icons["sculpt_mask_invert"].icon_id
			iconMaskClean = custom_icons["sculpt_mask_clean"].icon_id

			box = layout.box()
			row = box.row()
			row.label(text="Masking")
			row = box.row()
			op = row.operator("object.sculpt_brush_mask", text="Invert", icon_value=iconMaskInvert)
			op.mode = "INVERT"

			# row = box.row()
			op = row.operator("object.sculpt_brush_mask", text="Clean", icon_value=iconMaskClean)
			op.mode = "CLEANMASK"

			if context.scene.brushes == 'MASK':
				row = box.row()
				row.label(text="", icon="MOD_SMOOTH")
				row.prop(active_object, "hardness_mask_slider", text="Hardness")

			box = layout.box()
			row = box.row()
			row.label(text="Resolution")
			row = box.row()
			op = row.operator("object.sculpt_subdivide", text="Subdivide", icon="ADD")
			op.mode="SUB"
			op = row.operator("object.sculpt_subdivide", text="Un-Subdivide", icon="REMOVE")
			op.mode="UNSUB"
			row = box.row()
			row.label(text="Remesher")
			# row = box.row()
			row.emboss="NONE"
			row.prop(active_object, "remesher_face_count", text="Faces")
			row = box.row()
			row.operator("object.remesh_cloth", text="Remesh", icon="MOD_REMESH")

			box = layout.box()
			row = box.row()
			row.label(text="Display")
			row = box.row()
			op = row.operator("object.sculpt_shade",text="Smooth",icon="ANTIALIASED")
			op.mode = "SMOOTH"
			op = row.operator("object.sculpt_shade",text="Flat",icon="ALIASED")
			op.mode = "FLAT"
			row = box.row()
			row.prop(active_object, "show_wireframes", text="Wireframe", icon="MESH_GRID")
			row = box.row()
			row.prop(active_object, "face_orientation", text="Check Face Orientation", icon="NORMALS_FACE")

			box = layout.box()
			row = box.row()
			row.scale_y= 2
			op = row.operator("object.create_cloth", text="Done", icon="CHECKMARK")
			op.mode = "CLOTHFROMSCULPT"

			# row = box.row()
			# row.operator("bpy.data.brushes["Cloth"].cloth_deform_type = 'PUSH'", text="Done")
			
		if context.mode == "OBJECT":
			if active_object is None or "SimplyCloth" not in active_object.modifiers:

				# if "SimplyCloth" not in active_object.modifiers:
				box = layout.box()
				row = box.row()
				row.scale_y = 2
				row = box.row()
				# row.operator("object.load_template", text="Load Template", icon="MOD_CLOTH")
				row.label(text="Cloth Library", icon="MOD_CLOTH")
				if active_object:
					row.operator("object.remove_simply_mesh", text="", icon="TRASH")
				row = box.row()
				row.template_icon_view(context.scene, "templates", scale=4.5, scale_popup=4.5, show_labels=False)
			# row = box.row()

		if context.active_object is not None:
			active_object = context.active_object
			scene = context.scene

			if context.mode =="PAINT_WEIGHT":
				if "SimplyCloth" in context.active_object.modifiers:
					if self.checkCounter(context):
						box = layout.box()
						row = box.row()
						row.label(text="Pin Layers", icon="DOCUMENTS")
						row = box.row()
						row.template_list("SLIDER_UL_List", "", active_object, "vertex_slider", active_object,
										  "vertex_slider_index")
						row = box.row()
						row.scale_y = 2
						row.operator("object.editmode_toggle", text="Edit Mode", icon="EDITMODE_HLT")
				box = layout.box()
				row = box.row()
				row.scale_y = 2.0
				row.operator("paint.weight_paint_toggle", text="Object Mode", icon="SCREEN_BACK")

			if context.mode == "EDIT_MESH":
				if "SimplyCloth" in context.active_object.modifiers:
					box = layout.box()
					row = box.row()
					row.scale_y = 1.5
					if active_object.weight_pin_view:
						icon = "HIDE_OFF"
					else:
						icon = "HIDE_ON"
					row.prop(active_object, "weight_pin_view", text="Show Weights", icon=icon)
					row.prop(active_object, "show_wireframes", text="Wireframe", icon="MESH_GRID")
					row = box.row()
					row.prop(active_object, "face_orientation", text="Face Orientation", icon="NORMALS_FACE")
					row.operator("object.flip_normals", text="Flip Normals", icon="DECORATE_OVERRIDE")

					box = layout.box()
					row = box.row()
					row.label(text="Subdivisions", icon="VIEW_PERSPECTIVE")
					row = box.row()

					op = row.operator("object.subdivide_cloth", text="Subdivide", icon="ADD")
					op.mode = "SUBDIVIDE_EDIT"
					op = row.operator("object.subdivide_cloth", text="Un-Subdivide", icon="REMOVE")
					op.mode = "UNSUBDIVIDE_EDIT"

					box = layout.box()
					row = box.row()
					row.label(text="Density Paint", icon="STICKY_UVS_LOC")
					row = box.row()
					op = row.operator("object.density_paint", text="Paint", icon="BRUSH_DATA")
					op.mode = "FROM_EDIT"

					if active_object.density_paint:
						icon = "CHECKBOX_HLT"
					else:
						icon = "CHECKBOX_DEHLT"
					row.prop(active_object, "density_paint", text="Show", icon=icon)

					box = layout.box()
					row = box.row()
					row.label(text="Strengthen", icon="STRANDS")
					row = box.row()
					row.emboss = "NORMAL"
					op = row.operator("object.strengthen_selection", text="Add", icon="PLUS")
					op.mode = "ADD"
					op = row.operator("object.strengthen_selection", text="Remove", icon="REMOVE")
					op.mode = "CLEAR"

					box = layout.box()
					row = box.row()
					row.label(text="Pressure", icon="GIZMO")
					op = row.operator("object.pressure_assign_group", text="", icon="TRASH")
					op.mode = "REMOVE"
					row = box.row()
					row.emboss = "NORMAL"
					op = row.operator("object.pressure_assign_group", text="Release", icon="REMOVE")
					op.mode = "ASSIGN"
					op = row.operator("object.pressure_assign_group", text="Paint", icon="BRUSH_DATA")
					op.mode = "PAINT"

				else:
					box = layout.box()
					row = box.row()
					createClothIcon = custom_icons["createCloth"].icon_id
					row.scale_y = 1.5
					# row.label(text="Create Cloth first!", icon="ERROR")
					# op.mode = "CREATE_FROM_EDIT"
					op = row.operator("object.create_cloth", text="Selection to Cloth", icon_value=createClothIcon)
					op.mode = "SELECTCREATECLOTH"

			if context.mode == "OBJECT":

				box = layout.box()
				# box = layout.box()
				row = box.row()
				createClothIcon = custom_icons["createCloth"].icon_id
				sculptClothIcon = custom_icons["icon_sculpt_mode"].icon_id
				if "SimplyCloth" in context.active_object.modifiers:
					row.label(text="Cloth Finalization", icon="MATCLOTH")
					row = box.row()
					if active_object.cloth_status:
						icon = "HIDE_OFF"
					else:
						icon = "HIDE_ON"

					row.scale_y = 1.5
					op =row.operator("object.finish_cloth", text="Apply Cloth", icon_value=createClothIcon)
					op.mode = "APPLYCLOTH"
					row.prop(active_object, "cloth_status", text="", icon=icon)
					row.operator("object.remove_cloth", text="", icon="TRASH")
					row = box.row()
					# row.scale_y = 2
					op = row.operator("object.finish_cloth", text="Sculpt Cloth", icon_value=sculptClothIcon)
					op.mode = "SCULPTCLOTHEXTRA"
					# row.emboss="NONE"
					# row = box.row()
					op = row.operator("object.finish_cloth", text="Apply for Animation", icon="CHECKBOX_HLT")
					op.mode = "APPLYMODIFIERONLY"

					# Animation Play
					box = layout.box()
					row = box.row()
					row.label(text="Simulation", icon="RENDER_ANIMATION")
					op = row.operator("screen.animation_manager", text="", icon="TRASH")
					row = box.row()
					row.prop(active_object, "start_frame", text="Start")
					row.prop(active_object, "end_frame", text="End")
					op.mode = "DELETEBAKECACHE"
					row = box.row()
					op = row.operator("screen.animation_manager", text="Bake cache", icon="CAMERA_DATA")
					op.mode = "BAKEFROMCACHE"
					# row = box.row()
					op = row.operator("screen.animation_manager", text="Bake all ", icon="TIME")
					op.mode = "BAKEALLFROMCACHE"

					# row = box.row()
					if "SimplyCloth" in active_object.modifiers:
						obj = context.active_object
						row = box.row()
						mod = obj.modifiers["SimplyCloth"].settings.effector_weights
						row.label(icon="IMPORT")
						row.prop(mod, "gravity", text="Gravity")
						mod = obj.modifiers["SimplyCloth"].settings
						row.label(icon="PREVIEW_RANGE")
						row.prop(mod, "time_scale", text="Speed")
					# row = box.row()

					row = box.row()
					row.	scale_y=1.5
					screen = context.screen
					if screen.is_animation_playing:
						icon = custom_icons["pause_icon"].icon_id
						text = "Pause"
					else:
						icon = custom_icons["play_icon"].icon_id
						text = "Play"

					op = row.operator("screen.animation_manager", text=text, icon_value=icon)
					op.mode = "PLAY"
					op = row.operator("screen.animation_manager", text="Reset", icon_value=custom_icons["stop_icon"].icon_id)
					op.mode = "STOP"
				else:
					row.scale_y = 2
					op = row.operator("object.create_cloth", text="Create Cloth", icon_value=createClothIcon)
					op.mode = "CREATECLOTH"
					row = box.row()
					row.scale_y = 2
					op = row.operator("object.sculpt_brush", text="Sculpt Cloth", icon_value=sculptClothIcon)
					op.mode = "SCULPTCLOTH"

			if "Wind" not in bpy.data.objects:
				box = layout.box()
				row = box.row()
				row.scale_y = 1
				row.operator("scene.sc_add_wind", text="Add Wind", icon="FORCE_WIND")
			# 	row = box.row()
			if "Wind" in bpy.data.objects:
				box = layout.box()
				row = box.row()
				row.label(text="Wind", icon="FORCE_WIND")
				row.operator("scene.remove_wind", text="", icon="TRASH")
				row = box.row()
				row.prop(context.scene, "sc_wind_slider", text="Strength")
				row.prop(context.scene, "sc_wind_factor", text="Intensity")
				# row.prop(context.object['Wind'], "field.wind_factor", text="Factor")
				# bpy.context.object.field.wind_factor = 0.301282

			if "SimplyCloth" in active_object.modifiers:
				if context.mode == "OBJECT":
#CLOTH PRESETS
					# box = layout.box()
					# row = box.row()
					# row.scale_y = 2
					# # row.operator("object.load_template", text="Load Template", icon="MOD_CLOTH")
					# # row.label(text="Template", icon="MOD_CLOTH")
					# row = box.row()
					# row.template_icon_view(active_object, "templates", scale=4.5, scale_popup=7.0, show_labels=True)
					# row = box.row()

					box = layout.box()
					row = box.row()
					row.label(text="Presets", icon="PRESET")
					row.label(text="Library", icon="PRESET")
					row = box.row()

					row.template_icon_view(active_object, "presets",scale=4.5,scale_popup=7.0,show_labels=True)
					row.scale_y = 2
					# row.operator("object.load_template", text="Load Template", icon="MOD_CLOTH")
					# row.label(text="Cloth Library", icon="MOD_CLOTH")
					row.template_icon_view(context.scene, "templates", scale=4.5, scale_popup=3, show_labels=True)

					row = box.row()
					# row.alignment="CENTER"
					preset_name = active_object.preset_name
					template_name = context.scene.templates.title()
					row.label(text= preset_name)
					row.label(text= template_name)
					row = box.row()
					row.prop(active_object, "face_orientation", text="Check Face Orientation", icon="NORMALS_FACE")

# WIND
					# if "Wind" not in bpy.data.objects:
					# 	# box = layout.box()
					# 	row = box.row()
					# 	row.scale_y = 1
					# 	row.operator("scene.sc_add_wind", text="Add Wind", icon="FORCE_WIND")
					# # 	row = box.row()
					# if "Wind" in bpy.data.objects:
					# 	box = layout.box()
					# 	row = box.row()
					# 	row.label(text="Wind", icon="FORCE_WIND")
					# 	row.operator("scene.remove_wind", text="", icon="TRASH")
					# 	row = box.row()
					# 	row.prop(context.scene, "sc_wind_slider", text="Intensity")

# PIN GROUPS
					box = layout.box()
					row = box.row()
					row.label(text="Pin Group", icon="PINNED")
					row = box.row()
					row.operator("object.live_pinning", text="Pin Group - Live Paint ", icon="BRUSH_DATA")
					row.operator("object.clear_simply_pin", text="Delete Pin", icon="TRASH")
					# row = box.row()
					if self.checkCounter(context):
						box = layout.box()
						row = box.row()
						row.label(text="Pin Layers", icon="DOCUMENTS")
						row.prop(active_object, "updatePinLayerOnFly", text="Live Update", icon="CHECKMARK")
						row = box.row()
						row.template_list("SLIDER_UL_List", "", obj, "vertex_slider", obj, "vertex_slider_index")
#CLOTH PARAMETER
					box = layout.box()
					row = box.row()
					row.emboss = "NONE"
					row.label(text="Cloth Parameter", icon="MOD_HUE_SATURATION")
					# row.label(text="", icon="BLANK1")
					row.label(text="", icon="BLANK1")
					row.label(text="", icon="TRASH")
					row.emboss = "NORMAL"
					# row = box.row()
					row.operator("object.reset_parameters", text="Reset")

					row = box.row()
					row.label(text="", icon="MATCLOTH")
					row.prop(active_object, "quality_steps_slider", text="Quality Steps")
					row.label(text="", icon="MOD_BUILD")
					row.prop(active_object, "collision_quality_slider", text="Collision Quality")

					row = box.row()
					row.label(icon="MOD_VERTEX_WEIGHT")
					row.prop(active_object, "weight_slider", text="Weight")
					row.label(icon="STRANDS")
					row.prop(active_object, "stiffness_slider", slider=True, text="Stiffness")

					row = box.row()
					row.label(icon="FORCE_TURBULENCE")
					row.prop(active_object,"fold_slider",slider=True,text="Folds")

					row.label(icon="OUTLINER_DATA_SURFACE")
					row.prop(active_object, "wrinkle_slider", slider=True, text="Wrinkles")

					row = box.row()
					row.label(icon="FULLSCREEN_EXIT")
					row.prop(active_object, "shrink_slider", slider=True, text="Shrink")
					if "simplySmooth" in context.active_object.modifiers:
						mod = context.active_object.modifiers["simplySmooth"]
						row.label(icon="MATFLUID")
						row.prop(mod, "iterations", slider=True, text="Smoothing")

					
					row = box.row()
					row.label(text="", icon="STRANDS")
					row.prop(active_object, "strengthen_slider", slider=True, text="Strengthen Intensity")

					row = box.row()
					row.label(text="", icon="MOD_BOOLEAN")
					row.prop(active_object, "objectCollisionDistance_slider", slider=True, text="Object Collision Distance")
					row.emboss = "NORMAL"
					row = box.row()
					row.label(text="", icon="MOD_SKIN")
					row.prop(active_object, "self_collision", text="Self Collision")
					row.label(text="", icon="BLANK1")
					row.prop(active_object, "selfCollisionDistance_slider", slider=True, text="Distance")

					#ADVANCED SETTINGS
					box = layout.box()
					row = box.row()
					row.emboss = "NONE"
					row.scale_y = 1.5
					row.prop(active_object, "advanced_settings",text="Advanced Parameter", icon="TRIA_DOWN")

					if active_object.advanced_settings:
						if "SimplyCloth" in context.active_object.modifiers and context.mode == "OBJECT":
							row = box.row()
							row.prop(active_object, "cloth_sewing", text="Sewing",icon="RIGID_BODY")
							if active_object.cloth_sewing:
								mod = active_object.modifiers["SimplyCloth"].settings
								row.emboss = "NONE"
								row.prop(mod, "sewing_force_max", text="")
								row = box.row()
								# row.label(text=" ", icon="DRIVER_DISTANCE")
								row.emboss = "NORMAL"
								row.prop(active_object, "updateSewingWeldModifier", icon="AUTOMERGE_OFF", text="Merge Distance")
								row.emboss = "NONE"
								row.prop(active_object, "weld_slider", text="")

							#row = box.row()
							mod = context.active_object.modifiers["SimplyCloth"].settings
							row = box.row()
							row.prop(active_object, "internal_spring",icon="MOD_SCREW")
							mod = context.active_object.modifiers["SimplyCloth"].settings
							if mod.use_internal_springs:
								row.emboss="NONE"
								row.prop(active_object, "spring_intensity_slider", text="Intensity")
							row = box.row(align=True)

							row.prop(active_object, "pressure",icon="GIZMO")
							if active_object.pressure:
								op = row.operator("object.pressure_assign_group", text="Live Paint", icon="BRUSH_DATA")
								op.mode = "PAINT"
								op = row.operator("object.pressure_assign_group", text="", icon="TRASH")
								op.mode = "REMOVE"
							mod = context.active_object.modifiers["SimplyCloth"].settings
							if mod.use_pressure:
								row = box.row()
								row.emboss="NONE"
								row.prop(active_object, "pressure_intensity_slider", text="Intensity")
								row.emboss = "NONE"
								row.prop(active_object, "pressure_factor_slider", text="Factor")

					box = layout.box()
					row = box.row()
					row.label(text="Subdivision Modifier", icon="VIEW_PERSPECTIVE")
					row = box.row()
					row.prop(active_object, "baseSub_level",text="Level")
					row.prop(active_object, "show_wireframes", text="Wireframe", icon="MESH_GRID")
					box = layout.box()
					row = box.row()
					row.label(text="Density", icon="STICKY_UVS_LOC")
					row.label(text="", icon="BLANK1")
					op = row.operator("object.density_paint", text="Paint", icon="BRUSH_DATA")
					op.mode = "FROM_OBJECT"
					if "SimplyDensity" in context.active_object.modifiers:
						if active_object.density_paint:
							icon = "HIDE_OFF"
						else:
							icon = "HIDE_ON"
						row.prop(active_object, "density_paint", text="", icon=icon)

					# Collision
					collisionActive = False
					if "SimplyCollision" in context.active_object.modifiers:
						collisionActive = True
					else:
						collisionActive = False

					box = layout.box()
					row = box.row()
					row.label(text="Collision", icon="NLA_PUSHDOWN")
					if not collisionActive:
						row = box.row()
						op = row.operator("object.simply_collision_manager", text="Activate")
						op.mode = "ADDFROMCLOTH"

					if collisionActive:
						settings = context.object.collision
						row = box.row()
						row.prop(active_object, "friction_slider", slider=True, text="Friction")
						op = row.operator("object.simply_collision_manager", text="Remove Collision", icon="TRASH")
						op.mode = "REMOVE"
						row = box.row()
						row.prop(settings, "thickness_inner", text="Thickness Inner", slider=True)
						row.prop(settings, "thickness_outer", text="Thickness Outer", slider=True)
						row = box.row()
					if active_object.select_get():
						box = layout.box()
						row = box.row()
						row.label(text="Duplicate Mesh with new Topology (clean pin)", icon="ERROR")
						row = box.row()

						op = row.operator("object.poke_faces", text="Rotated Faces", icon="MOD_BEVEL")
						op.mode = "MID"

						op = row.operator("object.poke_faces", text="Poked Faces", icon="MOD_TRIANGULATE")
						op.mode = "MAX"
			if context.mode == "OBJECT" and "SimplyCloth" not in context.active_object.modifiers:
				# Collision
				settings = context.object.collision
				collisionActive = False
				if "SimplyCollision" in context.active_object.modifiers:
					collisionActive = True
				else:
					collisionActive = False
				box = layout.box()
				box.label(text="Collision", icon="NLA_PUSHDOWN")
				if not collisionActive:
					op = box.operator("object.simply_collision_manager", text="Activate",icon="OBJECT_HIDDEN")
					op.mode = "ADDNEW"
				if collisionActive:
					row = box.row()
					row.prop(active_object, "friction_slider", slider=True, text="Friction")
					op = row.operator("object.simply_collision_manager", text="Remove Collision", icon="TRASH")
					op.mode = "REMOVE"
					row = box.row()
					row.prop(settings, "thickness_inner", text="Thickness Inner", slider=True)
					row.prop(settings, "thickness_outer", text="Thickness Outer", slider=True)
		if context.mode == "EDIT_MESH":
			# row = box.row()
			if "SimplyCloth" in context.active_object.modifiers:
				box = layout.box()
				row = box.row()
				row.label(text="Pin Layers", icon="DOCUMENTS")
				op = row.operator("object.create_pin_layers", text="Refresh", icon="FILE_REFRESH")
				op.mode = "MERGEWEIGHTS"
				row = box.row()
				row.operator("object.live_pinning", text="Paint Pins ", icon="BRUSH_DATA")
				if self.checkCounter(context):
					row.prop(active_object, "updatePinLayerOnFly", text="Live Update", icon="CHECKMARK")
				obj = context.active_object
				layout = self.layout


				row = box.row()
				vertex_slider = context.active_object.vertex_slider
				row.scale_y = 1.5
				row.operator("object.add_pin_operator", icon="PLUS", text="Add Pin Layer")
				row.scale_y = 1.5
				row.operator("object.clear_simply_pin", text="Delete Pin", icon="TRASH")
				row = box.row()
				if self.checkCounter(context):
					row.template_list("SLIDER_UL_List", "", active_object, "vertex_slider", active_object,
									  "vertex_slider_index")
				# row = box.row()

				box = layout.box()
				row = box.row()
				row.label(text="Sewing Tool", icon="RIGID_BODY")
				# row = box.row()
				op = row.operator("object.create_sewing", text=" Mesh Bounds", icon="MOD_MESHDEFORM")
				op.mode = "SELECT_BOUNDS"
				row = box.row()
				row.scale_y = 1.5
				op = row.operator("object.create_sewing", text="Sew", icon="DECORATE_LIBRARY_OVERRIDE")
				op.mode = "CREATE_SEWING"
				op = row.operator("object.create_sewing", text="Remove Sewing", icon="TRASH")
				op.mode = "REMOVE_SEWING"

				box = layout.box()
				row = box.row()
				row.scale_y = 1.5
				op = row.operator("object.create_sewing",text="Done ", icon="LOOP_FORWARDS")
				op.mode = "DONE"
			else:
				box = layout.box()
				box.label(text="Finish Editing", icon="CHECKMARK")
				row = box.row()
				row.prop(active_object, "face_orientation", text="Face Orientation" ,icon="NORMALS_FACE")
				row.operator("object.flip_normals", text="Flip Normals", icon="DECORATE_OVERRIDE")
				row = box.row()
				# row.scale_y = 1.5
				row.label(text="Clean Sewing Holes", icon="SHADERFX")
				row = box.row()
				row.prop(bpy.context.active_object, "fillHoles_slider", text="Intensity")
				row = box.row()
				row.operator("mesh.remove_doubles",text="Merge by Distance")
				box = layout.box()
				row = box.row()
				if active_object.weight_pin_view:
					icon = "HIDE_OFF"
				else:
					icon = "HIDE_ON"
				row.prop(active_object, "weight_pin_view", text="Show Weights", icon=icon)
				row.prop(active_object, "show_wireframes", text="Wireframe", icon="MESH_GRID")
				row = box.row()
				row.prop(active_object, "face_orientation", text="Face Orientation", icon="NORMALS_FACE")
				row.operator("object.flip_normals", text="Flip Normals", icon="DECORATE_OVERRIDE")

				box = layout.box()
				row = box.row()
				row.label(text="Subdivisions", icon="VIEW_PERSPECTIVE")
				row = box.row()

				op = row.operator("object.subdivide_cloth", text="Subdivide", icon="ADD")
				op.mode = "SUBDIVIDE_EDIT"
				op = row.operator("object.subdivide_cloth", text="Un-Subdivide", icon="REMOVE")
				op.mode = "UNSUBDIVIDE_EDIT"
				box = layout.box()
				row = box.row()
				row.scale_y = 1.5
				op = row.operator("object.create_sewing",text="Done ", icon="LOOP_FORWARDS")
				op.mode = "DONE"
def update_cloth_sewing(self, context):
	obj = context.active_object
	if self.cloth_sewing:
		obj.modifiers['SimplyCloth'].settings.use_sewing_springs = True
		obj.modifiers['SimplyCloth'].settings.sewing_force_max = 2
	elif not self.cloth_sewing:
		obj.modifiers['SimplyCloth'].settings.use_sewing_springs = False
def update_cloth_status(self, context):
	obj = context.active_object
	if "SimplyCloth" in obj.modifiers:
		mod = obj.modifiers["SimplyCloth"]
		if self.cloth_status:
			mod.show_viewport = True
			mod.show_render = True
			bpy.context.object.display_type = 'TEXTURED'
		elif not self.cloth_status:
			mod.show_viewport = False
			mod.show_render = False
			bpy.context.object.display_type = 'WIRE'
def SmoothCloth(self, context):
		obj = context.active_object
		for mod in obj:
			if mod.name == "simplySmooth":
				mod.interations = self.smoothSlider
def update_self_collision(self, context):
	for mod in context.active_object.modifiers:
		if mod.type == "CLOTH":
			mod.collision_settings.use_self_collision = self.self_collision
			mod.collision_settings.self_distance_min = 0.001
def update_pressure(self, context):
	for mod in context.active_object.modifiers:
		if mod.type == "CLOTH":
			mod.settings.use_pressure = self.pressure
			mod.settings.uniform_pressure_force=2
			mod.settings.pressure_factor=2
def update_internal_spring(self, context):
	for mod in context.active_object.modifiers:
		if mod.type == "CLOTH":
			mod.settings.use_internal_springs = self.internal_spring
			mod.settings.internal_spring_max_length = 1
def update_wireframes_mode(self, context):

	obj = context.active_object
	if self.show_wireframes:
		context.space_data.overlay.show_wireframes = self.show_wireframes
		context.space_data.overlay.show_wireframes = True
	else:
		context.space_data.overlay.show_wireframes = self.show_wireframes
		context.space_data.overlay.show_wireframes = False
def update_density_paint(self, context):
	obj = context.active_object
	mod = obj.modifiers["SimplyDensity"]
	if "SimplyDensity" in obj.modifiers:
		bpy.ops.screen.frame_jump(1)
		if self.density_paint:
			mod.show_viewport = True
		elif not self.density_paint:
			mod.show_viewport = False
def slide_wrinkles(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.wrinkle_slider
	mod.settings.bending_stiffness = abs(((value/100)*9.99)-10)

def slide_wind_intensity(self, context):
	if "Wind" in bpy.data.objects:
		obj = bpy.data.objects["Wind"]
		value = self.sc_wind_slider
		obj.field.strength = abs(value*25)

def slide_wind_factor(self, context):
	obj = bpy.data.objects['Wind']
	value = self.sc_wind_factor
	obj.field.wind_factor = value

def slide_folds(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.fold_slider
	mod.settings.bending_damping = (7 / 100) * value
def slide_weight(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.weight_slider
	mod.settings.mass = value
def updateWeldDistanceValue(self, context):
	mod = context.active_object.modifiers["SimplyWeld"]
	value = self.weld_slider
	mod.merge_threshold = value
def slide_objectCollisionDistance(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.objectCollisionDistance_slider
	mod.collision_settings.distance_min = value
def slide_selfCollisionDistance(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.selfCollisionDistance_slider
	mod.collision_settings.self_distance_min = value
def slide_collision_quality(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.collision_quality_slider
	mod.collision_settings.collision_quality = value
def slide_friction(self, context):
	mod = context.active_object.modifiers["SimplyCollision"]
	value = self.friction_slider
	mod.settings.cloth_friction = (80/100)*value
def slide_quality_steps(self,context):
	mod = context.active_object.modifiers["SimplyCloth"]
	steps = self.quality_steps_slider
	mod.settings.quality = steps
def mergeByDistance(self, context):
	bpy.ops.mesh.remove_doubles()
def slide_fillHoles(self,context):
	vertSelect = False
	for vert in bpy.context.active_object.data.vertices:
		if vert.select:
			vertSelect = True
			break
		else:
			vertSelect = False
			break
	if vertSelect:
		bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.mesh.select_all(action='SELECT')
	else:
		bpy.ops.mesh.select_all(action='SELECT')

	value = self.fillHoles_slider
	bpy.ops.mesh.fill_holes()
	bpy.ops.mesh.fill_holes(sides=value)
def slide_mergeByDistance(self,context):
	vertSelect = False
	for vert in bpy.context.active_object.data.vertices:
		if vert.select:
			vertSelect = True
			break
		else:
			vertSelect = False
			break
	if vertSelect:
		bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.mesh.select_all(action='SELECT')
	else:
		bpy.ops.mesh.select_all(action='SELECT')

	value = self.mergeByDistance_slider
	bpy.ops.mesh.remove_doubles()
	bpy.ops.mesh.remove_doubles(threshold=value)
def update_sewing_weld(self, context):
	obj = context.active_object
	if obj.updateSewingWeldModifier==True:
		context.object.modifiers["SimplyWeld"].show_viewport = True
		context.object.modifiers["SimplyWeld"].show_render = True
		context.object.modifiers["SimplyWeld"].show_in_editmode = True
		context.object.updateSewingWeldModifier = True
	elif obj.updateSewingWeldModifier == False:
		context.object.modifiers["SimplyWeld"].show_viewport = False
		context.object.modifiers["SimplyWeld"].show_render = False
		context.object.modifiers["SimplyWeld"].show_in_editmode = False
		context.object.updateSewingWeldModifier = False
def slide_shrink(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.shrink_slider
	mod.settings.shrink_min = value
def slide_pressure_intensity(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	intensity = self.pressure_intensity_slider
	mod.settings.uniform_pressure_force= intensity
def slide_pressure_factor(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	factor = self.pressure_factor_slider
	mod.settings.pressure_factor = factor
def slide_spring_intensity(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	intensity = self.spring_intensity_slider
	mod.settings.internal_spring_max_length= intensity
def slide_stiffness(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.stiffness_slider

	mod.settings.tension_stiffness = (45/100)*value
	mod.settings.compression_stiffness= (45/100)*value
	mod.settings.shear_stiffness= (45/100)*value
def change_fold_accuracy(self, context):
	if self.fold_detail == "ROUGH":
		for mod in context.active_object.modifiers:
			if mod.type == "CLOTH" and mod.name == "SimplyCloth":
				mod.settings.bending_stiffness = 8
				mod.settings.bending_damping = 0

	if self.fold_detail == "REGULAR":
		for mod in context.active_object.modifiers:
			if mod.type == "CLOTH" and mod.name == "SimplyCloth":
				mod.settings.bending_stiffness = 1
				mod.settings.bending_damping = 0.75

	if self.fold_detail == "ACCURATE":
		for mod in context.active_object.modifiers:
			if mod.type == "CLOTH" and mod.name == "SimplyCloth":
				mod.settings.bending_stiffness = 0.01
				mod.settings.bending_damping = 1
def update_subdivision(self,context):
	for mod in context.active_object.modifiers:
		if mod.type == "SUBSURF" and mod.name == "SimplySubsurf":
			if self.resolution == "NO":
				mod.levels = 0
			elif self.resolution == "LOW":
				mod.levels = 1
			elif self.resolution == "MID":
				mod.levels = 3
			elif self.resolution == "HIGH":
				mod.levels = 4
	screen = bpy.ops.screen
	screen.frame_jump(1)
def update_frame_range(self, context):
	obj = context.active_object
	scene = context.scene
	start = self.start_frame
	end = self.end_frame

	if "SimplyCloth" in obj.modifiers:
		mod = obj.modifiers["SimplyCloth"]
		mod.point_cache.frame_start = start
		scene.frame_start = start
		mod.point_cache.frame_end = end
		scene.frame_end = end

def update_baseSub_level(self, context):
	obj = context.active_object
	mod = obj.modifiers["BaseSub"]
	level = self.baseSub_level
	mod.levels = level
	mod.render_levels = level
	bpy.ops.screen.frame_jump(1)
def update_face_orientation_view(self, context):
	obj = context.active_object
	if self.face_orientation:
		context.space_data.overlay.show_face_normals = True
		context.space_data.overlay.show_face_orientation = True
		context.space_data.overlay.normals_length = 0.01
	else:
		context.space_data.overlay.show_face_normals = False
		context.space_data.overlay.show_face_orientation = False
		context.space_data.overlay.normals_length = 0.01
def update_weight_pin_view(self, context):
	obj = context.active_object
	if self.weight_pin_view:
		if "SimplyPin" in context.active_object.vertex_groups:
			index = bpy.context.active_object.vertex_groups["SimplyPin"].index
			obj.vertex_groups.active_index = index
		bpy.context.space_data.overlay.show_weight = True
	else:
		if "SimplyPin" in context.active_object.vertex_groups:
			index = bpy.context.active_object.vertex_groups["SimplyPin"].index
			obj.vertex_groups.active_index = index
		bpy.context.space_data.overlay.show_weight = True
		bpy.context.space_data.overlay.show_weight = False
# def update_pin_slider_on_fly(self, context):
def changeWeightValue(self, context):
	bpy.context.scene.tool_settings.vertex_group_weight = context.active_object.weight_value
def updateStrengthenIntensity(self, context):
	mod = context.active_object.modifiers["SimplyCloth"]
	value = self.strengthen_slider
	mod.settings.bending_stiffness_max = (100 / 100) * value

def update_brushForceFalloff(self, context):
	if context.active_object.brushForceFalloff == True:
		bpy.data.brushes["Cloth"].cloth_force_falloff_type = 'RADIAL'
	elif context.active_object.brushForceFalloff == False:
		bpy.data.brushes["Cloth"].cloth_force_falloff_type = 'PLANE'
def updateMaskHardness(self, context):
	obj = context.active_object
	value = self.hardness_mask_slider
	bpy.data.brushes["Mask"].hardness = value

def registerIcon():
	import bpy.utils.previews
	global custom_icons

	custom_icons = bpy.utils.previews.new()
	addons_path = bpy.utils.user_resource('SCRIPTS', "addons")
	script_path = os.path.join(addons_path,"SimplyClothPro")
	icons_dir = os.path.join(script_path, "icons")
	#CLOTHS
	custom_icons.load("cloth_belt", os.path.join(icons_dir, "cloth_belt.png"), 'IMAGE')
	custom_icons.load("cloth_cap", os.path.join(icons_dir, "cloth_cap.png"), 'IMAGE')
	custom_icons.load("cloth_female_bra", os.path.join(icons_dir, "cloth_female_bra.png"), 'IMAGE')
	custom_icons.load("cloth_female_bra_2", os.path.join(icons_dir, "cloth_female_bra_2.png"), 'IMAGE')
	custom_icons.load("cloth_female_bra_3", os.path.join(icons_dir, "cloth_female_bra_3.png"), 'IMAGE')
	custom_icons.load("cloth_female_dress", os.path.join(icons_dir, "cloth_female_dress.png"), 'IMAGE')
	custom_icons.load("cloth_female_dress_long", os.path.join(icons_dir, "cloth_female_dress_long.png"), 'IMAGE')
	custom_icons.load("cloth_female_dress_long_2", os.path.join(icons_dir, "cloth_female_dress_long_2.png"), 'IMAGE')
	custom_icons.load("cloth_female_dress_style", os.path.join(icons_dir, "cloth_female_dress_style.png"), 'IMAGE')
	custom_icons.load("cloth_female_dress_very_long", os.path.join(icons_dir, "cloth_female_dress_very_long.png"), 'IMAGE')
	custom_icons.load("cloth_female_hot_pants", os.path.join(icons_dir, "cloth_female_hot_pants.png"), 'IMAGE')
	custom_icons.load("cloth_female_pants", os.path.join(icons_dir, "cloth_female_pants.png"), 'IMAGE')
	custom_icons.load("cloth_female_shirt", os.path.join(icons_dir, "cloth_female_shirt.png"), 'IMAGE')
	custom_icons.load("cloth_female_shirt_long", os.path.join(icons_dir, "cloth_female_shirt_long.png"), 'IMAGE')
	custom_icons.load("cloth_female_shorts", os.path.join(icons_dir, "cloth_female_shorts.png"), 'IMAGE')
	custom_icons.load("cloth_female_shorts_2", os.path.join(icons_dir, "cloth_female_shorts_2.png"), 'IMAGE')
	custom_icons.load("cloth_female_skirt", os.path.join(icons_dir, "cloth_female_skirt.png"), 'IMAGE')
	custom_icons.load("cloth_female_skirt_long", os.path.join(icons_dir, "cloth_female_skirt_long.png"), 'IMAGE')
	custom_icons.load("cloth_female_swim_suit", os.path.join(icons_dir, "cloth_female_swim_suit.png"), 'IMAGE')
	custom_icons.load("cloth_female_swim_suit_2", os.path.join(icons_dir, "cloth_female_swim_suit_2.png"), 'IMAGE')
	custom_icons.load("cloth_female_swim_suit_3", os.path.join(icons_dir, "cloth_female_swim_suit_3.png"), 'IMAGE')
	custom_icons.load("cloth_female_underware", os.path.join(icons_dir, "cloth_female_underware.png"), 'IMAGE')
	custom_icons.load("cloth_male_pants", os.path.join(icons_dir, "cloth_male_pants.png"), 'IMAGE')
	custom_icons.load("cloth_male_pullover", os.path.join(icons_dir, "cloth_male_pullover.png"), 'IMAGE')
	custom_icons.load("cloth_male_shirt", os.path.join(icons_dir, "cloth_male_shirt.png"), 'IMAGE')
	custom_icons.load("cloth_male_shirt_wide", os.path.join(icons_dir, "cloth_male_shirt_wide.png"), 'IMAGE')
	custom_icons.load("cloth_male_shorts", os.path.join(icons_dir, "cloth_male_shorts.png"), 'IMAGE')
	custom_icons.load("cloth_male_shorts_long", os.path.join(icons_dir, "cloth_male_shorts_long.png"), 'IMAGE')
	custom_icons.load("cloth_male_shorts_short", os.path.join(icons_dir, "cloth_male_shorts_short.png"), 'IMAGE')
	custom_icons.load("cloth_male_tank", os.path.join(icons_dir, "cloth_male_tank.png"), 'IMAGE')
	custom_icons.load("cloth_male_tank_2", os.path.join(icons_dir, "cloth_male_tank_2.png"), 'IMAGE')
	custom_icons.load("cloth_male_t-shirt", os.path.join(icons_dir, "cloth_male_t-shirt.png"), 'IMAGE')
	custom_icons.load("cloth_male_underware", os.path.join(icons_dir, "cloth_male_underware.png"), 'IMAGE')
	custom_icons.load("cloth_mask", os.path.join(icons_dir, "cloth_mask.png"), 'IMAGE')
	custom_icons.load("cloth_pillow", os.path.join(icons_dir, "cloth_pillow.png"), 'IMAGE')
	custom_icons.load("cloth_pillow_long", os.path.join(icons_dir, "cloth_pillow_long.png"), 'IMAGE')
	custom_icons.load("cloth_towel", os.path.join(icons_dir, "cloth_towel.png"), 'IMAGE')
	custom_icons.load("cloth_towel_round", os.path.join(icons_dir, "cloth_towel_round.png"), 'IMAGE')

	custom_icons.load("createCloth", os.path.join(icons_dir, "simply_cloth_helper_icon.png"), 'IMAGE')
	custom_icons.load("icon_sculpt_mode", os.path.join(icons_dir, "icon_sculpt_mode.png"), 'IMAGE')
	custom_icons.load("brush_radial", os.path.join(icons_dir, "brush_radial.png"), 'IMAGE')
	custom_icons.load("brush_plane", os.path.join(icons_dir, "brush_plane.png"), 'IMAGE')
	custom_icons.load("sculpt_mask", os.path.join(icons_dir, "sculpt_mask.png"), 'IMAGE')
	custom_icons.load("sculpt_mask_clean", os.path.join(icons_dir, "sculpt_mask_clean.png"), 'IMAGE')
	custom_icons.load("sculpt_mask_invert", os.path.join(icons_dir, "sculpt_mask_invert.png"), 'IMAGE')

	custom_icons.load("play_icon", os.path.join(icons_dir, "play_icon.png"), 'IMAGE')
	custom_icons.load("pause_icon", os.path.join(icons_dir, "pause_icon.png"), 'IMAGE')
	custom_icons.load("stop_icon", os.path.join(icons_dir, "stop_icon.png"), 'IMAGE')
	custom_icons.load("preset_cotton", os.path.join(icons_dir, "preset_cotton.png"), 'IMAGE')
	custom_icons.load("preset_denim", os.path.join(icons_dir, "preset_denim.png"), 'IMAGE')
	custom_icons.load("preset_leather", os.path.join(icons_dir, "preset_leather.png"), 'IMAGE')
	custom_icons.load("preset_rubber", os.path.join(icons_dir, "preset_rubber.png"), 'IMAGE')
	custom_icons.load("preset_silk", os.path.join(icons_dir, "preset_silk.png"), 'IMAGE')
	custom_icons.load("preset_wool", os.path.join(icons_dir, "preset_wool.png"), 'IMAGE')
	custom_icons.load("preset_elastic_smooth", os.path.join(icons_dir, "preset_elastic_smooth.png"), 'IMAGE')
	custom_icons.load("preset_crease", os.path.join(icons_dir, "preset_crease.png"), 'IMAGE')
	custom_icons.load("preset_pressure", os.path.join(icons_dir, "preset_pressure.png"), 'IMAGE')
	custom_icons.load("preset_shrink_pressure", os.path.join(icons_dir, "preset_shrink_pressure.png"), 'IMAGE')
	custom_icons.load("preset_stiff_smooth", os.path.join(icons_dir, "preset_stiff_smooth.png"), 'IMAGE')
	custom_icons.load("preset_heavy_silk", os.path.join(icons_dir, "preset_heavy_silk.png"), 'IMAGE')
	custom_icons.load("preset_spring", os.path.join(icons_dir, "preset_spring.png"), 'IMAGE')
	custom_icons.load("preset_stiff_paper", os.path.join(icons_dir, "preset_stiff_paper.png"), 'IMAGE')
	custom_icons.load("preset_crumple_paper", os.path.join(icons_dir, "preset_crumple_paper.png"), 'IMAGE')
	custom_icons.load("preset_standard", os.path.join(icons_dir, "preset_standard.png"), 'IMAGE')

	custom_icons.load("icon_brush_drag", os.path.join(icons_dir, "icon_brush_drag.png"), 'IMAGE')
	custom_icons.load("icon_brush_expand", os.path.join(icons_dir, "icon_brush_expand.png"), 'IMAGE')
	custom_icons.load("icon_brush_grab", os.path.join(icons_dir, "icon_brush_grab.png"), 'IMAGE')
	custom_icons.load("icon_brush_inflate", os.path.join(icons_dir, "icon_brush_inflate.png"), 'IMAGE')
	custom_icons.load("icon_brush_pinch", os.path.join(icons_dir, "icon_brush_pinch.png"), 'IMAGE')
	custom_icons.load("icon_brush_pinch_perpendicular", os.path.join(icons_dir, "icon_brush_pinch_perpendicular.png"), 'IMAGE')
	custom_icons.load("icon_brush_push", os.path.join(icons_dir, "icon_brush_push.png"), 'IMAGE')
	custom_icons.load("icon_brush_mask", os.path.join(icons_dir, "icon_brush_mask.png"), 'IMAGE')

	bpy.types.Object.presets = EnumProperty(default="STANDARD", items=(
	("COTTON", "Cotton", "Cotton Preset",custom_icons["preset_cotton"].icon_id,0),
	("DENIM", "Denim", "Denim Preset",custom_icons["preset_denim"].icon_id,1),
	("LEATHER", "Leather", "Leather Preset",custom_icons["preset_leather"].icon_id,2),
	("RUBBER", "Rubber", "Rubber Preset",custom_icons["preset_rubber"].icon_id,3),
	("SILK", "Silk", "Silk Preset",custom_icons["preset_silk"].icon_id,4),
	("WOOL", "Wool", "Wool Preset",custom_icons["preset_wool"].icon_id,5),
	("ELASTIC_SMOOTH", "Elastic Smooth", "Elastic Smooth Preset", custom_icons["preset_elastic_smooth"].icon_id, 6),
	("CREASE", "Crease", "Crease Preset",custom_icons["preset_crease"].icon_id,7),
	("PRESSURE", "Pressure", "Pressure Preset",custom_icons["preset_pressure"].icon_id,8),
	("SHRINK_PRESSURE", "Shrink Pressure", "Shrink Pressure Preset",custom_icons["preset_shrink_pressure"].icon_id,9),
	("STIFF_SMOOTH", "Stiff Smooth", "Stiff Smooth Preset",custom_icons["preset_stiff_smooth"].icon_id,10),
	("HEAVY_SILK", "Heavy Silk", "Heavy Silk Preset",custom_icons["preset_heavy_silk"].icon_id,11),
	("SPRING", "Spring", "Spring Preset",custom_icons["preset_spring"].icon_id,12),
	("STIFF_PAPER", "Stiff Paper", "Stiff Paper Preset",custom_icons["preset_stiff_paper"].icon_id,13),
	("CRUMPLE_PAPER", "Crumple Paper", "Crumple Paper Preset",custom_icons["preset_crumple_paper"].icon_id,14),
	("STANDARD", "Standard", "Standard Preset",custom_icons["preset_standard"].icon_id,15),
	),update=presets.set_preset)

	bpy.types.Scene.brushes = EnumProperty(default="DRAG", items=(
	("DRAG", "Drag", "Drag",custom_icons["icon_brush_drag"].icon_id,0),
	("PUSH", "Push", "Push", custom_icons["icon_brush_push"].icon_id, 1),
	("INFLATE", "Inflate", "Inflate", custom_icons["icon_brush_inflate"].icon_id, 2),
	("PINCH_POINT", "Pinch Point", "Pinch Point", custom_icons["icon_brush_pinch"].icon_id, 3),
	("PINCH_PERPENDICULAR", "Pinch Prependicular", "Pinch Prependicular",custom_icons["icon_brush_pinch_perpendicular"].icon_id, 4),
	("EXPAND", "Expand", "Expand", custom_icons["icon_brush_expand"].icon_id, 5),
	("GRAB", "Grab", "Grab",custom_icons["icon_brush_grab"].icon_id,6),
	("MASK", "Mask", "Mask",custom_icons["icon_brush_mask"].icon_id,7),
	),update=presets.set_brush)

	bpy.types.Scene.templates = EnumProperty(default="DRESS", items=(
	("FEMALEUNDERWARE", "Female Underware", "Female Underware",custom_icons["cloth_female_underware"].icon_id,0),
	("HOTPANTS", "Female Hot Pants", "Female  Hot Pants",custom_icons["cloth_female_hot_pants"].icon_id,1),
	("BRA", "Female Bra", "Female Bra",custom_icons["cloth_female_bra"].icon_id,2),
	("BRA2", "Female Bra 2", "Female Bra 2",custom_icons["cloth_female_bra_2"].icon_id,3),
	("BRA3", "Female Bra 3", "Female Bra 3",custom_icons["cloth_female_bra_3"].icon_id,4),
	("FEMALESHORT", "Female Shorts", "Female Shorts",custom_icons["cloth_female_shorts"].icon_id,5),
	("FEMALESHORT2", "Female Shorts 2", "Female Shorts 2",custom_icons["cloth_female_shorts_2"].icon_id,6),
	("FEMALESKIRT", "Female Skirt", "Female Skirt",custom_icons["cloth_female_skirt"].icon_id,7),
	("FEMALESKIRTLONG", "Female Skirt Long", "Female Skirt Long",custom_icons["cloth_female_skirt_long"].icon_id,8),
	("FEMALEPANTS", "Female Pants", "Female Pants", custom_icons["cloth_female_pants"].icon_id, 9),
	("FEMALESWIMSUIT", "Female Swim Suit", "Female Swim Suit",custom_icons["cloth_female_swim_suit"].icon_id,10),
	("FEMALESWIMSUIT2", "Female Swim Suit 2", "Female Swim Suit 2",custom_icons["cloth_female_swim_suit_2"].icon_id,11),
	("FEMALESWIMSUIT3", "Female Swim Suit 3", "Female Swim Suit 4",custom_icons["cloth_female_swim_suit_3"].icon_id,12),
	("DRESS", "Female Dress", "Female Dress",custom_icons["cloth_female_dress"].icon_id,13),
	("DRESSLONG", "Female Dress Long", "Female Dress Long",custom_icons["cloth_female_dress_long"].icon_id,14),
	("DRESSLONG2", "Female Dress Long 2", "Female Dress Long 2",custom_icons["cloth_female_dress_long_2"].icon_id,15),
	("DRESSVERYLONG", "Female Dress Very Long", "Female Dress Very Long",custom_icons["cloth_female_dress_very_long"].icon_id,16),
	("DRESSSTYLE", "Female Dress Style", "Female Dress Style",custom_icons["cloth_female_dress_style"].icon_id,17),
	("FEMALESHIRT", "Female Shirt", "Female Shirt",custom_icons["cloth_female_shirt"].icon_id,18),
	("FEMALESHIRTLONG", "Female Shirt Long", "Female Shirt Long",custom_icons["cloth_female_shirt_long"].icon_id,19),
	("MALETUNDERWARE", "Male Underware", "Male Underware",custom_icons["cloth_male_underware"].icon_id,20),
	("MALESSHORTS", "Male Shorts", "Male Shorts",custom_icons["cloth_male_shorts"].icon_id,21),
	("MALESSHORTSSHORT", "Male Shorts Short", "Male Shorts Short",custom_icons["cloth_male_shorts_short"].icon_id,22),
	("MALESSHORTSLONG", "Male Shorts Long", "Male Shorts Long",custom_icons["cloth_male_shorts_long"].icon_id,23),
	("MALEPANTS", "Male Pants", "Male Pants",custom_icons["cloth_male_pants"].icon_id,24),
	("MALETANK", "Male Tank", "Male Tank",custom_icons["cloth_male_tank"].icon_id,25),
	("MALETANK2", "Male Tank 2", "Male Tank 2",custom_icons["cloth_male_tank_2"].icon_id,26),
	("MALETSHIRT", "Male Tshirt", "Male Tshirt",custom_icons["cloth_male_t-shirt"].icon_id,27),
	("MALESHIRT", "Male Shirt", "Male Shirt",custom_icons["cloth_male_shirt"].icon_id,28),
	("MALESHIRTWIDE", "Male Shirt Wide", "Male Shirt Wide",custom_icons["cloth_male_shirt_wide"].icon_id,29),
	("MALEPULLOVER", "Male Pullover", "Male Pullover",custom_icons["cloth_male_pullover"].icon_id,30),
	("BELT", "Belt", "Belt",custom_icons["cloth_belt"].icon_id,31),
	("MASK", "Mask", "Mask",custom_icons["cloth_mask"].icon_id,32),
	("CAP", "Cap", "Cap",custom_icons["cloth_cap"].icon_id,33),
	("PILLOW", "Pillow", "Pillow",custom_icons["cloth_pillow"].icon_id,34),
	("PILLOWLONG", "Pillow Long", "Pillow Long",custom_icons["cloth_pillow_long"].icon_id,35),
	("TOWEL", "Towel", "Towel",custom_icons["cloth_towel"].icon_id,36),
	("TOWELROUND", "Towel Round", "Towel Round",custom_icons["cloth_towel_round"].icon_id,37),
	),update=presets.set_templates)

def unregisterIcon():
	global custom_icons

