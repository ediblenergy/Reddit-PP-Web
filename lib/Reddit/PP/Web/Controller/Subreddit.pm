use strict;
use warnings;

package Reddit::PP::Web::Controller::Subreddit;

use namespace::autoclean;

use base 'Reddit::PP::Web::Controller';

use Moose;


# /r/$subreddit_name midpoint
sub base : CaptureArgs(1) : PathPart('r') : Chained('/root/base') {
    my( $self, $ctx, $subreddit_name ) = @_;
    push @{ $ctx->stash->{reddit_port} },
      "::Subbredit->base, subreddit_name: $subreddit_name";
}

# /r redirect
sub base_index : Args(0) : PathPart('') : Chained('base') {
    my( $self, $ctx ) = @_;
    push @{ $ctx->stash->{reddit_port} }, '::Subbredit->base_index';
    return $ctx->response->redirect($ctx->uri_for('/subreddits/base_index'));
}

__PACKAGE__->meta->make_immutable;
1;
