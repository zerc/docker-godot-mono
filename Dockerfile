FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && apt-get install -y tzdata gnupg ca-certificates wget unzip python3 git git-lfs \
    && ln -fs /usr/share/zoneinfo/Europe /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt-get update && apt-get install -y mono-devel nuget \
    && rm -rf /var/lib/apt/lists/*

ENV GODOT_VERSION "3.2.3"

RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/Godot_v${GODOT_VERSION}-stable_mono_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${GODOT_VERSION}.stable.mono \
    && unzip Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64.zip \
    && mv Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64/Godot_v${GODOT_VERSION}-stable_mono_linux_headless.64 /usr/local/bin/godot \
    && mv Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64/* /usr/local/bin/ \
    && unzip Godot_v${GODOT_VERSION}-stable_mono_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.stable.mono \
    && rm -f Godot_v${GODOT_VERSION}-stable_mono_export_templates.tpz Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64.zip
