use strict;
use warnings;

package Foo;
use Moose;
use Moose::Autobox;
use MooseX::Autobox::More;

package main;
use Test::More 'no_plan';
use Data::Dumper;

is_deeply(
[ 1 .. 10 ]->smash,
[ 1 .. 10 ],
'... got return from smash');

is_deeply(
[ [ 1 .. 5 ], [[ 6 .. 10 ]] ]->smash,
[ 1 .. 10 ],
'... got return from smash');

ok([ 1 .. 10]->reduce(sub { $_[0] + $_[1] }) == 55, '... got numeric reduce');

is_deeply(
[ { key1 => 'val1', key2 => 'val2' }, { key3 => 'val3', key4 => 'val4' },
  { key5 => 'val5', key6 => 'val6' }, { key7 => 'val7', key8 => 'val8' },
]->reduce(sub { $_[0]->merge($_[1]) }), 
  { key1 => 'val1', key2 => 'val2', key3 => 'val3', key4 => 'val4',
    key5 => 'val5', key6 => 'val6', key7 => 'val7', key8 => 'val8' }, 
'... got hashref reduce');