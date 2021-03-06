# Copyright (C) 2014 The SaberMod Project
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
#

GRAPHITE_FLAGS := $(call cc-option,$(-fgraphite -floop-flatten -floop-parallelize-all -ftree-loop-linear -floop-interchange -floop-strip-mine -floop-block))

# Only use graphite if using SaberMod toolchain.  Allow any version of SaberMod with the wildcard symbol.
ifneq ($(filter (SaberMod%), $(shell $(TARGET_CC) --version)),)
ifdef LOCAL_CFLAGS
LOCAL_CFLAGS += $(GRAPHITE_FLAGS)
else
LOCAL_CFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += $(GRAPHITE_FLAGS)
else
LOCAL_CPPFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef $(combo_2nd_arch_prefix)TARGET_arm_CFLAGS
$(combo_2nd_arch_prefix)TARGET_arm_CFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_2nd_arch_prefix)TARGET_arm_CFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef $(combo_2nd_arch_prefix)TARGET_thumb_CFLAGS
$(combo_2nd_arch_prefix)TARGET_thumb_CFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_2nd_arch_prefix)TARGET_thumb_CFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef $(combo_2nd_arch_prefix)TARGET_GLOBAL_CPPFLAGS
$(combo_2nd_arch_prefix)TARGET_GLOBAL_CPPFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_2nd_arch_prefix)TARGET_GLOBAL_CPPFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef $(combo_2nd_arch_prefix)TARGET_RELEASE_CPPFLAGS
$(combo_2nd_arch_prefix)TARGET_RELEASE_CPPFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_2nd_arch_prefix)TARGET_RELEASE_CPPFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef $(combo_var_prefix)GLOBAL_CFLAGS
$(combo_var_prefix)GLOBAL_CFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_var_prefix)GLOBAL_CFLAGS := $(GRAPHITE_FLAGS)
endif

ifdef $(combo_var_prefix)RELEASE_CFLAGS
$(combo_var_prefix)RELEASE_CFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_var_prefix)RELEASE_CFLAGS := $(GRAPHITE_FLAGS)
endif 

ifdef $(combo_var_prefix)GLOBAL_CPPFLAGS
$(combo_var_prefix)GLOBAL_CPPFLAGS += $(GRAPHITE_FLAGS)
else
$(combo_var_prefix)GLOBAL_CPPFLAGS := $(GRAPHITE_FLAGS)
endif
endif
#####
