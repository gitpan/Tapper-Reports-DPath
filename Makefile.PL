
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Extended DPath functionality for Tapper reports",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "Class::C3" => 0,
    "MRO::Compat" => 0,
    "Tapper::Schema::TestTools" => 0,
    "Test::Deep" => 0,
    "Test::Fixture::DBIC::Schema" => 0,
    "Test::More" => "0.88"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-Reports-DPath",
  "EXE_FILES" => [],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::Reports::DPath",
  "PREREQ_PM" => {
    "CHI" => 0,
    "Cwd" => 0,
    "Data::DPath" => 0,
    "Data::DPath::Path" => 0,
    "Data::Dumper" => 0,
    "Data::Structure::Util" => 0,
    "DateTime" => 0,
    "File::ShareDir" => 0,
    "HTML::Mason" => 0,
    "JSON" => 0,
    "Module::Find" => "0.11",
    "Moose" => 0,
    "Sub::Exporter" => 0,
    "Tapper::Model" => 0,
    "Template" => 0,
    "Template::Stash" => 0,
    "Text::Balanced" => 0,
    "YAML::XS" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.0.2",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



