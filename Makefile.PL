
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-Plugin-CompileTests',
  NAME      => 'Dist::Zilla::Plugin::CompileTests',
  AUTHOR    => 'Jerome\ Quelin',
  ABSTRACT  => 'common\ tests\ to\ check\ syntax\ of\ your\ modules',
  VERSION   => '0.1.1',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "File::Find::Rule" => '0',
    "Test::More" => '0',
    "Test::Script" => '0',
    "Moose" => '0',
    "Dist::Zilla::Plugin::InlineFiles" => '0',
  },
);
