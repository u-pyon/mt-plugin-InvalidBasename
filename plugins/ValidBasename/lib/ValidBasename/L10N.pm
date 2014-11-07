package ValidBasename::L10N;

use strict;
use warnings;
use base 'MT::L10N';

sub init {
    my $lh = shift;
    $lh->SUPER::init(@_);
    $lh->fail_with('mt_fallback');
    return;
}

sub mt_fallback {
    my $lh = shift;
    MT->language_handle->maketext(@_);
}

sub get_handle {
    my $this = shift;
    my ($lang) = @_;
    my $lh;



    eval { $lh = $this->SUPER::get_handle($lang) ||
        $this->SUPER::get_handle('en_us'); };
    if (!$@ && $lh) {
        return $lh;
    }
    return MT->language_handle;
}

1;

