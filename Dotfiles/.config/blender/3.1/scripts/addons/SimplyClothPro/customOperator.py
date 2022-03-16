# Copyright (C) 2020 Vjaceslav Tissen
# vjaceslavt@gmail.com
# Created by Vjaceslav Tissen
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
# '''

import bpy
import bmesh
import os

from bpy.props import IntProperty,EnumProperty,FloatProperty, StringProperty

class SimplyCollisionManager(bpy.types.Operator):
	bl_idname = "object.simply_collision_manager"
	bl_label = "Add Collision to selected objects"
	bl_description = "Here you can assign collision and friction to objects or to Cloth Meshes"
	mode: StringProperty(default="ADD")
	def addCollision(self, context):
		sel = context.selected_objects
		for obj in sel:
			if "SimplyCloth" not in obj.modifiers:
				obj.name = "simply_coll"
			obj.modifiers.new("SimplyCollision", "COLLISION")
			obj.collision.use_culling = False
			obj.collision.thickness_outer = 0.01
			obj.collision.thickness_inner = 0.01

	def addCollisionToCloth(self, context):
		sel = context.selected_objects
		for obj in sel:
			obj.modifiers.new("SimplyCollision", "COLLISION")
			obj.collision.use_culling = False
			obj.collision.thickness_outer = 0.01
			obj.collision.thickness_inner = 0.01
	def removeCollision(self, context):
		for obj in bpy.context.selected_objects:
			if "SimplyCollision" in obj.modifiers:
				mod = obj.modifiers["SimplyCollision"]
				obj.modifiers.remove(mod)
	def execute(self, context):
		if self.mode == "ADDNEW":
			self.addCollision(context)
		if self.mode == "ADDFROMCLOTH":
			self.addCollisionToCloth(context)
		if self.mode == "REMOVE":
			self.removeCollision(context)
		return {'FINISHED'}
class AnimationManager(bpy.types.Operator):
	bl_idname = "screen.animation_manager"
	bl_label = "Play Cloth Simulation"
	bl_description = "This is the Animation Manager. This is where you set the gravity, speed. Here you can also decide if the Cloth animation is baked from the cache to allow a smooth presentation (degree recommended for animations)"
	icon = "PLAY"

	mode: StringProperty(default="PAUSE")
	def checkScreenIsPlaying(self, context):
		screen = bpy.context.screen
		obj = context.active_object
		if not screen.is_animation_playing:
			self.icon_value ="PLAY"
			if "BaseSub" in context.active_object.modifiers:
				bpy.context.object.modifiers["BaseSub"].show_viewport = True
				bpy.context.object.modifiers["BaseSub"].show_in_editmode = True
			# print("ANIMATION RUNNING!")
			for mod in obj.modifiers:
				if mod.name == "qualityView" or mod.name =="simplySmooth":
					mod.show_in_editmode = False
					mod.show_viewport = True
		else:
			self.icon_value ="PAUSE"
			obj.show_wireframes = False
			bpy.ops.object.shade_smooth()
			if "BaseSub" in context.active_object.modifiers:
				bpy.context.object.modifiers["BaseSub"].show_viewport = True
				bpy.context.object.modifiers["BaseSub"].show_in_editmode = True
			for mod in obj.modifiers:
				if mod.name == "qualityView" or mod.name =="simplySmooth":
					mod.show_in_editmode = False
					mod.show_viewport = False
	def stop(self, context):
		screen = bpy.ops.screen
		screen.frame_jump(1)
		screen.animation_cancel()
		if "BaseSub" in context.active_object.modifiers:
			bpy.context.object.modifiers["BaseSub"].show_viewport = True
			bpy.context.object.modifiers["BaseSub"].show_in_editmode = True

	def bakeFromCache(self,context):
		override = {'scene': bpy.context.scene,'point_cache': bpy.context.active_object.modifiers['SimplyCloth'].point_cache}
		bpy.ops.ptcache.bake_from_cache(override)
	def bakeAllFromCache(self,context):
		override = {'scene': bpy.context.scene,'point_cache': bpy.context.active_object.modifiers['SimplyCloth'].point_cache, 'bake' : True}
		bpy.ops.ptcache.bake_all(override)
	def deleteBake(self,context):
		override = {'scene': bpy.context.scene,'point_cache': bpy.context.active_object.modifiers['SimplyCloth'].point_cache}
		bpy.ops.ptcache.free_bake(override)

	def execute(self, context):
		bl_label = "Pause Cloth Simulation"
		screen = bpy.ops.screen
		if self.mode == "BAKEFROMCACHE":
			self.bakeFromCache(context)
		if self.mode == "BAKEALLFROMCACHE":
			self.bakeAllFromCache(context)
		if self.mode == "DELETEBAKECACHE":
			self.deleteBake(context)
		if self.mode == "PLAY":
			screen.animation_play()
		if self.mode == "STOP":
			self.stop(context)
		self.checkScreenIsPlaying(context)
		return {'FINISHED'}

class createSewing(bpy.types.Operator):
	bl_idname = "object.create_sewing"
	bl_label = "Create Sew"
	# bl_description = "Sewing Tool. This is used to create or remove seams on the mesh. Very helpful for clothes that have sewn seams"
	mode: StringProperty()
	value: IntProperty()
	def selectBoundaries(self,context):
		bpy.ops.mesh.select_mode(use_extend=False, use_expand=False, type='EDGE')
		bpy.ops.mesh.select_non_manifold()
		bpy.ops.mesh.select_non_manifold(extend=False, use_wire=False, use_boundary=True, use_multi_face=False,use_non_contiguous=False, use_verts=False)

	def removeSewing(self, context):
		bpy.ops.mesh.select_mode(use_extend=False, use_expand=False, type='EDGE')
		bpy.ops.mesh.select_non_manifold(extend=False, use_wire=True, use_boundary=False,use_multi_face=False,use_non_contiguous=False,use_verts=False)
		bpy.ops.mesh.delete(type='EDGE')

	def createSewing(self, context):
		bpy.ops.mesh.select_mode(use_extend=False, use_expand=False, type='EDGE')
		bpy.ops.mesh.bridge_edge_loops()
		bpy.ops.mesh.delete(type='ONLY_FACE')
		context.object.cloth_sewing = True

	def createFineSewing(self, context):
		bpy.ops.mesh.select_mode(use_extend=False, use_expand=False, type='EDGE')
		bpy.ops.mesh.subdivide()
		bpy.ops.mesh.bridge_edge_loops()
		bpy.ops.mesh.delete(type='ONLY_FACE')
		context.object.cloth_sewing = True

	def editSewing(self, context):
		bpy.ops.object.editmode_toggle()
		bpy.ops.mesh.select_all(action="DESELECT")

	def mergeSewing(self, context):
		self.createSewing(context)
		bpy.ops.mesh.select_mode(use_extend=False, use_expand=False, type='EDGE')
		bpy.ops.mesh.select_non_manifold(extend=False, use_wire=True, use_boundary=False,use_multi_face=False,use_non_contiguous=False,use_verts=False)
		bpy.ops.mesh.edge_collapse()

	def doneSewing(self, context):
		bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.mesh.select_all(action='SELECT')

		bpy.ops.object.editmode_toggle()
		bpy.context.object.show_wireframes = False
		context.space_data.overlay.show_face_normals = False
		context.space_data.overlay.show_face_orientation = False
		context.active_object.face_orientation = False
		bpy.ops.screen.frame_jump(1)
	def setup_animation_gravity(self, context):
		if "SimplyCloth" in context.active_object.modifiers:
			context.active_object.modifiers["SimplyCloth"].settings.effector_weights.gravity = 0
			bpy.context.active_object.modifiers["SimplyCloth"].settings.effector_weights.keyframe_insert(
				data_path='gravity', frame=0)
			context.active_object.modifiers["SimplyCloth"].settings.effector_weights.gravity = 1
			bpy.context.active_object.modifiers["SimplyCloth"].settings.effector_weights.keyframe_insert(
				data_path='gravity', frame=60)

	def selectSewings(self, context):
		bpy.ops.mesh.select_non_manifold(extend=False, use_wire=True, use_boundary=False, use_multi_face=False,
										 use_non_contiguous=False, use_verts=False)

	def addSelectionToWeldGroup(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		for i, vg in enumerate(obj.vertex_groups):
			if "SimplyWeld" == vg.name:
				# print(True)
				bpy.ops.object.vertex_group_set_active(group='SimplyWeld')
				bpy.ops.object.vertex_group_assign()
			else:
				print(False)

	def execute(self, context):
		if self.mode == "SELECT_BOUNDS":
			self.selectBoundaries(context)
		if self.mode == "CREATE_SEWING":
			self.createSewing(context)
			self.selectSewings(context)
			self.addSelectionToWeldGroup(context)
			# context.object.modifiers["SimplyWeld"].show_viewport = True
			# context.object.modifiers["SimplyWeld"].show_in_editmode = True

			self.setup_animation_gravity(context)
		if self.mode == "CREATE_FINE_SEWING":
			self.createFineSewing(context)
		if self.mode == "MERGE_SEWING":
			self.mergeSewing(context)

		if self.mode == "REMOVE_SEWING":
			self.removeSewing(context)
		if self.mode == "EDIT_SEWING":
			self.editSewing(context)
		if self.mode == "DONE":
			self.doneSewing(context)

		return {'FINISHED'}
class PokeFace(bpy.types.Operator):
	bl_idname = "object.poke_faces"
	bl_label = "Poke Faces"
	# bl_description = "Poke Faces Operation"
	mode: StringProperty()

	def duplicateMesh(self,context):
		old_name = bpy.context.active_object.name
		bpy.context.active_object.cloth_status = False
		bpy.ops.object.duplicate()
		bpy.ops.object.select_all(action='DESELECT')
		for i, obj in enumerate(bpy.data.objects):
			print(obj.name)
			if obj.name == old_name:
				# print("TRUE")
				bpy.context.object.cloth_status = True
				bpy.context.object.baseSub_level = 0
	def refreshSelect(self,context):
		bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.mesh.select_all(action='SELECT')

	def lowPoke(self,context):
		self.refreshSelect(context)
		bpy.ops.mesh.poke()
		bpy.ops.mesh.tris_convert_to_quads()

	def midPoke(self,context):
		self.refreshSelect(context)
		bpy.ops.mesh.subdivide()
		bpy.ops.mesh.poke()
		bpy.ops.mesh.tris_convert_to_quads()

	def execute(self,context):

		if self.mode == "MID":
			self.duplicateMesh(context)
			bpy.ops.object.editmode_toggle()
			self.lowPoke(context)
			bpy.ops.object.editmode_toggle()
		if self.mode == "MAX":
			self.duplicateMesh(context)
			bpy.ops.object.editmode_toggle()
			self.midPoke(context)
			bpy.ops.object.editmode_toggle()


		return {'FINISHED'}
class RemeshCloth(bpy.types.Operator):
	bl_idname = "object.remesh_cloth"
	bl_label = "Remesh Cloth"
	bl_description = "Remesh Cloth Quad based"

	def remesh(self, context):
		target_faces = context.active_object.remesher_face_count
		bpy.ops.object.quadriflow_remesh(use_paint_symmetry=False, use_preserve_sharp=False, use_preserve_boundary=False,
										 preserve_paint_mask=False, smooth_normals=False, mode='FACES',
										 target_ratio=1.0,
										 target_edge_length=0.1, target_faces=target_faces, mesh_area=-1, seed=0)
	def execute(self, context):
		bpy.context.object.show_wireframes = False
		self.remesh(context)
		bpy.context.object.show_wireframes = True
		return {"FINISHED"}
class FinishCloth(bpy.types.Operator):
	bl_idname = "object.finish_cloth"
	bl_label = "Finish Cloth"
	bl_description = "Apply the Cloth mesh as a static mesh!"
	mode: StringProperty()
	def duplicateMesh(self,context):
		bpy.ops.object.duplicate_move(OBJECT_OT_duplicate={"linked": False, "mode": 'TRANSLATION'},
									  TRANSFORM_OT_translate={"value": (0, 0, 0), "orient_type": 'GLOBAL',
															  "orient_matrix": ((1, 0, 0), (0, 1, 0), (0, 0, 1)),
															  "orient_matrix_type": 'GLOBAL',
															  "constraint_axis": (False, False, False), "mirror": True,
															  "use_proportional_edit": False,
															  "proportional_edit_falloff": 'SMOOTH',
															  "proportional_size": 0.148644,
															  "use_proportional_connected": False,
															  "use_proportional_projected": False, "snap": False,
															  "snap_target": 'CLOSEST', "snap_point": (0, 0, 0),
															  "snap_align": False, "snap_normal": (0, 0, 0),
															  "gpencil_strokes": False, "cursor_transform": False,
															  "texture_space": False, "remove_on_cancel": False,
															  "release_confirm": False, "use_accurate": False})
		bpy.context.active_object.name = "Simply_Cloth_Finished"
	def applyModifiers(self, context):
		obj = context.active_object
		for mod in obj.modifiers:
			if self.mode == "APPLYCLOTH" and mod.name == "SimplyCloth":
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.type == "MIRROR":
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.name == "BaseSub" and mod.levels > 0:
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.name == "BaseSub" and mod.levels == 0:
				bpy.ops.object.modifier_remove(modifier=mod.name, report=True)

			elif mod.name == "SimplyDensity" and mod.show_viewport == True:
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.name == "SimplyDensity" and mod.show_viewport == False:
				bpy.ops.object.modifier_remove(modifier=mod.name, report=True)
			elif mod.name == "SimplyWeld" and mod.show_viewport == True:
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.name == "SimplyWeld" and mod.show_viewport == False:
				bpy.ops.object.modifier_remove(modifier=mod.name, report=True)
			elif mod.name == "qualityView" and mod.show_viewport == False:
				if self.mode != "APPLYMODIFIERONLY":
					mod.show_viewport = True
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.name == "qualityView" and self.mode=="APPLYMODIFIERONLY" or self.mode=="SCULPTCLOTHEXTRA":
				mod.show_viewport = True
				bpy.ops.object.modifier_apply(modifier=mod.name, report=True)
			elif mod.name == "simplySmooth" and mod.show_viewport==False:
				mod.show_viewport = True
		if self.mode =="APPLYMODIFIERONLY":
			self.deleteBakeCache(context)

	def deleteBakeCache(self,context):
		override = {'scene': bpy.context.scene,'point_cache': bpy.context.active_object.modifiers['SimplyCloth'].point_cache}
		bpy.ops.ptcache.free_bake(override)
		bpy.ops.screen.frame_jump(1)
	def bakeCache(self, context):
		override = {'scene': bpy.context.scene,'point_cache' : bpy.context.active_object.modifiers['SimplyCloth'].point_cache}
		bpy.ops.ptcache.bake(override, bake=False)
	def updateDuplicateMesh(self, context):
		override = {'scene': bpy.context.scene, 'point_cache' : bpy.context.active_object.modifiers['SimplyCloth'].point_cache}
		bpy.ops.ptcache.bake_all(bake=False)
	def checkAndApplyShapeKeys(self, context):
		if bpy.data.shape_keys:
			for k in bpy.data.shape_keys:
				if k:
					bpy.ops.object.shape_key_remove(all=True)
	def removePinGroup(self, context):
		vertexGroup = context.active_object.vertex_groups
		for group in vertexGroup:
			if group.name == "SimplyPin":
				vertexGroup.remove(group)
		bpy.ops.screen.frame_jump(1)
	def switchToSculptMode(self, context):
		bpy.ops.sculpt.sculptmode_toggle()
		bpy.ops.wm.tool_set_by_id(name="builtin_brush.Cloth")
		bpy.context.scene.tool_settings.sculpt.use_symmetry_x = False
		bpy.ops.screen.frame_jump(1)

	def unsubdivideMesh(self,context):
		bpy.ops.object.editmode_toggle()
		bpy.ops.mesh.unsubdivide()
		bpy.ops.object.editmode_toggle()
	def execute(self,context):
		if self.mode == "SCULPTCLOTHEXTRA":
			if "Mirror" in context.active_object.modifiers:
				bpy.ops.object.modifier_apply(modifier="Mirror", report=True)
			if "BaseSub" in context.active_object.modifiers:
				bpy.ops.object.modifier_apply(modifier="SimplyCloth", report=True)
				context.active_object.modifiers["BaseSub"].levels = 1
				bpy.ops.object.modifier_apply(modifier="SimplyCloth", report=True)
				context.active_object.modifiers["BaseSub"].levels = 1
			self.applyModifiers(context)
			self.unsubdivideMesh(context)
			self.switchToSculptMode(context)
			context.active_object.clothObjectSculpt = True
		elif self.mode == "SCULPTCLOTH":
			self.switchToSculptMode(context)
		elif self.mode == "APPLYMODIFIERONLY":
			bpy.context.space_data.overlay.show_wireframes = False
			bpy.context.object.modifiers["qualityView"].show_viewport = False
			self.applyModifiers(context)
		elif self.mode is not "SCULPTCLOTHEXTRA" and self.mode is not "SCULPTCLOTH" and self.mode is not "APPLYMODIFIERONLY":
			bpy.context.space_data.overlay.show_wireframes = False
			if "qualityView" in bpy.context.active_object.modifiers:
				bpy.context.object.modifiers["qualityView"].show_viewport = False
			self.applyModifiers(context)
			if context.active_object.cloth_sewing:
				bpy.ops.object.editmode_toggle()
				bpy.ops.mesh.select_all(action="DESELECT")
		bpy.context.object.weight_pin_view = False
		return {'FINISHED'}
class DensityWeightPaint(bpy.types.Operator):
	bl_idname = "object.density_paint"
	bl_label = "Density Paint"
	mode:StringProperty(default="FROM_OBJECT")
	def toggleWeight(self,context):
		obj = context.active_object
		if "SimplyCloth" in obj.modifiers:
			if "SimplyDensity" in context.active_object.vertex_groups:
				index =  bpy.context.active_object.vertex_groups["SimplyDensity"].index
				obj.vertex_groups.active_index = index
			else:
				group = bpy.context.object.vertex_groups.new()
				group.name = "SimplyDensity"
		obj.modifiers["SimplyDensity"].show_viewport = False
		bpy.ops.screen.frame_jump(1)
	def setVertexGroupToModifier(self,context):
		obj = context.active_object
		if "SimplyDensity" in context.active_object.modifiers:
			obj.modifiers["SimplyDensity"].vertex_group = "SimplyDensity"
			obj.modifiers["SimplyDensity"].invert_vertex_group = True
			obj.modifiers["SimplyDensity"].ratio = 0.35
			obj.modifiers["SimplyDensity"].show_viewport = True

	def removeGroup(self, context):
		vertexGroup = context.active_object.vertex_groups
		for group in vertexGroup:
			if group.name == "SimplyDensity":
				vertexGroup.remove(group)
		bpy.ops.screen.frame_jump(1)
	def execute(self, context):
		context.space_data.overlay.show_wireframes = False
		if self.mode == "FROM_OBJECT":
			bpy.ops.paint.weight_paint_toggle()
			self.toggleWeight(context)
			self.setVertexGroupToModifier(context)
		elif self.mode == "FROM_EDIT":
			bpy.ops.object.editmode_toggle()
			bpy.ops.paint.weight_paint_toggle()
			self.toggleWeight(context)
			self.setVertexGroupToModifier(context)
		elif self.mode == "HIDE":
			if "SimplyDensity" in context.active_object.modifiers:
				bpy.ops.object.modifier_remove(modifier="SimplyDensity")
				self.removeGroup(context)

		return {'FINISHED'}
class AddHook(bpy.types.Operator):
	bl_idname = "object.add_hook"
	bl_label = "Add Hook"
	bl_description = "Add Hook with selected Vertexgroup"
	index: IntProperty(default=0)
	name: StringProperty(default="PinGroup")
	def createHook(self,context):
		bpy.ops.object.hook_add_newob()
		vertName =  self.name
		for i, m in enumerate(context.active_object.modifiers):
			if m.type == 'HOOK':
				if m.vertex_group == "":
					m.name = vertName
					for j, v in enumerate(context.active_object.vertex_groups):
						if v.name == self.name:
							m.vertex_group = vertName
							m.show_expanded = False

	def execute(self, context):
		self.createHook(context)
		return {'FINISHED'}
class DeleteHook(bpy.types.Operator):
	bl_idname = "object.delete_hook"
	bl_label = "Delete Hook"
	bl_description = "Delete Hook"

	name: StringProperty(default="PinGroup")

	def deleteModifierHook(self,context):
		vertName = self.name
		bpy.ops.object.modifier_remove(modifier=vertName)
	def deleteHookObject(self,contex):
		vertName = self.name
		for h in contex.active_object.modifiers:
			if h.name == vertName:
				bpy.ops.object.editmode_toggle()
				bpy.ops.object.select_all(action='DESELECT')
				if h.object is not None:
					if bpy.data.objects[h.object.name_full]:
						bpy.data.objects[h.object.name_full].select_set(True)
						bpy.ops.object.delete()
				bpy.ops.object.editmode_toggle()

	def execute(self, context):
		self.deleteHookObject(context)
		self.deleteModifierHook(context)
		return {'FINISHED'}
class CreateWeightPins(bpy.types.Operator):
	bl_idname = "object.create_pin_layers"
	bl_label = "Weightpaint Pin Groups"
	bl_description = "Weightpaint pingroup"
	mode:StringProperty(default="SELECT")
	index:IntProperty(default=0)
	name:StringProperty(default="PinGroup")

	def toogleWeightPaint(self, context):
		if context.mode == "EDIT_MESH":
			bpy.ops.object.editmode_toggle()
			bpy.ops.paint.weight_paint_toggle()
		elif context.mode == "OBJECT":
			bpy.ops.paint.weight_paint_toggle()
	def createVertexPinWeightGroup(self,context):
		obj = context.active_object
		groupName = self.name
		if "SimplyCloth" in obj.modifiers:
			if groupName in context.active_object.vertex_groups:
				index = bpy.context.active_object.vertex_groups[groupName].index
				obj.vertex_groups.active_index = index
			else:
				group = bpy.context.object.vertex_groups.new()
				group.name = groupName

		bpy.ops.screen.frame_jump(1)
	def createMergePinGroup(self,context):
		obj = bpy.context.active_object
		name = self.name
		if "SimplyCloth" in obj.modifiers:
			for g in obj.vertex_groups:
				if g.name == name:
					name = g.name + "_D"
			group = bpy.context.object.vertex_groups.new()
			group.name = name
	def fillAllVertsWithValue(self,context):
		bpy.ops.object.editmode_toggle()
		obj = context.active_object
		verts = obj.data.vertices
		vertName =  self.name
		for i, group in enumerate(obj.vertex_groups):
			if vertName == group.name:
				for v, vert in enumerate(verts):
					bpy.context.active_object.vertex_groups[vertName].add([vert.index], 0.0, 'REPLACE')
		bpy.ops.object.editmode_toggle()

	def replaceAllVertsValues(self,context):
		# bpy.ops.object.editmode_toggle()
		obj = context.active_object
		verts = obj.data.vertices
		vertName =  self.name
		if vertName in obj.vertex_slider:
			for v, vert in enumerate(verts):
				bpy.context.active_object.vertex_groups[vertName].add([vert.index], 0.0, 'REPLACE')

	def calcMergedPinGroup(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		groupData = {}
		simplyPinGroup = obj.vertex_groups["SimplyPin"]
		vertexSlider = obj.vertex_slider

		for group in obj.vertex_groups:
			for v in vertexSlider:
				if group.name == v.name:
					for j, vert in enumerate(verts):
						for group2 in vert.groups:
							if group2.group == group.index:
								if vert.index in groupData:
									if not v.hide:
										groupData[j] += group2.weight*v.slider_value
									else:
										groupData[j] += group2.weight*0
								else:
									if not v.hide:
										groupData[j] = group2.weight*v.slider_value
									else:
										groupData[j] = group2.weight*0

		for index in groupData:
			simplyPinGroup.add([index], groupData[index], "REPLACE")

	def selectTargetVertexGroup(self,context):
		vertexSlider = context.active_object.vertex_slider
		vertexGroups = context.active_object.vertex_groups
		vertexSliderName = vertexSlider[self.index].name

		for j, vg in enumerate(vertexGroups):
			for v in vertexSlider:
				v.active= False
			if vg.name == vertexSliderName:
				vertexGroups.active_index = j
				vertexSlider[self.index].active = True
				break
	def selectMixedVertexGroup(self,context):
			vertexSlider = context.active_object.vertex_slider
			vertexGroups = context.active_object.vertex_groups
			vertexSliderName = vertexSlider[self.index].name

			for j, vg in enumerate(vertexGroups):
				if vg.name == "SimplyPin":
					vertexGroups.active_index = j
					break
	def selectMergedVertexGroup(self,context):
		vertexSlider = context.active_object.vertex_slider
		vertexGroups = context.active_object.vertex_groups

		for j, vg in enumerate(vertexGroups):
			if vg.name == "SimplyPin":
				vertexGroups.active_index = j
				break
	def assignSelectionToGroup(self,context):
		bpy.ops.object.vertex_group_assign()
	def clearSelectedPinGroup(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		bpy.ops.mesh.select_all(action='SELECT')
		bpy.ops.object.vertex_group_remove_from()
	def execute(self,context):
		if self.mode == "RECALC":
			self.calcMergedPinGroup(context)
		if self.mode == "WEIGHTPAINT":
			bpy.ops.screen.frame_jump(1)
			self.selectTargetVertexGroup(context)
			self.toogleWeightPaint(context)
			# self.createVertexPinWeightGroup(context)

		elif self.mode == "MERGEWEIGHTS":
			# self.createMergePinGroup(context)
			# self.fillAllVertsWithValue(context)
			if context.mode == "EDIT_MESH":
				bpy.ops.object.editmode_toggle()
				self.calcMergedPinGroup(context)
				bpy.ops.object.editmode_toggle()
				bpy.context.object.weight_pin_view = True
			elif context.mode == "OBJECT":
				self.calcMergedPinGroup(context)

		elif self.mode == "ADD":
			self.assignSelectionToGroup(context)
			if context.mode == "EDIT_MESH":
				bpy.ops.object.editmode_toggle()
				self.calcMergedPinGroup(context)
				bpy.ops.object.editmode_toggle()
			elif context.mode == "OBJECT":
				# print("FROM OBJECT MODE")
				self.calcMergedPinGroup(context)
			self.selectMixedVertexGroup(context)
			bpy.ops.screen.frame_jump(1)
		elif self.mode == "DELETE":
			self.deleteSelectedPinGroup(context)
			bpy.ops.screen.frame_jump(1)
		elif self.mode == "SELECT":
			self.selectTargetVertexGroup(context)
		elif self.mode == "SELECTALL":
			self.selectMixedVertexGroup(context)
		elif self.mode == "CLEAR":
			self.selectTargetVertexGroup(context)
			bpy.ops.mesh.select_all(action='SELECT')
			bpy.ops.object.vertex_group_remove_from()
			bpy.context.object.weight_value = 1
			bpy.ops.object.editmode_toggle()
			self.calcMergedPinGroup(context)
			bpy.ops.object.editmode_toggle()
			bpy.ops.mesh.select_all(action='DESELECT')
			bpy.ops.screen.frame_jump(1)
		return {'FINISHED'}
class DeleteSlider(bpy.types.Operator):
	"""Tooltip"""
	bl_idname = "object.delete_slider"
	bl_label = "Delete Pin Layer"

	index: IntProperty(default=0)

	@classmethod
	def poll(cls, context):
		return context.active_object is not None

	def execute(self, context):
		vertexSlider = context.active_object.vertex_slider
		vertexGroups = context.active_object.vertex_groups
		vertexSliderName = vertexSlider[self.index].name
		for j, vg in enumerate(vertexGroups):
			if vg.name == vertexSliderName:
				vertexGroups.remove(vg)
				break
		vertexSlider.remove(self.index)
		bpy.ops.screen.frame_jump(1)
		return {'FINISHED'}
class AddPinGroup(bpy.types.Operator):
	"""Tooltip"""
	bl_idname = "object.add_pin_operator"
	bl_label = "Add Pin Layer"

	name: StringProperty(default="", name="Slider Name")
	weight_value: FloatProperty(default=1.0, min=0.0, max=1.0, name="Weight Value")

	@classmethod
	def poll(cls, context):
		return context.active_object is not None

	def invoke(self, context, event):

		return context.window_manager.invoke_props_dialog(self)

	def execute(self, context):
		slider = context.active_object.vertex_slider.add()
		obj = context.active_object

		for g in obj.vertex_groups:
			if g.name == self.name:
				self.name = g.name + "_duplicate"
		group = bpy.context.object.vertex_groups.new()
		group.name = self.name

		slider.name = self.name
		context.active_object.weight_value = self.weight_value
		bpy.ops.object.create_pin_layers(mode="ADD", name=self.name)
		bpy.ops.object.create_pin_layers(mode="MERGEWEIGHTS", name=self.name)
		return {'FINISHED'}
class AddSelectionToLayer(bpy.types.Operator):
	"""Tooltip"""
	bl_idname = "object.add_selection_to_layer"
	bl_label = "Add Pin Layer"

	weight_value: FloatProperty(default=1.0, min=0.0, max=1.0, name="Weight Value")

	@classmethod
	def poll(cls, context):
		return context.active_object is not None

	def invoke(self, context, event):
		return context.window_manager.invoke_props_dialog(self)

	def execute(self, context):

		context.active_object.weight_value = self.weight_value
		for i, slider in enumerate(context.active_object.vertex_slider):
			if slider.active:
				activeIndex= i

		bpy.ops.object.create_pin_layers(mode="SELECT", index=activeIndex)
		bpy.ops.object.create_pins(mode="APPLY", index=activeIndex)
		return {'FINISHED'}
class CreatePins(bpy.types.Operator):
	bl_idname = "object.create_pins"
	bl_label = "Assign or Weightpaint Pins"
	mode:StringProperty(default="SELECT")
	index:IntProperty(default=0)
	weightValue:FloatProperty(default=1.0)
	def toggleMode(self, context):
		bpy.ops.object.editmode_toggle()
		bpy.ops.mesh.select_all(action="DESELECT")
		if "SimplyPin" in context.active_object.vertex_groups:
			bpy.ops.object.vertex_group_select()

	def toggleWeight(self,context):
		bpy.ops.object.editmode_toggle()
		self.createVertexGroup(context)
		bpy.ops.object.editmode_toggle()
		bpy.ops.paint.weight_paint_toggle()
		self.addVertexGroupToCloth(context)

	def assignSelectionToGroup(self,context):
		bpy.ops.object.vertex_group_assign()

	def selectVertexGroupByIndex(self,context):
		vertexSlider = context.active_object.vertex_slider
		vertexGroups = context.active_object.vertex_groups
		vertexSliderName = vertexSlider[self.index].name

		for j, vg in enumerate(vertexGroups):
			if vg.name == vertexSliderName:
				vertexGroups.active_index = j
				break

	def clearAllVertices(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		bpy.ops.mesh.select_all(action='SELECT')
		bpy.ops.object.vertex_group_remove_from()
	def recalcMergedPinGroup(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		groupData = {}
		simplyPinGroup = obj.vertex_groups["SimplyPin"]
		vertexSlider = obj.vertex_slider

		for group in obj.vertex_groups:
			for v in vertexSlider:
				if group.name == v.name:
					for j, vert in enumerate(verts):
						for group2 in vert.groups:
							if group2.group == group.index:
								if vert.index in groupData:
									if not v.hide:
										groupData[j] += group2.weight * v.slider_value
									else:
										groupData[j] += group2.weight * 0
								else:
									if not v.hide:
										groupData[j] = group2.weight * v.slider_value
									else:
										groupData[j] = group2.weight * 0

		for index in groupData:
			simplyPinGroup.add([index], groupData[index], "REPLACE")
	def apply(self, context):
		self.selectVertexGroupByIndex(context)
		self.assignSelectionToGroup(context)
		bpy.ops.screen.frame_jump(1)
		for mod in context.active_object.modifiers:
			if mod.name == "BaseSub":
				context.active_object.modifiers["BaseSub"].show_in_editmode = True
			elif mod.name == "qualityView":
				context.active_object.modifiers["qualityView"].show_in_editmode = True
			elif mod.name == "simplySmooth":
				context.active_object.modifiers["simplySmooth"].show_in_editmode = True
		bpy.ops.object.editmode_toggle()
		self.recalcMergedPinGroup(context)
		bpy.ops.object.editmode_toggle()
	def removeGroup(self, context):
		vertexGroup = context.active_object.vertex_groups
		for group in vertexGroup:
			if group.name == "SimplyPin":
				vertexGroup.remove(group)
	def remove_fromEdit_Group(self, context):
		vertexGroup = context.active_object.vertex_groups
		for group in vertexGroup:
			if group.name == "SimplyPin":
				vertexGroup.remove(group)
				bpy.ops.mesh.select_all(action="DESELECT")
		if self.mode == "REMOVE_FROM_EDIT":
			bpy.ops.mesh.select_all(action="DESELECT")
			bpy.ops.object.editmode_toggle()
	def execute(self, context):
		obj = context.active_object.modifiers
		for mod in obj:
			if mod.name == "BaseSub" or mod.name == "qualityView" or mod.name == "simplySmooth" or mod.name == "SimplyThickness":
				if mod.name == "BaseSub":
					obj["BaseSub"].show_in_editmode = False
				if mod.name == "qualityView":
					obj["qualityView"].show_in_editmode = False
				if mod.name == "simplySmooth":
					obj["simplySmooth"].show_in_editmode = False
				if mod.name == "SimplyThickness":
					obj["SimplyThickness"].show_in_editmode = False
		if self.mode == "SELECT":
			self.toggleMode(context)
		elif self.mode == "WEIGHT":
			self.toggleWeight(context)
		elif self.mode == "CLEAR":
			bpy.ops.object.editmode_toggle()
			bpy.ops.object.vertex_group_select()
			self.clearAllVertices(context)
			bpy.ops.object.editmode_toggle()
		elif self.mode == "APPLY":
			self.apply(context)
		elif self.mode == "REMOVE":
			self.removeGroup(context)
		elif self.mode == "REMOVE_FROM_EDIT":
			self.remove_fromEdit_Group(context)
		elif self.mode == "SELECT_ASSIGNED_PINS":
			bpy.ops.object.vertex_group_select()
		elif self.mode == "REMOVE_SELECTED":
			bpy.ops.object.vertex_group_remove_from()
			bpy.ops.mesh.select_all(action="DESELECT")
			bpy.ops.object.vertex_group_select()
		screen = bpy.ops.screen
		screen.frame_jump(1)
		return {'FINISHED'}
class ResetClothParameter(bpy.types.Operator):
	bl_idname = "object.reset_parameters"
	bl_label = "Reset all Cloth Parameters"
	bl_description = "Reset Cloth Parameters!"
	def execute(self, context):
		if "SimplyCloth" in context.active_object.modifiers:
			bpy.ops.object.modifier_move_up()
			bpy.context.object.self_collision = False
			bpy.context.object.modifiers["SimplyCloth"].settings.mass = 0.3
			bpy.context.object.stiffness_slider = 1
			bpy.context.object.fold_slider = 0.1
			bpy.context.object.wrinkle_slider = 50
			bpy.context.object.shrink_slider = 0
			if "simplySmooth" in context.active_object.modifiers:
				bpy.context.object.modifiers["simplySmooth"].iterations = 0
			bpy.context.object.cloth_sewing = False
			bpy.context.object.modifiers["SimplyCloth"].settings.sewing_force_max = 2
			bpy.context.object.internal_spring = False
			bpy.context.object.pressure = False
			bpy.context.object.advanced_settings = False
			bpy.context.object.modifiers["SimplyCloth"].settings.effector_weights.gravity = 1
			bpy.context.object.quality_steps_slider = 10
			bpy.context.object.collision_quality_slider = 2
			bpy.context.object.selfCollisionDistance_slider = 0.01
			bpy.context.object.strengthen_slider = 20




			bpy.context.object.presets = 'STANDARD'
			# bpy.context.object.templates = 'STANDARD'
			bpy.ops.object.modifier_remove()
		return {'FINISHED'}
class RemoveModifier(bpy.types.Operator):
	bl_idname = "object.remove_cloth"
	bl_label = "Remove Simply Cloth"
	bl_description = "Deletes Cloth and the modifiers from the selected mesh!"

	def removePinGroup(self, context):
		vertexGroup = context.active_object.vertex_groups
		for group in vertexGroup:
			if group.name == "SimplyPin" or \
					group.name == "SimplyWeld" or \
					group.name == "SimplyStrength" or \
					group.name == "SimplyPressure":
				vertexGroup.remove(group)
		bpy.ops.screen.frame_jump(1)
	def execute(self, context):
		obj = context.active_object
		obj.cloth_sewing = False
		obj.internal_spring = False
		obj.pressure = False
		obj.self_collision = False
		obj.advanced_settings = False
		obj.face_orientation = False
		obj.show_wireframes = False
		obj.presets = 'STANDARD'
		for mod in obj.modifiers:
			if mod.name == "BaseSub"or \
					mod.name == "SimplyCloth" or \
					mod.name == "SimplyDensity" or \
					mod.name == "SimplyWeld" or \
					mod.name == "qualityView" or \
					mod.name == "SimplyThickness" or \
					mod.name =="simplySmooth":
				obj.modifiers.remove(mod)
		self.removePinGroup(context)
		return {'FINISHED'}
class RemoveWind(bpy.types.Operator):
	bl_idname = "scene.remove_wind"
	bl_label = "Remove Wind"
	bl_description = "Remove Wind from Scene"

	def removeWind(self, context):
		for i, obj in enumerate(bpy.data.objects):
			if "Wind" in obj.name_full:
				bpy.data.objects.remove(bpy.data.objects[i])
	def resetWindValues(self, context):
		context.scene.sc_wind_factor = 1.0
		context.scene.sc_wind_slider = 10.0

	def execute(self, context):
		self.removeWind(context)
		self.resetWindValues(context)
		return {'FINISHED'}
class RemoveSimplyClothMesh(bpy.types.Operator):
	bl_idname = "object.remove_simply_mesh"
	bl_label = "Remove Simply Cloth Mesh"
	bl_description = "Remove Simply Cloth created Mesh"
	def removeMesh(self, context):
		bpy.ops.object.delete()
	def execute(self, context):
		self.removeMesh(context)
		return {'FINISHED'}
class FlipNormals(bpy.types.Operator):
	bl_idname = "object.flip_normals"
	bl_label = "Flip Normals"
	bl_description = "Flip Faces Orientation"

	def execute(self,context):
		bpy.ops.mesh.select_linked(delimit={'SEAM'})
		bpy.ops.mesh.flip_normals()
		return {'FINISHED'}
class SubdivideCloth(bpy.types.Operator):
	bl_idname = "object.subdivide_cloth"
	bl_label = "Subdivide Mesh"
	bl_description = "The resolution of the mesh can be set here. (+) subdivide the mesh and increase the resolution, (-) un-subdivide and decreases the resolution of the mesh!"

	mode: StringProperty(default="SUBDIVIDE")
	def fillAllVertsWithValue(self,context):
		bpy.ops.object.editmode_toggle()
		obj = context.active_object
		verts = obj.data.vertices
		vertName =  self.name
		for i, group in enumerate(obj.vertex_groups):
			if vertName == group.name:
				for v, vert in enumerate(verts):
					bpy.context.active_object.vertex_groups[vertName].add([vert.index], 0.001, 'REPLACE')
		bpy.ops.object.editmode_toggle()

	def execute(self, context):
		# create
		obj = context.active_object
		if self.mode == "SUBDIVIDE" or self.mode == "UNSUBDIVIDE":
			for mod in obj.modifiers:
				if mod.name == "BaseSub" and self.mode == "SUBDIVIDE":
					mod.levels = mod.levels + 1
				elif mod.name == "BaseSub" and self.mode == "UNSUBDIVIDE":
					mod.levels = mod.levels - 1
			screen = bpy.ops.screen
			screen.frame_jump(1)
		else:
			if self.mode == "SUBDIVIDE_EDIT":
				bpy.ops.mesh.select_all(action="SELECT")
				bpy.ops.mesh.subdivide()
			elif self.mode == "UNSUBDIVIDE_EDIT":
				bpy.ops.mesh.select_all(action="SELECT")
				bpy.ops.mesh.unsubdivide()
			bpy.ops.mesh.select_all(action="DESELECT")
		bpy.context.object.show_wireframes = True
		bpy.ops.screen.frame_jump(1)
		return {'FINISHED'}
class CreateCloth(bpy.types.Operator):
	bl_idname = "object.create_cloth"
	bl_label = "Create Cloth to selected Object"
	bl_description = "Creates a Simply Cloth Pro Mesh!"
	mode : StringProperty(default="FROM_OBJECT_MODE")

	def add_base_sub_modifier(self, context):
		obj = context.active_object
		obj.modifiers.new("BaseSub", "SUBSURF")
		obj.modifiers["BaseSub"].levels = 0
		obj.modifiers["BaseSub"].render_levels = 0

		obj.modifiers["BaseSub"].subdivision_type = "SIMPLE"

	def add_cloth_sub_modifier(self, context):
		obj = context.active_object
		obj.modifiers.new("SimplySubsurf", "SUBSURF")
		obj.modifiers["SimplySubsurf"].levels = 0
		obj.modifiers["SimplySubsurf"].subdivision_type = "SIMPLE"

	def create_cloth(self,context):
		obj = context.active_object
		obj.name = "simply_cloth"
		obj.modifiers.new("SimplyCloth","CLOTH")

	def smoothViewModifier(self, context):
		obj = context.active_object
		obj.modifiers.new("qualityView", "SUBSURF")
		obj.modifiers.new("simplySmooth", "SMOOTH")
		obj.modifiers["simplySmooth"].iterations = 0
		obj.modifiers["qualityView"].show_viewport = False
		obj.modifiers["qualityView"].show_in_editmode = False
		obj.modifiers["SimplyCloth"].collision_settings.distance_min = 0.025
		obj.modifiers["SimplyCloth"].collision_settings.collision_quality = 5
	def createVertexGroup(self, context):
		obj = context.active_object
		if "SimplyCloth" in obj.modifiers:
			group = bpy.context.object.vertex_groups.new()
			group.name = "SimplyPin"
			verts = obj.data.vertices

	def addVertexGroupToCloth(self,context):
		obj = context.active_object
		if "SimplyCloth" in obj.modifiers:
			mod = obj.modifiers["SimplyCloth"]
			mod.settings.vertex_group_mass = "SimplyPin"
	def add_thickness(self, context):
		obj = context.active_object
		value = FloatProperty(default=0.0)
		mod = obj.modifiers.new("SimplyThickness", "SOLIDIFY")
		mod.thickness = 0
		mod.show_viewport = False
		mod.show_in_editmode = False

	def add_decimate_modifier(self,context):
		obj = context.active_object
		mod = obj.modifiers.new("SimplyDensity", "DECIMATE")
		mod.show_viewport = False
		mod.show_in_editmode =False

	def hide_expanded(self, context):
		obj = context.active_object
		for mod in obj.modifiers:
			if mod.name == "BaseSub" or mod.name == "SimplySubsurf" or mod.name == "SimplyCloth" or mod.name == "qualityView" or mod.name == "simplySmooth":
				mod.show_expanded = False

	def add_weld_modifier(self,context):
		obj = context.active_object
		mod = obj.modifiers.new("SimplyWeld", "WELD")
		mod.merge_threshold = 0.025
		mod.show_viewport = False
		mod.show_in_editmode= False
		mod.show_render= False
		

	def addSewVertexGroupToWeld(self,context):
		group = bpy.context.object.vertex_groups.new()
		group.name = "SimplyWeld"
		# bpy.ops.object.vertex_group_assign()

	def addStrengthenVertexGroup(self,context):
		group = bpy.context.object.vertex_groups.new()
		group.name = "SimplyStrength"
		# bpy.ops.object.vertex_group_assign()
	def sewVertexGroupToWeld(self, context):
		obj = context.active_object
		mod = obj.modifiers["SimplyWeld"]
		mod.vertex_group= "SimplyWeld"
	def strengthVertexGroupToStrength(self, context):
		obj = context.active_object
		mod = obj.modifiers["SimplyCloth"]
		mod.settings.vertex_group_bending = "SimplyStrength"

	def addPressureVertexGroup(self,context):
		if context.mode == "OBJECT":
			bpy.ops.object.editmode_toggle()
		group = bpy.context.object.vertex_groups.new()
		group.name = "SimplyPressure"

		bpy.ops.mesh.select_all(action='SELECT')
		bpy.ops.object.vertex_group_assign()
		if context.mode == "OBJECT":
			bpy.ops.object.editmode_toggle()

	def refreshAllVertexGroupsWithValue(self,context):
		obj = context.active_object
		verts = obj.data.vertices
		for i, group in enumerate(obj.vertex_groups):
			if group.name == "SimplyPin":
				print("no Vertex Group Addition")
			else:
				for j, vert in enumerate(verts):
					bpy.context.active_object.vertex_groups[i].add([vert.index], 0, 'REPLACE')

	def create(self,context):
		print("CREATE")
		self.add_base_sub_modifier(context)
		self.add_decimate_modifier(context)
		self.create_cloth(context)
		self.add_weld_modifier(context)
		self.smoothViewModifier(context)
		self.addSewVertexGroupToWeld(context)
		self.sewVertexGroupToWeld(context)
		self.addStrengthenVertexGroup(context)
		self.strengthVertexGroupToStrength(context)
		self.addPressureVertexGroup(context)
		if context.mode == "OBJECT":
			self.createVertexGroup(context)
		elif context.mode =="EDIT_MESH":
			bpy.ops.object.editmode_toggle()
			self.createVertexGroup(context)
		self.addVertexGroupToCloth(context)
		self.hide_expanded(context)
		if self.mode == "CREATE_FROM_EDIT":
			bpy.ops.object.editmode_toggle()
		bpy.ops.screen.frame_jump(1)
		bpy.context.scene.frame_end = 606
		bpy.context.object.weight_pin_view = False

	def separateSelection(self, context):
		self.subdivideSelectedFaces(context)
		bpy.ops.mesh.separate(type='SELECTED')
		bpy.ops.object.editmode_toggle()

	def selectSeparatedObject(self, context):
		for i in bpy.context.selected_objects:
			if i.mode == "OBJECT":
				bpy.context.view_layer.objects.active = bpy.data.objects[i.name]

	def subdivideSelectedFaces(self, context):
		bpy.ops.object.editmode_toggle()
		totalvert= context.active_object.data.total_vert_sel
		bpy.ops.object.editmode_toggle()
		if totalvert<100:
			bpy.ops.mesh.subdivide()

	def selectBoundsForPinning(self, context):
		bpy.ops.object.editmode_toggle()
		bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.mesh.select_mode(use_extend=False, use_expand=False, type='EDGE')
		bpy.ops.mesh.select_non_manifold(extend=False, use_wire=False, use_boundary=True, use_multi_face=False,
										 use_non_contiguous=False, use_verts=False)

	def dublicateSelection(self, context):
		bpy.ops.mesh.duplicate_move(MESH_OT_duplicate={"mode":1}, TRANSFORM_OT_translate={"value":(0, 0, 0), "orient_type":'GLOBAL', "orient_matrix":((1, 0, 0), (0, 1, 0), (0, 0, 1)), "orient_matrix_type":'GLOBAL', "constraint_axis":(False, False, False), "mirror":False, "use_proportional_edit":False, "proportional_edit_falloff":'SMOOTH', "proportional_size":1, "use_proportional_connected":False, "use_proportional_projected":False, "snap":False, "snap_target":'CLOSEST', "snap_point":(0, 0, 0), "snap_align":False, "snap_normal":(0, 0, 0), "gpencil_strokes":False, "cursor_transform":False, "texture_space":False, "remove_on_cancel":False, "release_confirm":False, "use_accurate":False, "use_automerge_and_split":False})

	def addBoundingAsPinning(self, context):
		vertexGroups = context.active_object.vertex_groups

		for j, vg in enumerate(vertexGroups):
			if vg.name == "SimplyPin":
				vertexGroups.active_index = j
				break
		bpy.ops.object.vertex_group_assign()
		bpy.ops.object.editmode_toggle()
	def execute(self, context):
		if self.mode == "CREATE_FROM_EDIT":
			bpy.ops.object.editmode_toggle()
			self.create(context)
		if self.mode == "CLOTHFROMSCULPT":
			context.space_data.overlay.show_wireframes = False
			bpy.ops.screen.frame_jump(1)
			if context.active_object.clothObjectSculpt == True:
				bpy.ops.sculpt.sculptmode_toggle()
				self.create(context)
				bpy.ops.screen.frame_jump(1)
			else:
				bpy.ops.sculpt.sculptmode_toggle()
		elif self.mode == "CREATECLOTH":
			self.create(context)
		elif self.mode == "SELECTCREATECLOTH":
			# self.duplicateSelection(context)
			self.separateSelection(context)
			self.selectSeparatedObject(context)
			self.create(context)
			self.selectBoundsForPinning(context)
			self.addBoundingAsPinning(context)
			bpy.context.object.presets = 'PRESSURE'
			bpy.ops.screen.animation_manager(mode="PLAY")
		return {'FINISHED'}
class StrengthenSelection(bpy.types.Operator):
	bl_idname = "object.strengthen_selection"
	bl_label = "Set selection as Strength Group"
	mode:StringProperty(default="ADD")
	def addSelectionToStrengthGroup(self, context):
		bpy.ops.object.vertex_group_set_active(group='SimplyStrength')
		bpy.ops.object.vertex_group_assign()
	def clearSelection(self, context):
		bpy.ops.object.vertex_group_set_active(group='SimplyStrength')
		bpy.ops.object.vertex_group_remove_from()
	def execute(self, context):
		if self.mode == "ADD":
			self.addSelectionToStrengthGroup(context)
		elif self.mode == "CLEAR":
			self.clearSelection(context)
		return {'FINISHED'}
class PressureSelection(bpy.types.Operator):
	bl_idname = "object.pressure_assign_group"
	bl_label = "Pressure Group Selection"

	mode:StringProperty(default="ASSIGN")
	def calcMergedPinGroup(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		groupData = {}
		simplyPinGroup = obj.vertex_groups["SimplyPin"]
		vertexSlider = obj.vertex_slider

		for group in obj.vertex_groups:
			for v in vertexSlider:
				if group.name == v.name:
					for j, vert in enumerate(verts):
						for group2 in vert.groups:
							if group2.group == group.index:
								if vert.index in groupData:
									if not v.hide:
										groupData[j] += group2.weight*v.slider_value
									else:
										groupData[j] += group2.weight*0
								else:
									if not v.hide:
										groupData[j] = group2.weight*v.slider_value
									else:
										groupData[j] = group2.weight*0

		for index in groupData:
			if context.mode == "EDIT_MESH":
				bpy.ops.object.editmode_toggle()
				simplyPinGroup.add([index], groupData[index], "REPLACE")
			elif context.mode == "OBJECT":
				simplyPinGroup.add([index], groupData[index], "REPLACE")
	def addVertexGroupToPressure(self, context):
		obj = context.active_object
		mod = obj.modifiers["SimplyCloth"]
		mod.settings.vertex_group_pressure = "SimplyPressure"

	def paintPressureGroup(self, context):
		bpy.ops.object.vertex_group_set_active(group='SimplyPressure')

		bpy.context.object.modifiers["qualityView"].show_viewport = False
		bpy.context.object.modifiers["qualityView"].show_in_editmode = False
		bpy.context.object.modifiers["BaseSub"].show_viewport = False
		bpy.context.object.modifiers["BaseSub"].show_in_editmode = False
		bpy.ops.paint.weight_paint_toggle()
		bpy.context.scene.tool_settings.unified_paint_settings.weight = 0
		bpy.ops.screen.frame_jump(1)

	def addSelectionToPressureGroup(self, context):
		obj = context.active_object
		verts = obj.data.vertices
		# vertName =  self.name
		bpy.ops.object.vertex_group_set_active(group='SimplyPressure')
		context.active_object.weight_value = 0
		bpy.ops.object.vertex_group_assign()
		context.active_object.weight_value = 1
	def clearPressureGroup(self, context):
		bpy.ops.object.vertex_group_set_active(group='SimplyPressure')
		bpy.ops.mesh.select_all(action='SELECT')
		bpy.ops.object.vertex_group_remove_from()
		bpy.ops.mesh.select_all(action='SELECT')
		context.active_object.weight_value = 1
		bpy.ops.object.vertex_group_assign()


	def execute(self, context):
		if self.mode == "ASSIGN":
			self.addSelectionToPressureGroup(context)
			self.addVertexGroupToPressure(context)
		elif self.mode == "PAINT":
			self.paintPressureGroup(context)
			self.addVertexGroupToPressure(context)
			if not bpy.context.screen.is_animation_playing:
				bpy.ops.screen.animation_manager(mode="PLAY")
		elif self.mode == "REMOVE":
			if context.mode == "OBJECT":
				bpy.ops.object.editmode_toggle()
				self.clearPressureGroup(context)
				bpy.ops.object.editmode_toggle()
			elif context.mode == "EDIT_MESH":
				self.clearPressureGroup(context)
			self.calcMergedPinGroup(context)
		bpy.ops.screen.frame_jump(1)
		return {'FINISHED'}
class LivePinningPaint(bpy.types.Operator):
	bl_idname = "object.live_pinning"
	bl_label = "Live painting Pin Group"

	def execute(self, context):
		bpy.context.space_data.overlay.show_wireframes = False

		bpy.context.object.modifiers["qualityView"].show_viewport = False
		bpy.context.object.modifiers["qualityView"].show_in_editmode = False
		if context.mode == "OBJECT":
			bpy.ops.object.shade_smooth()
			if not bpy.context.screen.is_animation_playing:
				bpy.ops.screen.animation_manager(mode="PLAY")
		bpy.ops.paint.weight_paint_toggle()
		bpy.ops.object.vertex_group_set_active(group='SimplyPin')
		bpy.context.scene.tool_settings.unified_paint_settings.weight = 1
		bpy.context.object.modifiers["BaseSub"].show_viewport = False
		bpy.context.object.modifiers["BaseSub"].show_in_editmode = False
		bpy.ops.screen.frame_jump(1)

		return {'FINISHED'}
class ClearSimplyPin(bpy.types.Operator):
	bl_idname = "object.clear_simply_pin"
	bl_label = "Clear Pin Group"

	def execute(self, context):
		if context.mode == "OBJECT":
			bpy.ops.object.editmode_toggle()
			bpy.ops.object.vertex_group_set_active(group='SimplyPin')
			bpy.ops.mesh.select_all(action='SELECT')
			bpy.ops.object.vertex_group_remove_from()
			bpy.ops.mesh.select_all(action='DESELECT')
			bpy.ops.object.editmode_toggle()
		elif context.mode == "EDIT_MESH":
			bpy.ops.object.vertex_group_set_active(group='SimplyPin')
			bpy.ops.mesh.select_all(action='SELECT')
			bpy.ops.object.vertex_group_remove_from()
			bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.screen.frame_jump(1)
		bpy.context.object.modifiers["BaseSub"].show_viewport = True
		bpy.context.object.modifiers["BaseSub"].show_in_editmode = True

		return {'FINISHED'}
class SelectClothSculptBrush(bpy.types.Operator):
	bl_idname = "object.sculpt_brush"
	bl_label = "Switch to Cloth Sculpt"
	mode: StringProperty(default="STANDARD")

	def switchToSculptMode(self, context):
		bpy.ops.sculpt.sculptmode_toggle()
		bpy.ops.wm.tool_set_by_id(name="builtin_brush.Cloth")
		bpy.context.scene.tool_settings.sculpt.use_symmetry_x = False
		bpy.ops.screen.frame_jump(1)

	def execute(self, context):
		bpy.ops.object.shade_smooth()
		if self.mode == "SCULPTCLOTH":
			self.switchToSculptMode(context)
			# context.active_object.clothObjectSculpt = False

		elif self.mode == "NOCLOTH":
			bpy.ops.sculpt.sculptmode_toggle()

		return {'FINISHED'}

class SelectForceFalloff(bpy.types.Operator):
	bl_idname = "object.sculpt_brush_falloff"
	bl_label = "Select Brush Force Falloff"
	mode: StringProperty(default="RADIAL")

	def switchToSculptMode(self, context):
		bpy.ops.sculpt.sculptmode_toggle()
		bpy.ops.wm.tool_set_by_id(name="builtin_brush.Cloth")
		bpy.context.scene.tool_settings.sculpt.use_symmetry_x = False
		bpy.ops.screen.frame_jump(1)

	def execute(self, context):
		bpy.ops.object.shade_smooth()
		if self.mode == "RADIAL":
			context.active_object.brushForceFalloff = True
			bpy.data.brushes["Cloth"].cloth_force_falloff_type = 'RADIAL'
			# context.active_object.clothObjectSculpt = False
		elif self.mode == "PLANE":
			context.active_object.brushForceFalloff = False
			bpy.data.brushes["Cloth"].cloth_force_falloff_type = 'PLANE'

		return {'FINISHED'}

class SculptMaskOperator(bpy.types.Operator):
	bl_idname = "object.sculpt_brush_mask"
	bl_label = "Sculpt Mask Functions"
	mode: StringProperty(default="MASK")

	def selectMaskBrush(self, context):
		bpy.ops.wm.tool_set_by_id(name="builtin_brush.Mask")

	def invertMask(self, context):
		bpy.ops.paint.mask_flood_fill(mode='INVERT')

	def cleanMask(self, context):
		bpy.ops.paint.mask_flood_fill(mode='VALUE', value=0)

	def execute(self, context):
		if self.mode == "MASK":
			self.selectMaskBrush(context)
		elif self.mode == "INVERT":
			self.invertMask(context)
		elif self.mode == "CLEANMASK":
			self.cleanMask(context)
		return {'FINISHED'}

class SculptSubdivision(bpy.types.Operator):
	bl_idname = "object.sculpt_subdivide"
	bl_label = "Mesh Resolution Subdivide or Un-Subdivide"
	mode:StringProperty(default="SUB")
	def subdivide(self, context):
		bpy.ops.mesh.subdivide()

	def unSubdivide(self, context):
		bpy.ops.mesh.unsubdivide()

	def selectAll(self, context):
		bpy.ops.mesh.select_all(action='DESELECT')
		bpy.ops.mesh.select_all(action='SELECT')

	def switchToEdit(self, context):
		bpy.ops.object.editmode_toggle()

	def switchToSculpt(self, context):
		bpy.ops.sculpt.sculptmode_toggle()

	def execute(self, context):
		self.switchToEdit(context)
		self.selectAll(context)
		if self.mode == "SUB":
			self.subdivide(context)
		elif self.mode == "UNSUB":
			self.unSubdivide(context)
		self.switchToSculpt(context)
		return{"FINISHED"}

class SculptMeshShading(bpy.types.Operator):
	bl_idname = "object.sculpt_shade"
	bl_label = "Mesh Shader Smooth/ Flat"
	mode:StringProperty(default="SMOOTH")
	def smooth(self, context):
		bpy.ops.object.shade_smooth()

	def flat(self, context):
		bpy.ops.object.shade_flat()


	def switchToObject(self, context):
		bpy.ops.sculpt.sculptmode_toggle()

	def switchToSculpt(self, context):
		bpy.ops.sculpt.sculptmode_toggle()

	def execute(self, context):
		self.switchToObject(context)
		if self.mode == "SMOOTH":
			self.smooth(context)
		elif self.mode == "FLAT":
			self.flat(context)
		self.switchToSculpt(context)
		return{"FINISHED"}

class LoadTemplatesFromBlend(bpy.types.Operator):
	bl_idname = "scene.load_template"
	bl_label = "Load Cloth Templates"
	template_name:StringProperty(default="STANDARD")
	def loadMesh(self, context):
		# filepath = "C:/Users/g041854/Desktop/library.blend"
		addons_path = bpy.utils.user_resource('SCRIPTS', "addons")
		# print(addons_path)
		script_path = os.path.join(addons_path, "SimplyClothPro")
		# print(script_path)
		template_dir = os.path.join(script_path, "template\library.blend")
		print(template_dir)

		# name of object(s) to append or link
		obj_name = self.template_name
		# print(obj_name)
		# print(self.template_name)

		# append, set to true to keep the link to the original file
		link = False

		# link all objects starting with 'Cube'
		with bpy.data.libraries.load(template_dir, link=link) as (data_from, data_to):
			data_to.objects = [name for name in data_from.objects if name == self.template_name]

		# link object to current scene
		for obj in data_to.objects:
			if obj is not None:
				print("TRUE-------------")
				bpy.context.collection.objects.link(obj)

	def execute(self, context):
		if context.mode == "OBJECT":
			# print(self.template_name)
			self.loadMesh(context)

		return {'FINISHED'}

class AddWindToScene(bpy.types.Operator):
	bl_idname = "scene.sc_add_wind"
	bl_label = "Add Wind Force to Scene"
	bl_description ="Add Wind to your Scene and adjust with Strenght and Intensity"
	def addWindToScene(self, context):
		bpy.ops.view3d.snap_cursor_to_center()
		bpy.ops.object.effector_add(type='WIND', enter_editmode=False, align='WORLD', location=(0, 0, 0), scale=(1, 1, 1))
		bpy.ops.transform.rotate(value=-1.5708, orient_axis='X', orient_type='GLOBAL',
								 orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)), orient_matrix_type='GLOBAL',
								 constraint_axis=(True, False, False), mirror=True, use_proportional_edit=False,
								 proportional_edit_falloff='SMOOTH', proportional_size=1, use_proportional_connected=False,
								 use_proportional_projected=False)
		bpy.ops.transform.translate(value=(0, 0, 1), orient_type='GLOBAL',
									orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)), orient_matrix_type='GLOBAL',
									constraint_axis=(False, False, True), mirror=True, use_proportional_edit=False,
									proportional_edit_falloff='SMOOTH', proportional_size=1,
									use_proportional_connected=False, use_proportional_projected=False)
	def setWindProperties(self, context):
		bpy.context.object.field.strength = 7500.00

	def execute(self, context):
		self.addWindToScene(context)
		self.setWindProperties(context)
		return {'FINISHED'}
