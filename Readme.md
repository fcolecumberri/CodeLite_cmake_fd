## CodeLite-CMake simple file deployment

This simple bash script creates a CodeLite's simple 
.project file and a CMakeList.txt for making a fast-start
in a new project without needing to configure lots of things in 
CodeLite

This also creates the *src* direcory and a *src/main.cpp*

### Install this bash script

To install it you may just give execution rights and copy to 
*/usr/local/bin*

``` [bash]
chmod +x Codelite_cmake_fd.sh
sudo cp Codelite_cmake_fd.sh /usr/local/bin/Codelite_cmake_fd
```

### How to use this

``` [bash]
./Codelite_cmake_fd.sh path_to_directory name_of_the_new_program
```
