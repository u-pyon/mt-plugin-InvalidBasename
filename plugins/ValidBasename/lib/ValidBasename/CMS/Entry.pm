package ValidBasename::CMS::Entry;

use strict;
use warnings;

use MT;
use MT::Log;
use ValidBasename::Plugin;
use Data::Dumper;

sub pre_save {
  my ($cb, $app) = @_;
  my $q = $app->param;
  my $basename = $q->param('basename');
  my $plugin = $app->component('validbasename');
  my $terms = {blog_id => $app->param('blog_id')};
  $terms->{basename} = $basename;
  return $app->error(
    $plugin->translate('The same basename exists.'))
    if defined $app->model('entry')->load($terms);
  1;
}

1;
