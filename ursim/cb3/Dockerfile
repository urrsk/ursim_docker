# Define the version as an argument
ARG VERSION=latest

FROM universalrobots/ursim_cb3:${VERSION}

# Download the latest release of the URCap from GitHub
RUN LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/UniversalRobots/Universal_Robots_ExternalControl_URCap/releases/latest | \
    grep "browser_download_url.*\.jar" | \
    awk -F '"' '{print $4}') && \
    echo "Latest release URL: $LATEST_RELEASE_URL" && \
    curl -L -o /urcaps/external_control.jar $LATEST_RELEASE_URL

# Mount ~/programs -> /ursim/programs
# docker run --rm -it -v "${HOME}/programs:/ursim/programs" .
