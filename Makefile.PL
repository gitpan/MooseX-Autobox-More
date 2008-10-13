use strict;
use warnings;
use inc::Module::Install;

name 'MooseX-Autobox-More';
license 'perl';

all_from 'lib/MooseX/Autobox/More.pm';

requires 'Moose'          => '0.42';
requires 'Moose::Autobox' => 0;

test_requires 'Test::More'      => '0.62';
test_requires 'Test::Exception' => '0.21';

auto_provides;
WriteAll;