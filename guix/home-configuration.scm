;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list "git"
                                            "ripgrep"
                                            "xinit"
                                            "xhost"
                                            "htop"
					    "btop"
                                            "gccmakedep"
                                            "gcc-toolchain"
                                            "binutils"
                                            "clang"
					    "perl"
                                            "pinentry-rofi"
                                            "rofi"
                                            "picom"
                                            "qutebrowser"
                                            "gst-plugins-ugly"
                                            "gst-plugins-good"
                                            "gst-plugins-base"
                                            "gst-plugins-bad"
                                            "gst-libav"
                                            "gparted"
                                            "p7zip"
                                            "unzip"
                                            "ntfs-3g"
                                            "vim"
					    "bat"
                                            "kitty"
                                            "nyxt"
                                            "arandr"))))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
