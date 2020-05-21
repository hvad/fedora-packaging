FROM fedora:latest
MAINTAINER David Hannequin <david.hannequin@gmail.com>

RUN dnf update -y && dnf groupinstall -y "RPM Development Tools" && \
                     dnf -y install sudo automake make cmake vim bash && \
                     dnf -y install dnf-utils fedpkg pyp2rpm wget python3-pbr && \
                     dnf -y install keyutils rpmconf git-all python3-devel && \
                     dnf -y clean all

RUN useradd -m -g wheel -d /home/build build && sed -i -e 's/# %wheel/%wheel/g' /etc/sudoers

RUN  su - build -c "rpmdev-setuptree"

COPY vimrc /home/build/.vimrc

COPY setup.sh /home/build/setup.sh

RUN su - build -c "/bin/bash /home/build/setup.sh"

USER build

WORKDIR /home/build
