from tkinter import *
import tkinter as tk
import os
import subprocess

GUI = tk.Tk()

# Dimensions
GUI_width = 1000
GUI_height = 400
SCREEN_width = GUI.winfo_screenwidth()
SCREEN_height = GUI.winfo_screenheight()
GUIx_coordinate = (SCREEN_width / 2) - (GUI_width / 2)
GUIy_coordinate = (SCREEN_height / 2) - (GUI_height / 2)
GUI.geometry('%dx%d+%d+%d' % (GUI_width, GUI_height, GUIx_coordinate, GUIy_coordinate))

# Font
FONT_large = ('Hack Bold', 12)
FONT_middle = ('Hack Bold', 9)

# Title and Logo
GUI.title('Password Utility')
GUI.call('wm', 'iconphoto', GUI._w, PhotoImage(file='resources/lock.png'))

# Frames
FRAME_top_left = Frame(GUI, width=730, height=400, bg='white', padx=210)
FRAME_top_right = Frame(GUI, width=270, height=400, bg='grey')
# FRAME_bottom = Frame(GUI, width=720, height=400, bg='#c5c5c5').place(x=0, y=400)

# Banner
BANNER_left_img = PhotoImage(file='resources/banner.png')
BANNER_left = Label(image=BANNER_left_img).place(x=0, y=0)


# <=========================== Button_1 ===========================> #
def PASSWORD_STORE():
    output = os.system("passtore.sh")
    Label(FRAME_top_right, bg='#242729', bd=1, font=FONT_middle,
    width=270, height=380,  anchor=NW, justify=LEFT, padx=3, textvariable=output).place(x=0, y=10)
    scrollbar = Scrollbar(FRAME_top_right, orient='vertical').place(x=250, y=10, height=380)


LOGO_1_img = PhotoImage(file='resources/encrypt.png')
LOGO_1 = Label(FRAME_top_left, image=LOGO_1_img, height=30).place(x=0, y=50)

BUTTON_1 = Button(
    FRAME_top_left, bg='black', bd=1, font=FONT_large,
    width=8, height=1, text='Password Store',
    command=PASSWORD_STORE).place(x=35, y=50)

BUTTON_1_desc = Label(
    FRAME_top_left, bg='grey', bd=2, relief='sunken', font=FONT_middle,
    width=21, height=2, anchor=NW, justify=LEFT, padx=3,
    text='Show all the sites that have passwords\nstored').place(x=210, y=50)

FRAME_top_left.grid(row=0, column=0, sticky=W)
# # <=========================== Button_2 ===========================> #
# def VIEW():
#     os.system("")
#
#
# LOGO_2_img = PhotoImage(file='resources/view.png')
# LOGO_2 = Label(FRAME_top_left, image=LOGO_2_img, width=32, height=32).place(x=210, y=100)
#
# BUTTON_2 = Button(
#     FRAME_top_left, bg='black', bd=2, font=FONT_large,
#     width=8, height=1, text='View',
#     command=VIEW).place(x=245, y=100)
#
# BUTTON_2_desc = Label(FRAME_top_left,
#     bg='grey', bd=3, relief='sunken', font=FONT_middle,
#     width=35, height=2, anchor=NW, padx=3,
#     text='View Password of a site').place(x=420, y=100)
#

# # <=========================== Button_3 ===========================> #
# def ADD():
#     os.system("")
#
#
# LOGO_3_img = PhotoImage(file='resources/add.png')
# LOGO_3 = Label(FRAME_top_left, image=LOGO_3_img, width=32, height=30).place(x=210, y=150)
#
# BUTTON_3 = Button(
#     FRAME_top_left,
#     bg='black', bd=2, font=FONT_large,
#     width=8, height=1, text='Add',
#     command=ADD).place(x=245, y=150)
#
# BUTTON_3_desc = Label(
#     FRAME_top_left, bg='grey', bd=3, relief='sunken', font=FONT_middle,
#     width=35, height=2, anchor=NW, justify=LEFT, padx=3,
#     text='Add a Password to a site').place(x=420, y=150)
#
#
# # <=========================== Button_4 ===========================> #
# def REMOVE():
#     os.system("")
#
#
# LOGO_4_img = PhotoImage(file='resources/clean.png')
# LOGO_4 = Label(FRAME_top_left, image=LOGO_4_img, width=32, height=30).place(x=2100, y=200)
#
# BUTTON_4 = Button(
#     FRAME_top_left,
#     bg='black', bd=2, font=FONT_large,
#     width=8, height=1, text='Remove',
#     command=REMOVE).place(x=245, y=200)
#
#
# BUTTON_4_desc = Label(
#     FRAME_top_left, bg='grey', bd=3, relief='sunken', font=FONT_middle,
#     width=35, height=2, anchor=NW, justify=LEFT, padx=3,
#     text='Remove a Password of a site').place(x=420, y=200)
#
#
# # <=========================== Button_5 ===========================> #
# def MODIFY():
#     os.system("")
#
#
# LOGO_5_img = PhotoImage(file='resources/decrypt.png')
# LOGO_5 = Label(FRAME_top_left, image=LOGO_5_img, width=32, height=30).place(x=210, y=250)
#
# BUTTON_5 = Button(
#     FRAME_top_left, bg='black', bd=2, font=FONT_large,
#     width=8, height=1, text='Modify',
#     command=MODIFY).place(x=245, y=250)
#
#
# BUTTON_5_desc = Label(
#     FRAME_top_left, bg='grey', bd=3, relief='sunken', font=FONT_middle,
#     width=35, height=2, anchor=NW, justify=LEFT, padx=3,
#     text='Modify a Password of a site').place(x=420, y=250)
#
#
FRAME_top_right.grid(row=0, column=1, sticky=E)
#
#
# def Button_exit():
#     exit()
#
#
# Button_exit = Button(FRAME_bottom, text="Salir", font=FONT_middle, bd=4, relief='raised', command=Button_exit)
# Button_exit.pack(padx=10, pady=10)

GUI.mainloop()
