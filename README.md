#ulibgsmmap

# The Universal Libary: GSM MAP


ulibgsmmap implements the GSM Mobile Application Part layer of SS7 according to 
ITU-T Q.700 series and the corresponding ANSI counterparts
It's  the layer6 of the ulib based universal SS7 stack
it makes use of the libraries ulib, ulibmtp3,ulibsccp, ulibtcap
It works on Linux, FreeBSD and to some extent on MacOS (due to its lacking SCTP support, 

Under Linux and FreeBSD, GNUStep is used as an underlying framework.
Under MacOS Foundation is used.



# Related #

ulibgsmmap is the base class of a family of libraries and applications .It gets used and extended by

* **ulib**     a universal library 
* **ulibsccp** a library implementing the SS7 SCCP protocol
* **ulibtcap** a library implementing the SS7 TCAP protocol
* **ulibgsmmap** a library implementing the SS7 GSM-MAP protocol
* **ulibsms**  a library implementing SMS encoding/decoding functions
* **ulibsmpp** a library to deal with the SMPP protocol
* **ulibdns** a library doing DNS functionality
* **schrittmacherclient** a library for applications to implement a hot/standby mechanism
* **schrittmacher** a system daemon dealing with applications in a hot/standby setup, making sure there is always one system hot and one is standby.
* **messagemover** a application implementing a SS7 GSM-SMSC (commercial)
* **estp** a application implementing a SS7 packet router (enhanced signaling transfer point) (commercial)
* **smsproxy** a application implementing a HLR and MSC for receiving SMS on SS7 (commercial)
* **gsm-api** a application implementing a SS7 API Server for all kinds of lookups. (commercial)

# Releases #

Release 6.0 (2026) refreshed lots of functionalities and made 
./configure easier and streamlined for other platforms and static compiles.

