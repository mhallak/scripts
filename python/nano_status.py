#!/usr/bin/python
import os
import time
import curses

def main():
    try:
        os.system("tegrastats --stop")
        os.system("tegrastats --interval 1000 --logfile tegrastats.log &")
        stdscr = curses.initscr()
        curses.start_color()
        file = "tegrastats.log"
        print("starting...")
        time.sleep(2.1)
        while True:
            with open(file, "rb") as f:
                first = f.readline()        # Read the first line.
                f.seek(-2, os.SEEK_END)     # Jump to the second last byte.
                while f.read(1) != b"\n":   # Until EOL is found...
                    f.seek(-2, os.SEEK_CUR) # ...jump back the read byte plus one more.
                last = f.readline()         # Read last line.
            ram = "RAM: " + (str(last).split("RAM "))[1].split("/")[0] + "/3963MB    "
            
            try:
                # This will throw an error if there is no swap
                swap = "SWAP: " + (str(last).split("SWAP"))[1].split("/")[0] + "/" + (str(last).split("/"))[2].split("MB")[0] + "MB    "
                noswap = 0
            except Exception:
                noswap = 1
                
            cpus = (str(last).split("CPU ["))[1].split("] EMC_FREQ")[0].split(",")
            gpu = "GPU:" + (str(last).split("GR3D_FREQ "))[1].split("%")[0] + "%     "
            cpu_temp = "CPU TEMP: " + (str(last).split("CPU@"))[1].split("C PMIC@")[0] + "C    "
            gpu_temp = "GPU TEMP: " + (str(last).split("GPU@"))[1].split("C AO@")[0] + "C    "
            thermal = "THERMAL: " + (str(last).split("thermal@"))[1].split("C POM_5V")[0] + "C    "

            cpu_txt = []
            cpu_val = []
            for cpu in cpus:
		if cpu != "off":
                    cpu_txt.append(cpu.split("@")[0] + " at " + cpu.split("@")[1] + "MHz")
                    cpu_val.append(float(cpu.split("%")[0]))


            stdscr.refresh()

            curses.init_pair(1, curses.COLOR_RED, curses.COLOR_WHITE) #red
            curses.init_pair(2, curses.COLOR_GREEN, curses.COLOR_BLACK) #green
            curses.init_pair(3, curses.COLOR_BLACK, curses.COLOR_WHITE) #title
            stdscr.addstr(0,0, "   NVIDIA JETSON NANO STATS   ", curses.color_pair(3))

            if int((str(last).split("RAM "))[1].split("/")[0]) > 3000:
                stdscr.addstr(1, 0, ram, curses.color_pair(1))
            else:
                stdscr.addstr(1, 0, ram + "    ", curses.color_pair(2))

            if noswap == 0:
                if int((str(last).split("SWAP"))[1].split("/")[0]) > 3000:
                    stdscr.addstr(2, 0, swap, curses.color_pair(1))
                else:
                    stdscr.addstr(2, 0, swap + "    ", curses.color_pair(2))

            if cpu_val[0] > 70:
                stdscr.addstr(3, 0, "CPU 1: " + cpu_txt[0] + "", curses.color_pair(1))
            else:
                stdscr.addstr(3, 0, "CPU 1: " + cpu_txt[0] + "   ", curses.color_pair(2))

            if cpu_val[1] > 70:
                stdscr.addstr(4, 0, "CPU 2: " + cpu_txt[1] + "", curses.color_pair(1))
            else:
                stdscr.addstr(4, 0, "CPU 2: " + cpu_txt[1] + "   ", curses.color_pair(2))

            #if cpu_val[2] > 70:
            #    stdscr.addstr(5, 0, "CPU 3: " + cpu_txt[2] + "", curses.color_pair(1))
            #else:
            #    stdscr.addstr(5, 0, "CPU 3: " + cpu_txt[2] + "   ", curses.color_pair(2))

            #if cpu_val[3] > 70:
            #    stdscr.addstr(6, 0, "CPU 4: " + cpu_txt[3] + "", curses.color_pair(1))
            #else:
            #    stdscr.addstr(6, 0, "CPU 4: " + cpu_txt[3] + "   ", curses.color_pair(2))

            if float((str(last).split("GR3D_FREQ "))[1].split("%")[0]) > 70:
                stdscr.addstr(7, 0, gpu, curses.color_pair(1))
            else:
                stdscr.addstr(7, 0, gpu, curses.color_pair(2))

            if float((str(last).split("CPU@"))[1].split("C PMIC@")[0]) > 50:
                stdscr.addstr(8, 0, cpu_temp, curses.color_pair(1))
            else:
                stdscr.addstr(8, 0, cpu_temp, curses.color_pair(2))

            if float((str(last).split("GPU@"))[1].split("C AO@")[0]) > 50:
                stdscr.addstr(9, 0, gpu_temp, curses.color_pair(1))
            else:
                stdscr.addstr(9, 0, gpu_temp, curses.color_pair(2))

            if float((str(last).split("thermal@"))[1].split("C POM_5V")[0]) > 50:
                stdscr.addstr(10, 0, thermal, curses.color_pair(1))
            else:
                stdscr.addstr(10, 0, thermal, curses.color_pair(2))

            stdscr.move(12,0)
            stdscr.refresh()
            time.sleep(1.1)
    finally:
        curses.endwin()
        os.system("rm tegrastats.log")

if __name__ == '__main__':
    main()
