sudo apt upgrade
sudo systemctl set-default multi-user.target
sudo reboot

sudo apt reinstall xserver-xorg-video-amdgpu
sudo apt update --fix-missing

sudo update-initramfs -u

sudo apt reinstall firmware-realtek

sudo update-initramfs -u

dpkg -l |grep amdgpu

sudo apt remove --purge fgirx*
sudo apt remove --purge xserver-xorg-video-ati
sudo apt remove --purge xserver-xorg-video-amdgpu
sudo apt remove libdrm-amdgpu1:i386

sudo apt install --reinstall
sudo apt install --reinstall libgl1-mesa-glx libgl1-mesa-dri xserver-xorg-core

sudo dpkg-reconfigure xserver-xorg
sudo update-initramfs -u
sudo update-grub

sudo apt-get install --reinstall firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all
sudo reboot

sudo systemctl set-default multi-user.target
sudo systemctl isolate graphical.target
# 失败

cat /var/log/Xorg.0.log | grep '(EE)'

#   (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
# [  1172.091] (EE) Failed to load module "amdgpu" (module does not exist, 0)

ls /lib/modules/$(uname -r)/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
# /lib/modules/6.1.0-16-amd64/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko

sudo apt-get install xserver-xorg-video-amdgpu
sudo update-initramfs -u
sudo reboot

startx
# 正常

nano /etc/modules-load.d/modules.conf
sudo nano /etc/modules-load.d/modules.conf

cat /etc/modprobe.d/blacklist-amdgpu.conf
# blacklist amdgpu

ls /etc/modprobe.d/
cat /etc/modprobe.d/blacklist-amdgpu.conf
sudo nano /etc/default/grub

cd /etc/modprobe.d
sudo nano blacklist-amdgpu.conf
sudo update-initramfs -u

#update-initramfs: Generating /boot/initrd.img-6.1.0-16-amd64
#W: Possible missing firmware /lib/firmware/amdgpu/ip_discovery.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/vega10_cap.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_cap.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/navi12_cap.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_11_ta.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_11_toc.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_10_ta.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/psp_13_0_10_sos.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/aldebaran_cap.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_imu.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_rlc.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_mec.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_me.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_pfp.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_rlc.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_mec.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_me.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_pfp.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_0_toc.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/sdma_6_0_3.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_mes1.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/sienna_cichlid_mes.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/navi10_mes.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_mes1.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_mes_2.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_4_mes.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_mes1.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_mes_2.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_3_mes.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_2_mes_2.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_1_mes_2.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/gc_11_0_0_mes_2.bin for module amdgpu
#W: Possible missing firmware /lib/firmware/amdgpu/smu_13_0_10.bin for module amdgpu

sudo systemctl set-default graphical.target
