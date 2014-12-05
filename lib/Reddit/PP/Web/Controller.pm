package Reddit::PP::Web::Controller;

use strict;
use warnings;

use base 'Catalyst::Controller';

use Moose;
use Data::Dumper::Concise;
use namespace::autoclean;

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;
    $c->response->body( Dumper( $c->stash->{reddit_port} ) );
}

__PACKAGE__->meta->make_immutable;
