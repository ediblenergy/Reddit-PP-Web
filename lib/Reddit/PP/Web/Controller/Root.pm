use strict;
use warnings;

package Reddit::PP::Web::Controller::Root;

use base 'Reddit::PP::Web::Controller';

use Moose;

sub base : CaptureArgs(0) : PathPart('') : Chained('/') {
    my ( $self, $ctx ) = @_;
    $ctx->stash->{reddit_port} = ['base'];
}

sub base_index : Args(0) : PathPart('') : Chained('base') {
    my ( $self, $ctx ) = @_;
    push @{ $ctx->stash->{reddit_port} }, 'base_index';
}


1;
