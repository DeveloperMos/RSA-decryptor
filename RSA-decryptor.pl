#!/usr/bin/perl

use Crypt::RSA;

use Crypt::RSA::ES::OAEP;

use Crypt::RSA::Key::Private;

use Crypt::RSA::Key;

use Math::Pari ':int';

use Crypt::RSA;

my $rsa = new Crypt::RSA;

my $keychain = new Crypt::RSA::Key;
my ($public, $private) = $keychain->generate (
                                'p' => '97513779050322159297664671238670850085661086043266591739338007321',
                                'q' => '77506098606928780021829964781695212837195959082370473820509360759',
                                'e' => '65537',
                             ) or die $keychain->errstr();

my $plaintext = $rsa->decrypt (
         Cyphertext => "-----BEGIN COMPRESSED RSA ENCRYPTED MESSAGE-----
         ......
         -----END COMPRESSED RSA ENCRYPTED MESSAGE-----",
         Key => $private,
         Armour => 1,
                ) or die $rsa->errstr();

print $plaintext;
