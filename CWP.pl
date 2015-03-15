#!/usr/bin/perl

use lib "/var/services/homes/ian/CloudStation/Projects";

use CGI;
use WWW::Mechanize;
use HTML::TreeBuilder;
use Kyloe::CWP::Connector;

my $calendars  = 
	{
        'Laura Hendry'       =>  {staffid => '20108436',	password => '170882',			altsummary=>['CODE'], summary=>['DEP','-','ARR']},
    };
    
foreach $name (keys %$calendars)  
	{

	my $cwp = Kyloe::CWP::Connector->new();
	
	$cwp->login($calendars->{$name}->{staffid},$calendars->{$name}->{password}) or die "Login failed\n";
	$cwp->writeICS($calendars->{$name});
	undef $cwp;
	}

1;
  