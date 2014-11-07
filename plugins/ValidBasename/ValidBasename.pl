# This software is released under the MIT License,
# Copyright (c) 2014 Yuichi Oikawa
#
package MT::Plugin::ValidBasename;

use strict;
use warnings;

use MT;
use ValidBasename::Plugin;

MT->add_plugin( ValidBasename::Plugin->instance() );

1;
