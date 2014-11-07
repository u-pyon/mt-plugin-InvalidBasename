# This software is released under the MIT License,
# Copyright (c) 2014 Yuichi Oikawa
#
package ValidBasename::Plugin;

use strict;
use warnings;

use base qw(MT::Plugin);

use vars qw( $VERSION $OLD_VERSION $SCHEMA_VERSION );
$VERSION = '1.00';


use MT;
use ValidBasename::L10N;
use Data::Dumper;

my $plugin = ValidBasename::Plugin->new({
	id => 'validbasename',
	key => __PACKAGE__,
	name => 'ValidBasename',
	l10n_class => 'ValidBasename::L10N',
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
          'cms_save_filter.entry' => '$ValidBasename::ValidBasename::CMS::Entry::pre_save',
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
