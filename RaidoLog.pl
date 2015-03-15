#!/usr/bin/perl

use CGI;
use WWW::Mechanize;
use HTML::TreeBuilder;
use Kyloe::Raido::VoyageReport;
use DBI;


#my $dbh = DBI->connect("dbi:PgPP:dbname=logbook","logbook","logbook") or die "Could not connect to database";
 
my $calendars  = 
	{
		'Ian Bottomley' =>  {staffid => 115, password => 'test'},
	};
  
foreach $name (keys %$calendars)  
	{

	my $raido = Kyloe::Raido::VoyageReport->new();
	
	$raido->login($calendars->{$name}->{staffid},$calendars->{$name}->{password}) or die "Login failed\n";
	$raido->getIndexPage();
	$raido->getVoyageIDs();
	
	undef $raido;
	}
  





