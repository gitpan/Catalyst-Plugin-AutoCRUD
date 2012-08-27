package Catalyst::Plugin::AutoCRUD::View::JSON;
{
  $Catalyst::Plugin::AutoCRUD::View::JSON::VERSION = '2.122400';
}

use strict;
use warnings FATAL => 'all';

use base 'Catalyst::View::JSON';

__PACKAGE__->config(
    expose_stash => 'json_data',
);

1;
