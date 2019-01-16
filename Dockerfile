FROM nergnezor/gcc-arm

WORKDIR /usr/share/nRF5-SDK
RUN apt install -y unzip && \
    wget -qO nRF5-SDK.zip https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.2.0_9412b96.zip && \
    unzip nRF5-SDK.zip && \
    rm nRF5-SDK.zip

COPY Makefile.posix /usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96/components/toolchain/gcc/Makefile.posix

ENV \
    # PATH="/usr/local/gcc-arm-none-eabi-7-2018-q2-update/bin/:${PATH}:/usr/local/nRF5x/nrfjprog:/usr/local/nRF5x/mergehex" \
    SDK_ROOT="/usr/share/nRF5-SDK/nRF5_SDK_15.2.0_9412b96" 