FROM fedora:latest
MAINTAINER David Hannequin <david.hannequin@gmail.com>

RUN dnf update -y && dnf groupinstall -y "RPM Development Tools" && \
                     dnf -y install sudo automake make cmake vim bash && \
                     dnf -y install dnf-utils fedpkg pyp2rpm && \
                     dnf -y install keyutils rpmconf git-all && \
                     dnf -y clean all

RUN useradd -m -g wheel -d /home/build build && sed -i -e 's/# %wheel/%wheel/g' /etc/sudoers                     

USER build

WORKDIR /home/build

CMD ["rpmdev-setuptree"]
