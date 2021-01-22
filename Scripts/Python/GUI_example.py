import tkinter
from tkinter import *

# path = sys.path[0]
# GUI.iconphoto(True, PhotoImage(file=os.path.join(program_directory, "test.png")))

GUI = Tk()
GUI_width = 720
GUI_height = 455
GUI.resizable(width=False, height=False)

Screen_width = GUI.winfo_screenwidth()
Screen_height = GUI.winfo_screenheight()
GUIx_coordinate = (Screen_width / 2) - (GUI_width / 2)
GUIy_coordinate = (Screen_height / 2) - (GUI_height / 2)
GUI.geometry('%dx%d+%d+%d' % (GUI_width, GUI_height, GUIx_coordinate, GUIy_coordinate))

GUI.iconphoto(True, PhotoImage(file='/Media/GoVi/Proyectos/Python/resources/Pass/lock.png'))
GUI.title('Password Utility')

Font_large = ('Arial Bold', 14)
Font_middle = ('Arial Bold', 10)

frame_left = Frame(GUI, width=184, height=400, bg='white')
frame_left.grid(column=0, row=0, sticky=W)
frame_center = Frame(GUI, width=540, height=400, bg='white')
frame_center.grid(column=1, row=0, sticky=W)
frame_bottom = Frame(GUI, width=550, height=50)
frame_bottom.grid(column=1, row=1, sticky=E)

Banner = PhotoImage(file='/Media/GoVi/Proyectos/Python/resources/Kodi/Kodi_bg.gif')
banner = Label(frame_left, image=Banner, width=184, height=400).grid()
banner_2 = Label(frame_center, bg='lightgrey', width=400, height=2).place(x=0, y=0)

Button_1 = Button(frame_center, bg='black', bd=0, font=Font_large, text='Password Store',
                  width=8, height=1).place(x=5, y=50)
Button_1_desc = Label(frame_center, width=35, height=2, bd=1, relief='sunken', font=Font_middle,
                      text='Show all the sites that have passwords\nstored',
                      anchor=NW, justify=LEFT, padx=2).place(x=200, y=50)

Button_2 = Button(frame_center, bg='black', bd=0, font=Font_large, text='Show Password',
                  width=8, height=1).place(x=5, y=100)
Button_2_desc = Label(frame_center, width=35, height=2, bd=1, relief='sunken', font=Font_middle,
                      text='Show Password of a site',
                      anchor=NW, justify=LEFT, padx=2).place(x=200, y=100)
#
# Button_3 = Button(frame_center, bg='white', bd=0, font=Font_large, text='Restaurar',
#                   width=18, height=1).place(x=0, y=230)
# Button_3_desc = Label(frame_center, width=35, height=3, bd=4, relief='sunken', font=Font_middle,
#                       text='Restaura Kodi a la versión anterior.\nLa de la copia de Seguridad. Si se desea, se\npuede '
#                            'restaurar su versión original.',
#                       anchor=NW, justify=LEFT, padx=2).place(x=200, y=230)
#
# Button_4 = Button(frame_center, bg='white', bd=0, font=('Arial Bold', 18), text='Instalar',
#                   width=12, height=1).place(x=10, y=330)
# Button_4_desc = Label(frame_center, width=35, height=3, bd=4, relief='sunken', font=Font_middle,
#                       text='Instala la versión de Kodi preconfigurada con:\nSkin Estuary GoVi + Selección de Add-ons.',
#                       anchor=NW, justify=LEFT, padx=2).place(x=200, y=320)
#
# Icon_1 = PhotoImage(file='/Media/GoVi/Proyectos/Python/resources/Kodi/Clean.png')
# icon_1 = Label(frame_center, bg='white', image=Icon_1, width=30, height=30).place(x=3, y=50)
# Icon_2 = PhotoImage(file='/Media/GoVi/Proyectos/Python/resources/Kodi/Backup.png')
# icon_2 = Label(frame_center, bg='white', image=Icon_2, width=30, height=30).place(x=5, y=140)
# Icon_3 = PhotoImage(file='/Media/GoVi/Proyectos/Python/resources/Kodi/Restore.png')
# icon_3 = Label(frame_center, bg='white', image=Icon_3, width=30, height=30).place(x=5, y=230)
# Icon_4 = PhotoImage(file='/Media/GoVi/Proyectos/Python/resources/Kodi/Install.png')
# icon_4 = Label(frame_center, bg='white', image=Icon_4, width=30, height=30).place(x=5, y=330)
#
#
# def Button_exit():
#     exit()
#
#
# Button_exit = Button(frame_bottom, text="Salir", font=Font_middle, bd=4, relief='raised', command=Button_exit)
# Button_exit.pack(padx=10, pady=10)

GUI.mainloop()
