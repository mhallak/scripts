#!/bin/bash
echo 1 | sudo -S nvpmodel -q #--verbose
# echo 1 | sudo -S nvpmodel -m 0
# echo 1 | sudo hwclock --systohc
# echo 1 | sudo jetson_clocks

echo "Load CPU"
cd ~/git/CPULoadGenerator
./set_load_90_imp.bash 0.9  3600 &
echo "Load GPU"
cd ~/cuda-samples/NVIDIA_CUDA-10.0_Samples/2_Graphics/Mandelbrot
gnome-terminal --name="1julia" -- bash -c 'cd ~/cuda-samples/NVIDIA_CUDA-10.0_Samples/2_Graphics/Mandelbrot;./Mandelbrot mode=1; exit'
sleep 1
gnome-terminal --name="2julia" -- bash -c 'cd ~/cuda-samples/NVIDIA_CUDA-10.0_Samples/2_Graphics/Mandelbrot;./Mandelbrot mode=1; exit'
sleep 1
gnome-terminal --name="3julia" -- bash -c 'cd ~/cuda-samples/NVIDIA_CUDA-10.0_Samples/2_Graphics/Mandelbrot;./Mandelbrot mode=1; exit'
