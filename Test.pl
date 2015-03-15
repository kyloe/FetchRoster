#!/usr/bin/perl

use CGI;
use WWW::Mechanize;
use HTML::TreeBuilder;
use Kyloe::Raido::Connector;
 
 
my $calendars  = 
	{
		'Ian Bottomley' =>  {staffid => 115, password => 'test',checkin=>'yes',summary=>['CODE','DEP','->','ARR']},
		'Jamie McDonald' =>  {staffid => 101, password => 'test',checkin=>'yes',summary=>['CODE','DEP','->','ARR']},
		'Murray Gibbons' =>  {staffid => 117, password => '117',summary=>['DEP','->','ARR','CODE']}
	};
  
foreach $name (keys %$calendars)  
	{

	my $raido = Kyloe::Raido::Connector->new();
	
	$raido->login($calendars->{$name}->{staffid},$calendars->{$name}->{password}) or die "Login failed\n";
	#print $name.":".$calendars->{$name}->{staffid}."\n";
	$raido->getRoster or die "Couldn't retrieve current roster page\n";
	$raido->parseRoster or die "Could not parse roster\n";
#	$raido->writeICS('/var/services/web/dance/public/cal/'.$calendars->{$name}->{staffid}.'.ics');
	$raido->writeICS($calendars->{$name});
	undef $raido;
	}
  