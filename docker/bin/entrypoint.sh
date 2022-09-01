#!/bin/bash

set -e

. /tools/asdf/asdf.sh
. /tools/asdf/completions/asdf.bash

install-plugins.sh
asdf current

${@:-zsh}
