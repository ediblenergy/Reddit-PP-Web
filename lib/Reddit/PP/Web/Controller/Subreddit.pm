use strict;
use warnings;

package Reddit::PP::Web::Controller::Subreddit;

use namespace::autoclean;

use base 'Catalyst::Controller';
use Moose;


# /r/$subreddit_name midpoint
sub base : CaptureArgs(1) : PathPart('r') : Chained('/root/base') {
    my( $self, $ctx, $subreddit_name ) = @_;
    warn '/r_base';
}

# /r redirect
sub base_index : Args(0) : PathPart('r') : Chained('/root/base') {
    my( $self, $ctx ) = @_;
    warn '/r';
    return $ctx->response->redirect($ctx->uri_for('/subreddits/base_index'));
}

__PACKAGE__->meta->make_immutable;
1;
