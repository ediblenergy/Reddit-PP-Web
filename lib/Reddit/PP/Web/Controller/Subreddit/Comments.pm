use strict;
use warnings;

package Reddit::PP::Web::Controller::Subreddit::Comments;


use base 'Catalyst::Controller';
use Moose;
use namespace::autoclean;

# /r/$subreddit_name/comments midpoint
sub base : CaptureArgs(0) : PathPart('comments') : ChainedParent {
    my ( $self, $ctx ) = @_;
    push @{ $ctx->stash->{reddit_port} }, '::Subbredit::Comments->base';
}

# /r/$subreddit_name/comments endpoint
sub browse : Args(0) : PathPart('') : Chained('base') {
    my ( $self, $ctx ) = @_;
    push @{ $ctx->stash->{reddit_port} }, "::Subbredit::Comments->browse";
}

# /r/$subreddit_name/comments/$post_id endpoint
sub view : Args(1) : PathPart('comments') : Chained('/subreddit/base') {
    my ( $self, $ctx, $post_id ) = @_;
    push @{ $ctx->stash->{reddit_port} },
      "::Subbredit::Comments->view post_id: $post_id";
}

# /r/$subreddit_name/comments/$post_id/$post_canonical_title endpoint
sub with_title_base : CaptureArgs(2) : PathPart('comments') :
  Chained('/subreddit/base') {
    my ( $self, $ctx, $post_id, $post_canonical_title ) = @_;

#validate that $post->canonical_title eq $post_canonical_title, so dont resolve nonsense URLs,
#then call the shortform.
    push @{ $ctx->stash->{reddit_port} },
      "::Subbredit::Comments->with_title_base post_id: $post_id"
      . " post_canonical_title: $post_canonical_title";
    return $self->view( $ctx, $post_id );
}

sub with_title : Args(0) : PathPart('') : Chained('with_title_base') {
    my($self,$ctx) = @_;
    push @{ $ctx->stash->{reddit_port} },
      "::Subbredit::Comments->with_title";
    #validate that $post->canonical_title eq $post_canonical_title, so dont resolve nonsense URLs,
    #then call the shortform.
}

sub permalink_view : Args(1) : PathPart('') Chained('with_title_base') {
    my ( $self, $ctx, $comment_id ) = @_;
    push @{ $ctx->stash->{reddit_port} },
      "::Subbredit::Comments->permalink_view comment_id: $comment_id";
}

__PACKAGE__->meta->make_immutable;
1;
