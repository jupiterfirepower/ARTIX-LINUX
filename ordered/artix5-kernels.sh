sudo pacman -Syy

# Kernels
sudo pacman -S --noconfirm linux-zen linux-zen-headers
sudo pacman -S --noconfirm linux-hardened linux-hardened-headers
# sudo pacman -S --noconfirm linux-xanmod-edge linux-xanmod-edge-headers

# conntrack parameters
yes | sudo \cp -ivf ./config/modprobe.d/nf_conntrack.conf /etc/modprobe.d/nf_conntrack.conf
yes | sudo \cp -ivf ./config/modprobe.d/no-conntrack-helper.conf /etc/modprobe.d/no-conntrack-helper.conf

sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet\"/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet loglevel=0 udev.log_level=0 vt.global_cursor_default=0 nowatchdog msr.allow_writes=on pcie_aspm=force module.sig_unenforce intel_idle.max_cstate=1 cryptomgr.notests initcall_debug intel_iommu=igfx_off no_timer_check noreplace-smp page_alloc.shuffle=1 rcupdate.rcu_expedited=1 tsc=reliable\"/' /etc/default/grub

sudo update-grub
sudo reboot

