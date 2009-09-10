package SparkX::Form::Field::Radio;

# ABSTRACT: A set of radio buttons for SparkX::Form

use Moose;
use HTML::Tiny;

extends 'Spark::Form::Field';
with 'Spark::Form::Field::Role::Printable::HTML',
  'Spark::Form::Field::Role::Printable::XHTML';

has '+value' => (
    isa => 'Str',
);

has options => (
    isa      => 'ArrayRef',
    is       => 'rw',
    required => 0,
    lazy     => 1,
    default  => sub { return shift->value },
);

sub to_html {
    return shift->_render(HTML::Tiny->new(mode => 'html'));
}

sub to_xhtml {
    return shift->_render(HTML::Tiny->new(mode => 'xml'));
}

sub _render {
    my ($self, $html) = @_;
    return join(
        " ",
        map {
            $html->input({
                    type  => 'radio',
                    value => $_,
                    ($self->value eq $_ ? (checked => 'checked') : ()),
                    name => $self->name,
                })
          } @{$self->options}
    );
}
__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 METHODS

=head2 to_html() => Str

Renders the field(s) to html

=head2 to_xhtml() => Str

Renders the field(s) to xhtml

=head2 validate() => Bool

Validates the field. Before composition with validators, always returns 1.

=head1 SEE ALSO

L<SparkX::Form> - The forms module this is to be used with
L<SparkX::Form::BasicFields> - A collection of fields for use with C<Spark::Form>

=cut
