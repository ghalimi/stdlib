#/
# @license Apache-2.0
#
# Copyright (c) 2019 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#/

# VARIABLES #

# Define the path of the executable:
LIST_PACKAGE_TYPES ?= $(TOOLS_PKGS_DIR)/pkgs/types/bin/cli

# Define the command flags:
LIST_PACKAGE_TYPES_FLAGS ?=


# TARGETS #

# List all packages containing TypeScript declarations.
#
# This target prints a list of all packages containing TypeScript declarations.

list-pkgs-types: $(LIST_PACKAGE_TYPES) $(NODE_MODULES)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(NODE) $(LIST_PACKAGE_TYPES) $(LIST_PACKAGE_TYPES_FLAGS) $(SRC_DIR)

.PHONY: list-pkgs-types

# List all packages without TypeScript declarations.
#
# This target prints a newline-delimited list of all packages without TypeScript declarations.

list-pkgs-without-types:
	$(QUIET) comm -23 <($(MAKE) -f $(this_file) list-lib-pkgs | sort) <($(MAKE) -f $(this_file) list-pkgs-types | sort)

.PHONY: list-pkgs-without-types
