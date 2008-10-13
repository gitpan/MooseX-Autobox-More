package MooseX::Autobox::More;
use Moose;
use Moose::Autobox ();

use namespace::clean -except => 'meta';

our $VERSION = '0.01';

sub import {
	Moose::Autobox->mixin_additional_role(ARRAY => 'MooseX::Autobox::More::Array');
}

__PACKAGE__

__END__

=pod

=head1 NAME

MooseX::Autobox::More - Imports additional useful methods to Moose::Autobox

=head1 SYNOPSIS
    
	use Moose::Autobox;
	use MooseX::Autobox::More;
	
	[ [ 1 .. 5 ], [[ 6 .. 10]] ]->smash;   # [ 1 .. 10 ]
	
	[ { key1 => 'val1', key2 => 'val2' }, { key3 => 'val3', key4 => 'val4' },
	  { key5 => 'val5', key6 => 'val6' }, { key7 => 'val7', key8 => 'val8' },
	]->reduce(sub { $_[0]->merge($_[1]) });
	
	#  { key1 => 'val1', key2 => 'val2', key3 => 'val3', key4 => 'val4',
	# key5 => 'val5', key6 => 'val6', key7 => 'val7', key8 => 'val8' },

=head1 DESCRIPTION

This package provides additional methods not included in L<Moose::Autobox>.  More methods will be added over time.

=head1 METHODS

see public methods in L<MooseX::Autobox::More::Array>

=head1 AUTHOR

Michael Swearingen <mswearingen@gmail.com>

with help from:

Chris (peregrin) Prather

Ricardo (rjbs) Signes

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
