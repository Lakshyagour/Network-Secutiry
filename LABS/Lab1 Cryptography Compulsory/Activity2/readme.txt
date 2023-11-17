Same IV, Different Messages:

Preamble: With your kind help, Agent X has decided to use AES-128 in OFB mode and things have been going well for a while until one day Agent X walks in instyle (imagine Rajnikanth’s entrance) but mad. 
He blames you for the mess he is in. An important document which he sent using AES-128-OFB had leaked and his boss is threatening to hang, draw and quarter him (see https://en.wikipedia.org/wiki/Hanged,_drawn_and_quartered :-).
Please help save Agent X by debugging the issue before he visits the same punishment on you :-)
You know Agent X is not using ECB, so there should ideally be no leakage. 
You ask about IV. Bingo, Agent X is using the same IV for all messages. You tell him that this is not a good idea.
 Agent X is not convinced by your explanation. He claims that in his case, the plain text does not repeat since he sends different images/docs each time. 
 So, using the same IV should be safe still. Help him understand why this is still a bad idea by coming up with an example.

The scenario is, Agent X is using OFB blockmode, and using the same IV every time for encryption. You have a plaintext P1 and its encrypted text C1, and also you have C2 (a new encrypted text). 
Show Agent X how you (or an attacker) can derive the plain text P2 in this case. Your goal is to obtain and submit this plain text (P2).  The details of the IV, P1, C1 and C2 are present in "metadata.txt" file in the labdirectory.
- **Hint:** See how OFB mechanism works more closely
- The P1, C1, and C2 provided in metadata.txt file are in hexadecimal form. However, the Flag (Plaintext P2) that needs to be submitted must be in ASCII text form.

Submission Details:
- Submit the flag (plaintext P2) you found, in "flags.txt" file available in your labdirectory.
      
Metadata
p1: 0x48656c6c6c6f20576f726c64215f343066663262616630346637323739313431303766313638
c1: 0x5ae95331fa04fbd99915e8016667b19322830df38e1877a94222649d86226b27375bcde87f61
c2: 0x74e05e3aed2f94ebc05ffc5c7349d59211a30ec7a4090cc95c5026fafc456e4f4a589cb27e24