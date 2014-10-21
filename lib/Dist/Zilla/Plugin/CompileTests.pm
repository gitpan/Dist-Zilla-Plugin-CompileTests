# 
# This file is part of Dist-Zilla-Plugin-CompileTests
# 
# This software is copyright (c) 2009 by Jerome Quelin.
# 
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
# 
package Dist::Zilla::Plugin::CompileTests;
our $VERSION = '0.1.2';

# ABSTRACT: common tests to check syntax of your modules

use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

no Moose;
__PACKAGE__->meta->make_immutable;
1;






=pod

=head1 NAME

Dist::Zilla::Plugin::CompileTests - common tests to check syntax of your modules

=head1 VERSION

version 0.1.2

=head1 SYNOPSIS

In your dist.ini:

    [CompileTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
the following files:

=over 4

=item * t/00-compile.t - a standard test to check syntax of bundled modules

=back 

This test will find all modules and scripts in your dist, and try to
compile them one by one. This means it's a bit slower than loading them
all at once, but it will catch more errors.

This plugin does not accept any option.



=head1 AUTHOR

  Jerome Quelin

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Jerome Quelin.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 



__DATA__
___[ t/00-compile.t ]___
#!perl

use strict;
use warnings;

use Test::More;
use File::Find::Rule;

my @modules = File::Find::Rule->relative->file->name('*.pm')->in('lib');
my @scripts = glob "bin/*";

plan tests => scalar(@modules) + scalar(@scripts);
    
foreach my $file ( @modules ) {
    my $module = $file;
    $module =~ s/[\/\\]/::/g;
    $module =~ s/\.pm$//;
    is( qx{ $^X -M$module -e "print '$module ok'" }, "$module ok", "$module loaded ok" );
}
    
SKIP: {
    eval "use Test::Script; 1;";
    skip "Test::Script needed to test script compilation", scalar(@scripts) if $@;
    foreach my $file ( @scripts ) {
        my $script = $file;
        $script =~ s!.*/!!;
        script_compiles_ok( $file, "$script script compiles" );
    }
}