# This software is released under the MIT License,
# Copyright (c) 2014 Yuichi Oikawa
#
package MT::Plugin::InvalidBasename;

use strict;
use warnings;

use MT;
use InvalidBasename::Plugin;

MT->add_plugin( InvalidBasename::Plugin->instance() );

1;
