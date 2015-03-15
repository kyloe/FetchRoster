#!/usr/bin/perl

use CGI;
use WWW::Mechanize;
use HTML::TreeBuilder;
use Kyloe::Raido::Connector;
 
# Example URL: http://www.kyloe.net/dance/public/cal/999.ics    

my $calendars = 
	{
     	'Andy Forey' 	=>  {staffid => '094', 	password => 'cptnrd1',                	checkin=>'yes',altsummary=>['CODE'],summary=>['DEP','-','ARR']},
	'Ian Bottomley'		=>  {staffid => 115, 	password => 'test',	checkin=>'yes',	altsummary=>['CODE'],summary=>['CODE',' ','DEP','-','ARR'],altfilename=>'115'},
	'Paul Blackler'		=>  {staffid => 104, 	password => '104',	checkin=>'yes',	altsummary=>['CODE'],summary=>['CODE',' ','DEP','-','ARR']},
	'Jamie McDonald' 	=>  {staffid => 101, 	password => 'test',	checkin=>'yes',	altsummary=>['CODE'],summary=>['CODE',' ','DEP','-','ARR']},
     	'Murray Gibbons' 	=>  {staffid => 117, 	password => '117',                	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
     	'Ashely Eagles' 	=>  {staffid => '058', 	password => 'roster',             	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
     	'Dawn Hunter' 		=>  {staffid => '074', 	password => 'test',               	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Brian Moher'       =>  {staffid => '1014',	password => 'cba321',             	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Scott Menzies'     =>  {staffid => '1022',	password => 'test',             	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Ronan Milne'       =>  {staffid => '046',	password => 'rmilne',             	altsummary=>['CODE','-','DEP'],summary=>['DEP','-','ARR']},
        'Rebecca Simpson'   =>  {staffid => '025',	password => 'test',	checkin=>'yes',	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Ian Hammond'       =>  {staffid => '032',	password => '032',			altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Conor Convey'       =>  {staffid => '1018',	password => 'abc234',			altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Jonnie Stewart'       =>  {staffid => '1033',	password => 'test',			altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'James Workman'       =>  {staffid => '106',	password => 'abc227',	checkin=>'yes',	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Sarah Hendry'       =>  {staffid => '021',	password => 'test',	checkin=>'yes',	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
        'Rob Hendry'       =>  {staffid => '1015',	password => 'dba234',	checkin=>'yes',	altsummary=>['CODE'],summary=>['DEP','-','ARR']},
};

my $calendarsx  = 
	{
		'Ian Bottomley'		=>  {staffid => 115, 	password => 'test',	checkin=>'yes',	altsummary=>['CODE'],summary=>['CODE',' ','DEP','-','ARR']},
	};
  
foreach $name (keys %$calendars)  
	{

	my $raido = Kyloe::Raido::Connector->new();
	
	$raido->login($calendars->{$name}->{staffid},$calendars->{$name}->{password}) or die "Login failed\n";
	$raido->getRoster or die "Couldn't retrieve current roster page\n";
	$raido->getNextMonth or die "Could not retrieve next months roster\n";
	$raido->parseRoster('TREE') or die "Could not parse main roster\n";
	$raido->parseRoster('TREE_2') or die "Could not parse next months roster\n";
	
	$raido->writeICS($calendars->{$name});
	undef $raido;
	}

1;
  






  
