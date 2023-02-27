#!/bin/bash

function get_os_name() {
  case "$(uname -s)" in
    Linux*)   echo "ubuntu";;
    Darwin*)  echo "mac";;
    CYGWIN*)  echo "windows";;
    MINGW*)   echo "windows";;
    *)        echo "unknown";;
  esac
}
# Set the HashiCorp product and OS values
product="$1"
os=$(get_os_name)


# Define function to download and install the latest version
function install_latest_version {
    # Get the latest release version
    version=$(curl -s https://releases.hashicorp.com/${product}/index.json | jq -r ".versions[].version" | grep -E "^[0-9.]+$" | sort -V | tail -1)
    # Download the package for the specified OS and architecture

    case $os in
        "ubuntu")
            curl -sLO https://releases.hashicorp.com/${product}/${version}/${product}_${version}_linux_amd64.zip
            unzip ${product}_${version}_linux_amd64.zip
            sudo mv ${product} /usr/local/bin/${product}
            ;;
        "mac")
            curl -sLO https://releases.hashicorp.com/${product}/${version}/${product}_${version}_darwin_amd64.zip
            unzip ${product}_${version}_darwin_amd64.zip
            sudo mv ${product} /usr/local/bin/${product}
            ;;
        "windows")
            curl -sLO https://releases.hashicorp.com/${product}/${version}/${product}_${version}_windows_amd64.zip
            unzip ${product}_${version}_windows_amd64.zip
            move ${product}.exe C:\Windows\System32
            ;;
        *)
            echo "Unsupported operating system: ${os}"
            exit 1
            ;;
    esac

    # Check the version and display a success message
    installed_version=$(${product} --version)
    if [[ "$installed_version" =~ "$version" ]]; then
        echo "Successfully installed ${product} version ${version}!"
    else
        echo "Installation failed. Current version of ${product}: ${installed_version}"
        exit 1
    fi
}

# Call the function to install the latest version
install_latest_version