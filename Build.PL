
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
                       'dist_abstract' => 'common tests to check syntax of your modules',
                       'script_files' => [],
                       'license' => 'perl',
                       'build_requires' => {},
                       'dist_name' => 'Dist-Zilla-Plugin-CompileTests',
                       'dist_author' => [
                                          'Jerome Quelin'
                                        ],
                       'module_name' => 'Dist::Zilla::Plugin::CompileTests',
                       'requires' => {
                                       'English' => '0',
                                       'perl' => '5.008',
                                       'Test::More' => '0',
                                       'Dist::Zilla::Role::FileMunger' => '0',
                                       'File::Find' => '0',
                                       'File::Temp' => '0',
                                       'Dist::Zilla::Plugin::InlineFiles' => '0',
                                       'Moose' => '0'
                                     },
                       'configure_requires' => {},
                       'dist_version' => '1.100740'
                     );


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
