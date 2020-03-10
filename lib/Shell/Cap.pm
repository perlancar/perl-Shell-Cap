package Shell::Cap;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict 'vars', 'subs';
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(
    shell_supports_pipe
);

sub shell_supports_pipe {
    require ShellQuote::Any::PERLANCAR;

    my $cmd = join(
        " ",
        ShellQuote::Any::PERLANCAR::shell_quote($^X),
        "-e", ShellQuote::Any::PERLANCAR::shell_quote("print 2"),
        "|",
        ShellQuote::Any::PERLANCAR::shell_quote($^X),
        "-e", ShellQuote::Any::PERLANCAR::shell_quote("print <STDIN>*3"),
    );
    `$cmd` == 6 ? 1:0;
}

1;
#ABSTRACT: Probe shell's capabilities

=head1 SYNOPSIS


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 shell_supports_pipe

Check whether shell supports pipe syntax.


=head1 SEE ALSO

The C<SHELL> environment variable.

=cut
