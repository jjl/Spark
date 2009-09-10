package Spark::Form::Field::Role::Printable::XHTML;
our $VERSION = '0.0300';


# ABSTRACT: a XHTML1-printable form field role

use Moose::Role;
with 'Spark::Form::Field::Role::Printable';

requires 'to_xhtml';

1;



=pod

=head1 NAME

Spark::Form::Field::Role::Printable::XHTML - a XHTML1-printable form field role

=head1 VERSION

version 0.0300

=head1 SYNOPSIS

 package MyApp::Form::Field::CustomText;
 use Moose;
 extends 'Spark::Form::Field';
 with 'Spark::Form::Field::Role::Printable::XHTML';
 use HTML::Tiny;

 sub to_xhtml {
     my ($self) = @_;
     my $html = HTML::Tiny->new( mode => 'xml' );
     $html->input({type => 'text', value => $self->value});
 }

=head1 METHODS

=head2 to_xhtml :: Undef => Str

This function should return a XHTML string representing your control

=head1 SEE ALSO

L<Spark::Form::Field>



=head1 AUTHOR

  James Laver L<http://jameslaver.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by James Laver C<< <sprintf qw(%s@%s.%s cpan jameslaver com)> >>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 



__END__

