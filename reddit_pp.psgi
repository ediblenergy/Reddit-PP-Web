use strict;
use warnings;

use Plack::Builder;
use FindBin;

use lib "$FindBin::Bin/lib";

use Reddit::PP::Web;
Reddit::PP::Web->init;

builder {
    Reddit::PP::Web->psgi_app(@_);
};


# vim: set et fenc=utf-8 ff=unix sts=0 sw=4 ts=4 ft=perl :
