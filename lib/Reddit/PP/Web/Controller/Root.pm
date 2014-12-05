use strict;
use warnings;

package Reddit::PP::Web::Controller::Root;

use base 'Catalyst::Controller';

use Data::Dumper::Concise;

sub base : CaptureArgs(0) : PathPart('') : Chained('/') {
    my($self,$c) = @_;
    $c->stash->{reddit_port} = ['base'];
}

sub base_index : Args(0) : PathPart('') : Chained('base') {
    warn '/';
}

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;
    $c->response->body( Dumper( $c->stash->{reddit_port} ) );
}

1;
