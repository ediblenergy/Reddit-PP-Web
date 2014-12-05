use strict;
use warnings;

package Reddit::PP::Web;

use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
/;

our $VERSION = 0.01;

extends 'Catalyst';

sub init {
    __PACKAGE__->config(
        name => 'Reddit-PP-Web',
        # Disable deprecated behavior needed by old applications
        disable_component_resolution_regex_fallback => 1,
    );
    __PACKAGE__->setup;
    __PACKAGE__->meta->make_immutable;
}

1;
