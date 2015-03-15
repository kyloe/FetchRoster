#!/usr/bin/perl

use CGI;
#use WWW::Scripter;  
use WWW::Mechanize;

use HTML::TreeBuilder;
use Kyloe::Raido::Connector;
   
 
 
my $calendars  = 
	{
		'Ian Bottomley' =>  {staffid => 115, password => 'test',checkin=>'yes',summary=>['CODE','DEP','->','ARR']},
	};
#
#print "Start\n";
#
#$w = new WWW::Scripter;
#print "Use\n";
#
#$w->use_plugin('Ajax');  # packaged separately
#print "Get\n";
#print $w->known_agent_aliases();
#
#$w->agent_alias( 'Windows IE 6' ); 
#	   
#$w->get('https://raido.loganair.co.uk/raido/');
#
#print "Click\n";
#
##$->eval('WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(\'btnSub\', \'\', true, \'\', \'\', false, false))');
##$->eval('document.getElementsByName('btnSub').click()');
##sleep(10);
#
##print $w->content; # returns the HTML content, possibly modified
# 
#
#
#my $mech = WWW::Mechanize::Firefox->new(create, tab => 'Raido', activate);
#
#$mech->get('https://raido.loganair.co.uk/raido/');
#$mech->form_name('form1');
#$mech->set_fields(
#    txtUserName => '115',
#    txtPassword => 'test',
#);
#  
##$mech->eval_in_page('alert("Hello Firefox")');   
#$mech->click( 'btnSub' );
#while (!$mech->is_visible('ctl00$CPHcontent$btnNext'))
#	{
#		sleep(1);
#	}
#$mech->eval_in_page('alert("Hello")');   
#	
#sleep(10);

  
  
foreach $name (keys %$calendars)  
	{
	print "New connector\n";
	
	my $raido = Kyloe::Raido::Connector->new();

	print "Login\n";

	
	$raido->login($calendars->{$name}->{staffid},$calendars->{$name}->{password}) or die "Login failed\n";
	print "Next month\n";
	$raido->getNextMonth or die "Could not get JSON\n";
	print "Undef\n";

	undef $raido;
	}
  






  