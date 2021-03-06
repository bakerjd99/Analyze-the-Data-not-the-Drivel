 
[Parsing the Bitcoin Genesis Block with J](https://bakerjd99.wordpress.com/2014/07/03/parsing-the-bitcoin-genesis-block-with-j/)
-------------------------------------------------------------------------------------------------------------------------------

*Posted: 04 Jul 2014 00:33:11*

The [genesis block](https://en.bitcoin.it/wiki/Genesis_block) is the
first block on the [Bitcoin blockchain](https://blockexplorer.com/).
Satoshi Nakamoto, the mysterious entity that created Bitcoin, mined the
genesis block on January 3, 2009. It’s been five years since the genesis
block’s birth and Satoshi [is still
unknown](https://en.wikipedia.org/wiki/Satoshi_Nakamoto), Bitcoin is
bigger than ever, and the blockchain is longer than 300,000 blocks and
growing.

One of the most important features of the blockchain is its
immutability. After the Bitcoin network accepts a block and adds it to
the blockchain *it can never be altered.* This makes Bitcoin blocks rare
durable binary artifacts. The cryptographic hash algorithms that
underpin the Bitcoin protocol enforce block immutability. If someone
decides to tinker with a block, say maliciously flip a single bit, the
block’s hash will change and the network will reject it. This is what
makes it almost impossible to counterfeit Bitcoins. Bitcoins have been
lost and stolen but they have never been successfully counterfeited.
This sharply contrasts with funny money like the US dollar that is [so
routinely and brazenly
counterfeited](https://www.npr.org/blogs/money/2013/09/05/219264902/the-world-capital-of-counterfeit-dollars)
that many suspect the US government turns a blind eye.

The exceptional durability of Bitcoin blocks, coupled with the
mysterious origins of Bitcoin, makes the genesis block one of the most
intriguing and important byte runs in the world. This post was inspired
by the now defunct post *285 bytes that changed the world.* I would love
to give you a link but this post has vanished. A secondary, but
excellent reference is John Ratcliff’s [How to Parse the Bitcoin
BlockChain](https://codesuppository.blogspot.com/2014/01/how-to-parse-bitcoin-blockchain.html).
I am adapting John’s nomenclature in what follows.

When programmers start exploring Bitcoin they often cut their teeth on
parsing the genesis block. If you Google “blockchain parsing” you’ll
find examples in dozens of programming languages. The most popular are
C, C++, Java, PHP, C\#, JavaScript, and the rest of the mainstream
suspects. What you will not find, until now, are J examples.

So what does J bring to the table that makes *yet another genesis block
parser* worth a look? Let’s take a look at Bitcoin addresses. The
following is the Bitcoin address of this blog’s tip jar. Feel free to
send as many Satoshis and full Bitcoins as you like to this address.

```J
   tip=. '17MfYvFqSyeZcy7nKMbFrStFmmvaJ143fA'
```

There is nothing deep or mysterious about this funny string of letters;
it’s just a plain old number in [Bitcoin base
58](https://en.bitcoin.it/wiki/Base58Check_encoding) clothing. So, what
is this number in standard format? Here’s how it’s calculated with J.

```J
   BASE58=. '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'
 
   dfb58=. 58x #. BASE58 i. ]
 
   dfb58 tip
1709618896654985460726422911112500711652231559804656492485
```

The second line that defines `dfb58`, (decimal from base 58), is the
complete J program! That’s it folks. You can troll the internet for days
looking at base 58 to big integer converters and it’s unlikely you will
find a shorter or more elegant conversion program. Not only is the J
version short and sweet it’s also fast and versatile. Suppose you wanted
to convert ten thousand Bitcoin addresses. The following converts ten
thousand copies of `tip`.

```J
  dfb58 10000 # ,: tip
1709618896654985460726422911112500711652231559804656492485 17096188966549854607264...
```

At this point
[fanboys](https://www.urbandictionary.com/define.php?term=fanboy) of
mainstream programming languages typically pipe up with something like,
“changing number encodings is inherently trivial; what about something
more demanding like going the other way, say converting Bitcoin public
keys to the base 58 address format?”

The public key in the genesis block is encoded in what many call the
“challenge script.” Here is the genesis block’s challenge script in hex.


    41 04 67 8A FD B0 FE 55 48 27 19 67 F1 A6 71 30 B7 10 5C D6 
    A8 28 E0 39 09 A6 79 62 E0 EA 1F 61 DE B6 49 F6 BC 3F 4C EF 
    38 C4 F3 55 04 E5 1E C1 12 DE 5C 38 4D F7 BA 0B 8D 57 8A 4C 
    70 2B 6B F1 1D 5F AC 

Public keys take a number of forms in the blockchain. John Ratcliff’s
post summarizes the many forms you will run into. The genesis block uses
the 65 byte
[ECDSA](https://blog.cloudflare.com/ecdsa-the-digital-signature-algorithm-of-a-better-internet)
form. Converting this form to base 58 requires taking `SHA-256` and
`RIPEMD-160` hashes. These hashes are available in
[OpenSSL](https://www.openssl.org/) which is conveniently distributed
with [J 8.02
JQT](https://www.jsoftware.com/jwiki/Guides/Qt%20IDE/Install). Here’s how
to convert the genesis block’s public key to base 58 with J.

```J
   load 'c:/bitjd/scripts/sslhash.ijs'

   Base58frKey65=:3 : 0

   NB.*Base58frKey65 v-- 65 byte public Bitcoin key bytes to base 58.
   NB.
   NB. monad:  clB58 =. Base58frKey65 clBytes

   ekey=. (0{a.) , sr160 s256 y
   csum=. 4 {. s256 s256 ekey
   Base58Check ekey,csum
   )

   Base58frKey65 }. }: ChallengeScript
 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa
```

The `ChallengeScript` noun holds the bytes given in hex above. The verbs
`sr150`, `s256` and `Base58Check` are available in the J scripts
[sslhash](https://github.com/bakerjd99/jacks/blob/master/bitcoin/sslhash.ijs)
and
[ParseGenesisBlock](https://github.com/bakerjd99/jacks/blob/master/bitcoin/ParseGenesisBlock.ijs)
that I have put in the [jacks](https://github.com/bakerjd99/jacks)
repository on GitHub.

The following J verb `ParseGenesisBlock` reads the first [full
node](https://bitcoin.org/en/download) Bitcoin block file and then
extracts and checks the genesis block. `ParseGenesisBlock` tests the
various verbs, (functions), it employs. As a side effect it clearly
describes the layout of the genesis block and provides test data for
anyone that’s interested.

If this post peeks your curiosity about J a good place to start learning
about the language is the recently released [New Dictionary of
J](https://www.jsoftware.com/jwiki/Vocabulary/HowNuVoc). You can download
a version of J for Windows, Linux, OS/X, IOS, and Android at
[Jsoftware’s](https://www.jsoftware.com/) main site.

```J
ParseGenesisBlock=:3 : 0

NB.*ParseGenesisBlock v-- parse and check Bitcoin genesis block.
NB.
NB. monad:  clMsg =. ParseGenesisBlock clBlockFile
NB.
NB.   file=. 'c:/bitjd/blocks/blk00000.dat'
NB.   ParseGenesisBlock file

NB. fetch genesis block data
dat=. read y

NB. first 4 bytes are "sort of" block delimiters
MagicID=: (i. offset=. 4) { dat
'MagicID mismatch' assert 'F9BEB4D9' -: ,hfd a. i. MagicID

NB. next 4 bytes gives following block length
offset=. offset + 4 [ BlockLength=: _2 ic (offset + i. 4) { dat
'BlockLength mismatch' assert 285 = BlockLength

NB. next 4 bytes block format version - has changed
offset=. offset + 4 [ VersionNumber=: _2 ic (offset + i. 4) { dat

NB. next 32 bytes is previous block hash - genesis block
NB. has no previous hash and all bytes are set to 0
offset=. offset + 32 [ PreviousBlockHash=: (offset + i. 32) { dat
'PreviousBlockHash mismatch' assert (32#0) -: a. i. PreviousBlockHash

NB. next 32 bytes is the Merkle tree root hash
offset=. offset + 32 [ MerkleRoot=: (offset + i. 32) { dat
grh=. '3BA3EDFD7A7B12B27AC72C3E67768F617FC81BC3888A51323A9FB8AA4B1E5E4A'
'MerkleRoot mismatch' assert grh -: ,hfd a. i. MerkleRoot

NB. next 4 bytes is a unix epoch timestamp - rolls over 7th feb 2106
NB. there is no timezone information - it is interpreted as utc
offset=. offset + 4 [ TimeStamp=: _2 ic (offset + i. 4) { dat
'TimeStamp mismatch' assert 2009 1 3 18 15 5 -: ,tsfrunixsecs TimeStamp

NB. next 4 bytes represents block target difficulty
offset=. offset + 4 [ TargetDifficulty=: _2 ic (offset + i. 4) { dat
'TargetDifficulty mismatch' assert 486604799 = TargetDifficulty

NB. next 4 bytes is a random number nonce
offset=. offset + 4 [ Nonce=: (offset + i. 4) { dat
'Nonce mismatch' assert '1DAC2B7C' -: ,hfd a. i. Nonce

NB. next 1 to 9 bytes is the transaction count stored as a variable length integer
NB. see:  https://en.bitcoin.it/wiki/Protocol_specification#Variable_length_integer
offset=. offset + vlen [ 'vlen TransactionCount'=: vint (offset + i. 9) { dat
'TransactionCount mismatch' assert TransactionCount = 1  NB. (*)=. vlen

NB. next 4 bytes transaction version number
offset=. offset + 4 [ TransactionVersionNumber=: _2 ic (offset + i.4) { dat
'TransactionVersionNumber mismatch' assert 1 = TransactionVersionNumber

NB. next 1 to 9 bytes is the number of transaction inputs
offset=. offset + vlen [ 'vlen TransactionInputNumber'=: vint (offset + i. 9) { dat

NB. next 32 bytes is the hash of the input transaction
offset=. offset + 32 [ TransactionHash=: (offset + i. 32) { dat
'TransactionHash mismatch' assert (32#0) -: a. i. TransactionHash

NB. next 4 bytes is the input transaction index
offset=. offset + 4 [ TransactionIndex=: _2 ic (offset + i. 4) { dat
'TransactionIndex mismatch' assert _1 = TransactionIndex

NB. input script length is next
offset=. offset + vlen [ 'vlen InputScriptLength'=: vint (offset + i. 9) { dat
'InputScriptLength mismatch' assert 77 = InputScriptLength

NB. script data
offset=. offset + InputScriptLength [ InputScript=: (offset + i. InputScriptLength) { dat

NB. sequence number 4 bytes
offset=. offset + 4 [ SequenceNumber=: ,hfd a. i. (offset + i. 4) { dat
'SequenceNumber mismatch' assert 'FFFFFFFF' -: SequenceNumber

NB. output count 1 to 9 bytes
offset=. offset + vlen [ 'vlen OutputCount'=: vint (offset + i.9) { dat

NB. output value - number of satoshis sent
offset=. offset + 8 [ OutputSatoshis=: (offset + i.8) { dat  NB. 64 bit unsigned integer
'OutputSatoshis mismatch' assert '00F2052A01000000' -: ,hfd a. i. OutputSatoshis
OutputSatoshis=: ]`(_3&ic)@.IF64 OutputSatoshis

NB. challenge script length
offset=. offset + vlen [ 'vlen ChallengeScriptLength'=: vint (offset + i.9) { dat
'ChallengeScriptLength mismatch' assert 67 = ChallengeScriptLength

NB. challenge script - contains elliptic curve signatures
offset=. offset + ChallengeScriptLength [ ChallengeScript=: (offset + i. ChallengeScriptLength) { dat
'ChallengeScript mismatch' assert GenesisBlockChallengeScript -: ,hfd a. i. ChallengeScript

NB. challenge script is 67 bytes drop first and last byte to
NB. compute the familiar Bitcoin base 58 address - compare with block explorer
NB. https://blockexplorer.com/block/000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f
OutputAddress=: Base58frKey65 }. }: ChallengeScript
'Genesis Block address mismatch' assert GenesisBlockOutputAddress -: OutputAddress

NB. last 4 bytes lock time
TransactionLockTime=: (offset + i.4) { dat
'TransactionLockTime mismatch' assert 0 0 0 0 -: a. i. TransactionLockTime

'Genesis Block Parsed and Checked'
)
```