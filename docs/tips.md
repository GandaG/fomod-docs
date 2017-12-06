# Tips and Tricks

***AKA a F.A.Q. for which we couldn't come up with questions***

## The Schema Location

Maybe you've noticed this appearing as the schema location in the
examples: *http://qconsulting.ca/fo3/ModConfig5.0.xsd*. It is not
an accident - some mod managers, and I won't name names here, use
the link text (not the file the link points to, but the link itself)
to check which fomod version the installer is using.

Conclusion - you can't change it unless you're sure your users 
will never use those mod managers. Hopefully they'll drop that if
a new schema version is created.

## The Explicit Order

As promised during the tutorial - the fabled *order* attribute.

This is actually pretty simple and, if I might say so, completely
ridiculous. Let me show you the options for this attribute:

- "Ascending" - the default
- "Descending"
- "Explicit"

The first two sort your stuff alphabetically with no regards to
how you sorted them out and since (the *order* attribute is
optional, meaning you can omit it) the default is "Ascending"
you'll need to put *order="Explicit"* everywhere in your installer. 

No idea why it was decided to put "Ascending" as the default or
who even thought it would be a good idea to sort things
alphabetically here.

## The Type Descriptor

Coming soon!
