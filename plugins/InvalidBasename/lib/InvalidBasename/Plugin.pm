# This software is released under the MIT License,
# Copyright (c) 2014 Yuichi Oikawa
#
package InvalidBasename::Plugin;

use strict;
use warnings;

use base qw(MT::Plugin);

use vars qw( $VERSION $OLD_VERSION $SCHEMA_VERSION );
$VERSION = '1.00';


use MT;
use InvalidBasename::L10N;
use Data::Dumper;

my $plugin = InvalidBasename::Plugin->new({
	id => 'invalidbasename',
	key => __PACKAGE__,
	name => 'InvalidBasename',
	l10n_class => 'InvalidBasename::L10N',
	description => '<__trans phrase="Invalid the same basename of entries in websites/blogs.">',
	settings => new MT::PluginSettings([
	]),
	version => $VERSION,
});

sub init_registry {
	my ($plugin) = @_;
	my $cfg = MT->config;
	$plugin->registry({
    applications => {
      cms => {
        callbacks => {
          'cms_save_filter.entry' => '$InvalidBasename::InvalidBasename::CMS::Entry::pre_save',
        },
      },
    },
	});
}

sub instance {
	$plugin;
}

sub t {
	my $plugin = shift;
	$plugin->translate(@_);
}

1;
