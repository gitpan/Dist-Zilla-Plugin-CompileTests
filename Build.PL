
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
                       'dist_abstract' => 'common tests to check syntax of your modules',
                       'script_files' => [],
                       'license' => 'perl',
                       'build_requires' => {
                                             'Test::More' => '0.88',
                                             'Scalar::Util' => '0',
                                             'English' => '0',
                                             'File::Find' => '0',
                                             'File::Temp' => '0',
                                             'Module::Build' => '0.3601',
                                             'Carp' => '0'
                                           },
                       'dist_name' => 'Dist-Zilla-Plugin-CompileTests',
                       'dist_author' => [
                                          'Jerome Quelin'
                                        ],
                       'module_name' => 'Dist::Zilla::Plugin::CompileTests',
                       'requires' => {
                                       'perl' => '5.008',
                                       'Dist::Zilla::Role::FileMunger' => '0',
                                       'Dist::Zilla::Plugin::InlineFiles' => '0',
                                       'Moose' => '0'
                                     },
                       'recommends' => {},
                       'configure_requires' => {
                                                 'Module::Build' => '0.3601'
                                               },
                       'dist_version' => '1.101600'
                     );


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
