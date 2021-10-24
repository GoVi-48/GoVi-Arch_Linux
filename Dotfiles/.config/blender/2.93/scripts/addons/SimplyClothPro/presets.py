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


def set_templates(self, context):
    # print("SET TEMPLATE")
    template = templatesList[self.templates]
    for key in template:
        # print(preset[key])
        setattr(self, key, template[key])
        # print(template[key])
        bpy.ops.scene.load_template(template_name=self.templates)

    for obj in context.scene.objects:
        if obj.name_full == self.templates:
            # obj.select_set(action='SELECT')
            bpy.context.view_layer.objects.active = obj
            obj.select_set(True)
        else:
            obj.select_set(False)
def set_preset(self, context):
    # print("Update Presets")
    preset = presets[self.presets]
    for key in preset:
        # print(preset[key])
        setattr(self, key, preset[key])

    # bpy.ops.screen.frame_jump(1)

def set_brush(self, context):
    if(self.brushes == "MASK"):
        bpy.ops.wm.tool_set_by_id(name="builtin_brush.Mask")
        bpy.context.object.brush_name = self.brushes
    else:
        bpy.ops.wm.tool_set_by_id(name="builtin_brush.Cloth")
        bpy.data.brushes["Cloth"].cloth_deform_type = self.brushes
        bpy.context.object.brush_name = self.brushes

templatesList = {"FEMALEUNDERWARE": {
    "template_name": "FEMALEUNDERWARE"
},
    "HOTPANTS": {
        "template_name": "HOTPANTS"
    },
    "BRA": {
        "template_name": "BRA"
    },
    "BRA2": {
        "template_name": "BRA2"
    },
    "BRA3": {
        "template_name": "BRA3"
    },
    "FEMALESHORT": {
        "template_name": "FEMALESHORT"
    },
    "FEMALESHORT2": {
        "template_name": "FEMALESHORT2"
    },
    "FEMALESKIRT": {
        "template_name": "FEMALESKIRT"
    },
    "FEMALESKIRTLONG": {
        "template_name": "FEMALESKIRTLONG"
    },
    "FEMALEPANTS": {
        "template_name": "FEMALEPANTS"
    },
    "DRESS": {
        "template_name": "DRESS"
    },
    "FEMALESWIMSUIT": {
        "template_name": "FEMALESWIMSUIT"
    },
    "FEMALESWIMSUIT2": {
        "template_name": "FEMALESWIMSUIT2"
    },
    "FEMALESWIMSUIT3": {
        "template_name": "FEMALESWIMSUIT3"
    },
    "DRESSLONG": {
        "template_name": "DRESSLONG"
    },
    "DRESSLONG2": {
        "template_name": "DRESSLONG2"
    },
    "DRESSVERYLONG": {
        "template_name": "DRESSVERYLONG"
    },
    "DRESSSTYLE": {
        "template_name": "DRESSSTYLE"
    },
    "FEMALESHIRT": {
        "template_name": "FEMALESHIRT"
    },
    "FEMALESHIRTLONG": {
        "template_name": "FEMALESHIRTLONG"
    },
    "MALETUNDERWARE": {
        "template_name": "MALETUNDERWARE"
    },
    "MALESSHORTS": {
        "template_name": "MALESSHORTS"
    },
    "MALESSHORTSSHORT": {
        "template_name": "MALESSHORTSSHORT"
    },
    "MALESSHORTSLONG": {
        "template_name": "MALESSHORTSLONG"
    },
    "MALEPANTS": {
        "template_name": "MALEPANTS"
    },
    "MALETANK": {
        "template_name": "MALETANK"
    },
    "MALETANK2": {
        "template_name": "MALETANK2"
    },
    "MALETSHIRT": {
        "template_name": "MALETSHIRT"
    },
    "MALESHIRT": {
        "template_name": "MALESHIRT"
    },
    "MALESHIRTWIDE": {
        "template_name": "MALESHIRTWIDE"
    },
    "MALEPULLOVER": {
        "template_name": "MALEPULLOVER"
    },
    "BELT": {
        "template_name": "BELT"
    },
    "MASK": {
        "template_name": "MASK"
    },
    "CAP": {
        "template_name": "CAP"
    },
    "PILLOW": {
        "template_name": "PILLOW"
    },
    "PILLOWLONG": {
        "template_name": "PILLOWLONG"
    },
    "TOWEL": {
        "template_name": "TOWEL"
    },
    "TOWELROUND": {
        "template_name": "TOWELROUND"
    }
}

presets = {"STANDARD": {
    "stiffness_slider": 50,
    "wrinkle_slider": 50,
    "weight_slider": 0.5,
    "fold_slider": 0,
    "shrink_slider": 0,
    "pressure": False,
    "internal_spring": False,
    "cloth_sewing": False,
    "preset_name": "Standard"
    },
    "COTTON": {
        "stiffness_slider": 50,
        "wrinkle_slider": 95,
        "weight_slider": 0.3,
        "fold_slider": 5,
        # "pressure": False,
        # "shrink_slider": 0,
        # "internal_spring": False,
        "preset_name": "Cotton"
    },
    "DENIM": {
        "stiffness_slider": 40,
        "wrinkle_slider": 75,
        "weight_slider": 1,
        # "pressure": False,
        # "fold_slider":0.1,
        # "shrink_slider": 0,
        # "internal_spring": False,
        "preset_name": "Denim"
    },
    "LEATHER": {
        "stiffness_slider": 100,
        "wrinkle_slider": 0.1,
        "weight_slider": 0.4,
        # "fold_slider":0.1,
        # "shrink_slider": 0,
        # "pressure": False,
        # "internal_spring": False,
        "preset_name": "Leather"
    },
    "RUBBER": {
        "stiffness_slider": 34,
        "wrinkle_slider": 0.1,
        "weight_slider": 3,
        "fold_slider": 0.1,
        # "pressure": False,
        # "shrink_slider":0,
        # "internal_spring": False,
        "preset_name": "Rubber"
    },
    "SILK": {
        "stiffness_slider": 20,
        "wrinkle_slider": 100,
        "weight_slider": 0.10,
        "fold_slider": 0.1,
        # "pressure": False,
        # "shrink_slider":0,
        # "internal_spring": False,
        "preset_name": "Silk"
    },
    "WOOL": {
        "stiffness_slider": 4,
        "wrinkle_slider": 85,
        "weight_slider": 0.1,
        "fold_slider": 3,
        # "pressure": False,
        # "shrink_slider":0,
        # "internal_spring": False,
        "preset_name": "Wool"
    },
    "ELASTIC_SMOOTH": {
        "stiffness_slider": 2,
        "wrinkle_slider": 70,
        "weight_slider": 0.5,
        "fold_slider": 0.1,
        # "pressure": False,
        "shrink_slider": -0.15,
        # "internal_spring": False,
        "preset_name": "Elastic Smooth"
    },
    "CREASE": {
        "stiffness_slider": 100,
        "wrinkle_slider": 96,
        "weight_slider": 1,
        "fold_slider": 15,
        # "pressure":False,
        "shrink_slider": -0.15,
        # "internal_spring": False,
        "preset_name": "Crease"
    },
    "PRESSURE": {
        # "stiffness_slider": 2,
        # "wrinkle_slider": 100,
        # "weight_slider": 0.15,
        # "fold_slider": 5,
        "shrink_slider": -0.15,
        "pressure": True,
        "pressure_intensity_slider": 2,
        "pressure_factor_slider": 2,
        # "internal_spring": False,
        "preset_name": "Pressure"
    },
    "SHRINK_PRESSURE": {
        # "stiffness_slider": 5,
        # "wrinkle_slider": 100,
        # "weight_slider": 0.3,
        # "fold_slider": 5,
        "shrink_slider": -0.15,
        "pressure": True,
        "pressure_intensity_slider": -2.0,
        "pressure_factor_slider": 2.0,
        # "internal_spring": False,
        "preset_name": "Shrink Pressure"
    },
    "STIFF_SMOOTH": {
        "stiffness_slider": 100,
        "wrinkle_slider": 10,
        "weight_slider": 0.15,
        "fold_slider": 5,
        "shrink_slider": 0,
        # "pressure":False,
        # "pressure_intensity_slider":0.0,
        # "pressure_factor_slider":1.0,
        # "internal_spring": False,
        "preset_name": "Stiff Smooth"
    },
    "HEAVY_SILK": {
        "stiffness_slider": 10,
        "wrinkle_slider": 100,
        "weight_slider": 1,
        "fold_slider": 1,
        "shrink_slider": 0,
        # "pressure":False,
        # "pressure_intensity_slider":0.0,
        # "pressure_factor_slider":1.0,
        # "internal_spring": False,
        "preset_name": "Heavy Silk"
    },
    "SPRING": {
        # "stiffness_slider": 10,
        # "wrinkle_slider": 100,
        # "weight_slider": 1,
        # "fold_slider": 1,
        # "shrink_slider": 0,
        # "pressure":False,
        # "pressure_intensity_slider":0.0,
        # "pressure_factor_slider":1.0,
        "internal_spring": True,
        "spring_intensity_slider": 1,
        "preset_name": "Spring Standard"
    },
    "STIFF_PAPER": {
        "stiffness_slider": 20,
        "wrinkle_slider": 66,
        "weight_slider": 0.1,
        "fold_slider": 10,
        "shrink_slider": 0,
        # "pressure":False,
        # "pressure_intensity_slider":0.0,
        # "pressure_factor_slider":1.0,
        # "internal_spring": False,
        # "spring_intensity_slider": 1,
        "preset_name": "Stiff Paper"
    },
    "CRUMPLE_PAPER": {
        "stiffness_slider": 60,
        "wrinkle_slider": 2,
        "weight_slider": 0.25,
        "fold_slider": 90,
        "shrink_slider": 0.05,
        # "pressure":False,
        # "pressure_intensity_slider":0.0,
        # "pressure_factor_slider":1.0,
        # "internal_spring": False,
        # "spring_intensity_slider": 1,
        "preset_name": "Crumple Paper"
    }
}

# modifiers["SimplyCloth"].settings.uniform_pressure_force
# bpy.context.object.stiffness_slider = 30
# bpy.context.object.fold_slider = 0.1
# bpy.context.object.wrinkle_slider = 95
# bpy.context.object.shrink_slider = 0
# if "simplySmooth" in context.active_object.modifiers:
#     bpy.context.object.modifiers["simplySmooth"].iterations = 0
# bpy.context.object.cloth_sewing = False
# bpy.context.object.modifiers["SimplyCloth"].settings.sewing_force_max = 2
# bpy.context.object.internal_spring = False
# bpy.context.object.pressure = False
# bpy.context.object.active_thickness = False
# bpy.context.object.advanced_settings = False
