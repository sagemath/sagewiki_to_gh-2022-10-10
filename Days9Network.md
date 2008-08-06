= IRMACS network connections =
You have several ways of making use of the IRMACS computing facilities:

 * You can log into one of the OSX workstations, using the account information you received together with your name badge,
 * You can connect to the "irmacs" wireless network, using the account information you received together with your name badge. In case you need this information: Authentication is supposed to be 802.1x, TTLS/PAP.

In case it helps: with Linux, the following entry in {{{/etc/wpasupplicant.conf}}} seemed to work:
{{{
network={
        ssid="irmacs"
        key_mgmt=IEEE8021X
        eap=TTLS
        identity=<your IRMACS login>
        password=<your IRMACS password>
        phase2="auth=PAP"
}
}}}

 * You can connect to the campus-wide wireless networks {{{SFU}}} (authenticate in a browser) or {{{SFU-SECURE}}} (a WPA/WPA2 enterprise network using TTLS/PAP). SFU students can use their normal campus account. A guest account is available upon request.

 * People from UBC should be able to connect to {{{eduroam}}} using their UBC credentials.

 * From within IRMACS, we have a SAGE server available at [https://hydrogen.irmacs.sfu.ca:8000 https://hydrogen.irmacs.sfu.ca:8000]. You can make your own account on that server.

If you connect using {{{SFU}}}, {{{SFU-SECURE}}} or {{{eduroam}}}, you will not be inside the irmacs firewall, so {{{hydrogen}}} will not be accessible. In order to access {{{hydrogen}}}, you can make use of the [http://www.irmacs.sfu.ca/technical_support/vpn.php IRMACS VPN] (again, use IRMACS credentials to authenticate).

Under linux, vpnc 0.5.1 seems to work well (probably better than Cisco's own vpnclient software, but I did not try). Configuration goes in {{{/etc/vpnc/default.conf}}}:
{{{
IPSec gateway portal.irmacs.sfu.ca
IPSec ID KerbGroup
IPSec obfuscated secret 440FD5657B03F5C1A39AE2F3865AC5BE45CF5C1C1A4B3493AA954B2294AE7FA99B628E6DA7DB407A473305A8037A7E7384B484ED796AB9D9
NAT Traversal Mode cisco-udp
Xauth username <IRMACS user name>
}}}

If you only want your traffic to IRMACS computers tunnelled, you have to configure a "split" network, and you probably want to keep your original DNS as well. The following settings could go somewhere in {{{/etc/vpnc/vpnscript}}} (let me know if you know a more elegant solution!):
{{{
CISCO_SPLIT_INC=1                    #-- number of networks in split-network-list
CISCO_SPLIT_INC_0_ADDR=142.58.52.0   #-- network address
CISCO_SPLIT_INC_0_MASK=255.255.254.0 #-- subnet mask (for example: 255.255.255.0)
CISCO_SPLIT_INC_0_MASKLEN=23         #-- subnet masklen (for example: 24)
CISCO_SPLIT_INC_0_PROTOCOL=0         #-- protocol (often just 0)
CISCO_SPLIT_INC_0_SPORT=0            #-- source port (often just 0)
CISCO_SPLIT_INC_0_DPORT=0            #-- destination port (often just 0)

MODIFYRESOLVCONF=''
RESTORERESOLVCONF=''
}}}
