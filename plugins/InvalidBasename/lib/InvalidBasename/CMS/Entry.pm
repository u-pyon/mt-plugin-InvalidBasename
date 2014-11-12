package InvalidBasename::CMS::Entry;

use strict;
use warnings;

use MT;
use MT::Log;
use InvalidBasename::Plugin;
use Data::Dumper;

sub pre_save {
  my ($cb, $app) = @_;
  my $q = $app->param;
  my $basename = $q->param('basename');
  my $plugin = $app->component('invalidbasename');
  my $terms = {blog_id => $app->param('blog_id')};
  $terms->{basename} = $basename;
  my $entry = $app->model('entry')->load($terms);
  return 1 unless defined $entry;
  my $id = $q->param('id') || undef;
  return 1 if defined $id and $id == $entry->id;
  return $app->error(
    $plugin->translate('The same basename exists.'));
  1;
}

1;
