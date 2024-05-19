;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (nongnu packages nvidia)
             (nongnu services nvidia))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (kernel linux-lts)
  (firmware (list linux-firmware))
  (initrd microcode-initrd)
  (locale "en_US.utf8")
  (timezone "Europe/Madrid")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "test")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "petro")
                  (comment "Petro")
                  (group "users")
                  (home-directory "/home/petro")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list (specification->package "awesome")
                          (specification->package "nss-certs"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service xfce-desktop-service-type)

                 ;; To configure OpenSSH, pass an 'openssh-configuration'
                 ;; record as a second argument to 'service' below.
                 (service openssh-service-type)
                 (set-xorg-configuration
                  (xorg-configuration (keyboard-layout keyboard-layout))))

           ;; This is the default list of services we
           ;; are appending to.
           %desktop-services))
  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets (list "/dev/sda"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "f6bbf3ea-45c5-4934-9228-9e4d586aac0b")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "c216c216-f7ac-469a-8da7-7e66f8779c43"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
