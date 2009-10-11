
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-Plugin-CompileTests',
  NAME      => 'Dist::Zilla::Plugin::CompileTests',
  AUTHOR    => 'Jerome\ Quelin',
  ABSTRACT  => 'common\ tests\ to\ check\ syntax\ of\ your\ modules',
  VERSION   => '1.092840',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::More" => '0',
    "Dist::Zilla::Role::FileMunger" => '0',
    "English" => '0',
    "File::Find" => '0',
    "Moose" => '0',
    "Dist::Zilla::Plugin::InlineFiles" => '0',
  },
  test => {TESTS => 't/*.t'}
);

