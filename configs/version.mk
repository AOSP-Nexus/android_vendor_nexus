# Copyright (C) 2014  AOSP-Nexus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Export Rom Name
export VENDOR := nexus

# Version info
ROM_VERSION_BRANCH := LOLLIPOP
ROM_VERSION_BUILD := R1.4

VERSION := $(ROM_VERSION_BRANCH)-$(ROM_VERSION_BUILD)

export ROM_VERSION := $(VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.$(VENDOR).version=$(ROM_VERSION_BRANCH)-$(ROM_VERSION_BUILD)
