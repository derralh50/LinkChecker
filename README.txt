This started out to be a project in CS-140 Microsoft OS a class I am taking at Linn Benton Community College.  In this class we covered
Microsoft PowerShell.

"PowerShell is an object-oriented programming language and interactive command line shell for Microsoft Windows. PowerShell was designed 
to automate system tasks, such as batch processing, and create systems management tools for commonly implemented processes." 1

1) searchwindowsserver.techtarget.com/definition/PowerShell

My research on this subject, PowerShell, indicated that this programming language is mostly used by MS Server admin folks to automate
many of the tasked involved with MS Network and MS Server Administration.

I decided to see if I could write a tool to automate a task I would use as a Web Developer because I was totally intriged the the
results of the cmdlet Invoke-WebRequest because it returned a large amount of data from a valid webpage as objects in an array.  The 
interesting part of this is that Invoke-WebRequest (Status Code) and (Status Description) only returns Code 200 or OK and otherwise 
throughs an error if the webpage has any other code, or is not valid.

Version 1.0.0 of LinkChecker only checks the outer links http and https.  I fully intend to expand this utility to include all other links
in the page beginning with the inner links to other pages, and then images, and media files, and pdf docutments,  at a later date.
