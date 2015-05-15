#!/usr/bin/perl

use lib "/var/services/homes/ian/CloudStation/Projects";

use CGI;
use WWW::Mechanize;
use HTML::TreeBuilder;
use Kyloe::CWP::Connector;

my $calendars  = 
	{
        'Laura Hendry'       =>  {staffid => '20108436',	password => '170882',	checkin=>'yes',	altsummary=>['CODE'], summary=>['DEP','-','ARR']},
        'Sarah Hendry'       =>  {staffid => '20109916',	password => '291182',	checkin=>'yes',	altsummary=>['CODE'], summary=>['DEP','-','ARR']},
    };
    
foreach $name (keys %$calendars)  
	{

	my $cwp = Kyloe::CWP::Connector->new();
	# 	print "Process ".$calendars->{$name}."\n";
	$cwp->login($calendars->{$name}->{staffid},$calendars->{$name}->{password}) or die "Login failed\n";
	$cwp->writeICS($calendars->{$name});
	undef $cwp;
	}

1;
  