# See Zones section in http://support.microsoft.com/kb/182569
# for a complete listing of security zone settings.
#
# A setting of zero sets a specific action as permitted, a setting of one
# causes a prompt to appear, and a setting of three prohibits the specific
# action.
#
#   2500  Turn on Protected Mode [Vista only setting]
#   1400  Scripting: Active scripting
#
default['ie']['internet_zone'] = {'2500' => 0, '1400' => 0}
default['ie']['local_internet_zone'] = {'2500' => 0}
default['ie']['trusted_sites_zone'] = {'2500' => 0}
default['ie']['restricted_sites_zone'] = {'2500' => 0}

default['ie']['enhanced_security_configuration'] = true
default['ie']['back_forward_cache'] = false
