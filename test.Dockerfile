# Use the official ROS2 Humble image as a base
FROM osrf/ros:humble-desktop-full

# Set the workspace
WORKDIR /opt/workspace

# Update and upgrade the system
RUN echo "Updating and upgrading the system..." && \
    apt-get update && apt-get upgrade -y

# Install any python tools
RUN echo "Installing Python tools..." && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    python3-pip \
    python3-colcon-common-extensions

# Install ros tools
RUN echo "Installing ROS tools..." && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    ros-humble-moveit* \
    ros-dev-tools \
    ros-humble-ecl-build \
    ros-humble-ackermann-msgs \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-sophus \
    ros-humble-kinematics-interface \
    ros-humble-ros-testing \
    ros-humble-diagnostic-updater \
    ros-humble-camera-calibration-parsers \
    ros-humble-kinematics-interface-kdl \
    ros-humble-asio-cmake-module \
    ros-humble-plotjuggler-ros \
    ros-humble-tf2-eigen \
    ros-humble-realtime-tools

# Install additional dependencies
RUN echo "Installing additional dependencies..." && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    libpoco-dev \
    libprotobuf-dev \
    libasio-dev \
    libcurlpp-dev \
    libunwind-dev \
    libceres-dev \
    protobuf-compiler \
    nlohmann-json3-dev \
    bash-completion \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libnlopt* \
    clang-format-12 \
    nano \
    vim \
    python3-colcon-common-extensions \
    python3-pip


# Install pip packages
RUN echo "Installing pip packages..." && \
    pip3 install pre-commit psycopg2-binary pyads trimesh pytest pytest-cov coverage coverage-lcov
 
# Source the ROS2 setup script
RUN /bin/bash -c "source /opt/ros/humble/setup.bash"

# Set the git credentials settings
RUN echo "Configuring git settings..." && \
    git config --global credential.helper cache

# Source ROS 2 and enable colcon autocomplete
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc && \
    echo "source /workspace/install/setup.bash" >> /root/.bashrc && \
    echo "source /etc/bash_completion" >> /root/.bashrc && \
    echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> /root/.bashrc && \
    echo "export _colcon_cd_root=/opt/ros/humble/" >> /root/.bashrc

# Keep the container running
CMD ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && tail -f /dev/null"]
