# MonoImageTest
Single colour image encoding/decoding test. From Processing (java) to C++ (for source embedding). 

Purpose of this project was to create tool to create images embeded directly into source code. OS splash screen for example.

Idea is to write lenghts of white and black pixel segments. This version writes them as unsigned 8 byte hex values.

Decoding simply draws the white pixels, then skips in the draw buffer to next white segment and continues drawing. This encoding implementation does not take into account if the image starts with white pixels or not, just assumes black, but should be easy to fix.

C++ example of decoding is ripped from my Operating System project. It's not directly usable but it should be easyly implemented.
