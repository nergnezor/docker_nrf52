FROM nergnezor/gcc-arm

ENV GNU_VERSION=7.2.1
ENV GNU_NAME=gcc-arm-none-eabi-7-2017-q4-major

WORKDIR /usr/share/nRF5-SDK

RUN apt install -y unzip && \
    wget -qO nRF5-SDK.zip https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.2.0_9412b96.zip && \
    unzip nRF5-SDK.zip && \
    rm nRF5-SDK.zip && \
    sed -i "s|gcc-arm-none-eabi-6-2017-q2-update|${GNU_NAME}|g" /usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96/components/toolchain/gcc/Makefile.posix && \
    sed -i "s|6.3.1|${GNU_VERSION}|g" /usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96/components/toolchain/gcc/Makefile.posix

ENV SDK_ROOT="/usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96" 