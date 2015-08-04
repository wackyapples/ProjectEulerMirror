# Project Euler Mirror
Due to the recent [attack](https://projecteuler.net/news) on Project Euler, I thought it would be nice to throw together a (semi-functional) mirror of the website. The mirror is accessible at https://wackyapples.github.io/ProjectEulerMirror/ and https://bencreighton.org/euler/

## About
This is a very simple project, it is essentially a wget mirror of the original Project Euler [site](https://projecteuler.net/) with the answer checking form replaced. Answers are now checked via MD5 hashes and JavaScript. The original MD5 hashes are borrowed from the kmkeen's excellent [Local Euler](http://kmkeen.com/local-euler/) project. MD5 hashes for inputted answers are calculated with blueimp's [JavaScript MD5](https://github.com/blueimp/JavaScript-MD5).

Not all problems have hashed answers yet, such as all problems past 476. A complete list is forthcoming. Feel free to contribute **hashed answers** you've checked on projecteuler.net. Also, of course, feel free to contribute any other improvements and all input is welcome, as this is a pretty quick-and-dirty setup and JS is not my forte. (Seriously, this was put together quick and if something is garbage let me know.)

## Legal
Project Euler is licensed under Attribution-Non-Commercial-Share Alike 2.0 UK: England & Wales

I, the maintainer of the repository, own none of the content and the above people and projects did all the heavy lifting.

If the owners of any of the above projects prefer this to be removed, please let me know.

Simple mirror of Project Euler with answer checking. https://projecteuler.net/
