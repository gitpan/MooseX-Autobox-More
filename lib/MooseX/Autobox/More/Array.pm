package MooseX::Autobox::More::Array;
use Moose::Role;

use namespace::clean -except => 'meta';

use List::Util ();

sub _smash { 
	my ($array) = @_;
	
	CORE::map { ref eq q[ARRAY] ? _smash( @$_ ) : $_ } @_;
}

sub smash { 
	my ($array) = @_;	
	
	[ _smash($array) ];
}

sub reduce {
	my ($array, $sub) = @_; 
	List::Util::reduce { $sub->($a, $b) } @$array;	
}

__PACKAGE__

__END__

=pod

=head1 NAME

MooseX::Autobox::Role::Array - Role to add array functions to Moose::Autobox

=head1 SYNOPSIS
    

	[ [ 1 .. 5 ], [[ 6 .. 10]] ]->smash;   # [ 1 .. 10 ]
	
	[ 	{ key1 => 'val1', key2 => 'val2' }, { key3 => 'val3', key4 => 'val4' }, 
		{ key5 => 'val5', key6 => 'val6' }, { key7 => 'val7', key8 => 'val8' },
	]->reduce(sub { $_[0]->merge($_[1]) }),
	
	# { key1 => 'val1', key2 => 'val2', key3 => 'val3', key4 => 'val4', 
	# key5 => 'val5', key6 => 'val6', key7 => 'val7', key8 => 'val8' }, 

=head1 DESCRIPTION

This role provides additional array methods not included in Moose::Autobox.  More methods will be added over time.

=head1 METHODS

=over 4

=item smash

Does a Perl6 style flattening of AoA structures.

=item reduce

Autoboxes the List::Util implementation of reduce.

=back

=head1 AUTHOR

Michael Swearingen <mswearingen@gmail.com>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
