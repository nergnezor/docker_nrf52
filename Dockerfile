FROM nergnezor/gcc-arm

WORKDIR /usr/share/nRF5-SDK

RUN apt install -y unzip && \
    wget -qO nRF5-SDK.zip https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.2.0_9412b96.zip && \
    unzip nRF5-SDK.zip && \
    rm nRF5-SDK.zip && \
    sed -i "s|gcc-arm-none-eabi-6-2017-q2-update|${GNU_NAME}|g" /usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96/components/toolchain/gcc/Makefile.posix && \
    sed -i "s|6.3.1|${GNU_VERSION}|g" /usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96/components/toolchain/gcc/Makefile.posix
ENV SDK_ROOT="/usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96" 

RUN curl https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRFCommandLineTools1021Linuxamd64tar.gz -o nrftools.tar.gz && \
	tar -xvzf nrftools.tar.gz ./nRF-Command-Line-Tools_10_2_1_Linux-amd64.tar.gz && \
	rm nrftools.tar.gz && \
	tar -xvzf nRF-Command-Line-Tools_10_2_1_Linux-amd64.tar.gz ./mergehex && \
	rm nRF-Command-Line-Tools_10_2_1_Linux-amd64.tar.gz
ENV PATH="/mergehex:/nrfjprog:$PATH"
