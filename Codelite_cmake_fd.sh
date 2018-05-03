#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "$0 path_to_deploy program_name"
	exit 1
fi

PATH_TO_DEPLOY=$1
PROGRAM_NAME=$2

mkdir -p $PATH_TO_DEPLOY
mkdir -p $PATH_TO_DEPLOY/src

echo "cmake_minimum_required(VERSION 2.8)
## Use the variable PROJECT_NAME for changing the target name
set( PROJECT_NAME \"$PROGRAM_NAME\" )

## Set our project name
project(\${PROJECT_NAME})

#add_definitions(-std=c++14)

## Use all the *.cpp files we found under this folder for the project
FILE(GLOB SRCS \"src/*.cpp\" \"src/*.c\")

add_executable(\${PROJECT_NAME} \${SRCS})

#target_link_libraries( \${PROJECT_NAME} )
" > $PATH_TO_DEPLOY/CMakeLists.txt

echo "#include <iostream>

#ifndef DBGMSG
#define DBGMSG(msg) \\
	std::cout << \\
	\"thread id: \" << \\
	std::this_thread::get_id() << \\
	\":\" << \\
	__FILE__ << \":\" << \\
	__FUNCTION__ << \":Line \" << \\
	__LINE__ << \" \" << \\
	std::endl << msg << std::endl; \\
	std::cout.flush();
#define DBGVAR(var) DBGMSG(#var << "= " << var)
#endif

using namespace std;

int main(int argc, char **argv)
{
	cout << \"Hola Universo\" << endl;
}

" > $PATH_TO_DEPLOY/src/main.cpp

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<CodeLite_Project Name=\"$PROGRAM_NAME\" InternalType=\"Console\" Version=\"10.0.0\">
  <Plugins>
    <Plugin Name=\"qmake\">
      <![CDATA[00010001N0011Debug_Linux000000000000]]>
    </Plugin>
    <Plugin Name=\"CppCheck\"/>
    <Plugin Name=\"CMakePlugin\">
      <![CDATA[[{
  \"name\": \"Linux\",
  \"enabled\": false,
  \"buildDirectory\": \"build\",
  \"sourceDirectory\": \"\$(ProjectPath)\",
  \"generator\": \"\",
  \"buildType\": \"\",
  \"arguments\": [],
  \"parentProject\": \"\"
 }]]]>
    </Plugin>
  </Plugins>
  <Description/>
  <Dependencies/>
  <VirtualDirectory Name=\"resources\">
    <File Name=\"CMakeLists.txt\"/>
  </VirtualDirectory>
  <VirtualDirectory Name=\"src\">
    <File Name=\"src/main.cpp\"/>
  </VirtualDirectory>
  <Dependencies Name=\"Linux\"/>
  <Settings Type=\"Executable\">
    <GlobalSettings>
      <Compiler Options=\"\" C_Options=\"\" Assembler=\"\">
        <IncludePath Value=\".\"/>
      </Compiler>
      <Linker Options=\"\">
        <LibraryPath Value=\".\"/>
      </Linker>
      <ResourceCompiler Options=\"\"/>
    </GlobalSettings>
    <Configuration Name=\"Linux\" CompilerType=\"GCC\" DebuggerType=\"GNU gdb debugger\" Type=\"Executable\" BuildCmpWithGlobalSettings=\"append\" BuildLnkWithGlobalSettings=\"append\" BuildResWithGlobalSettings=\"append\">
      <Compiler Options=\"-g;-O0;-Wall\" C_Options=\"-g;-O0;-Wall\" Assembler=\"\" Required=\"yes\" PreCompiledHeader=\"\" PCHInCommandLine=\"no\" PCHFlags=\"\" PCHFlagsPolicy=\"0\">
        <IncludePath Value=\".\"/>
      </Compiler>
      <Linker Options=\"\" Required=\"yes\"/>
      <ResourceCompiler Options=\"\" Required=\"no\"/>
      <General OutputFile=\"\$(IntermediateDirectory)/\$(ProjectName)\" IntermediateDirectory=\"./Debug\" Command=\"\$(ProjectPath)/build-debug/\$(ProjectName)\" CommandArguments=\"\" UseSeparateDebugArgs=\"no\" DebugArguments=\"\" WorkingDirectory=\"\" PauseExecWhenProcTerminates=\"yes\" IsGUIProgram=\"no\" IsEnabled=\"yes\"/>
      <Environment EnvVarSetName=\"&lt;Use Defaults&gt;\" DbgSetName=\"&lt;Use Defaults&gt;\">
        <![CDATA[]]>
      </Environment>
      <Debugger IsRemote=\"no\" RemoteHostName=\"\" RemoteHostPort=\"\" DebuggerPath=\"\" IsExtended=\"no\">
        <DebuggerSearchPaths/>
        <PostConnectCommands/>
        <StartupCommands/>
      </Debugger>
      <PreBuild/>
      <PostBuild/>
      <CustomBuild Enabled=\"yes\">
        <Target Name=\"cmake\">cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1</Target>
        <RebuildCommand>make clean &amp;&amp; make -j4</RebuildCommand>
        <CleanCommand>make clean</CleanCommand>
        <BuildCommand>make -j4</BuildCommand>
        <PreprocessFileCommand/>
        <SingleFileCommand/>
        <MakefileGenerationCommand/>
        <ThirdPartyToolName>None</ThirdPartyToolName>
        <WorkingDirectory>\$(ProjectPath)/build-debug</WorkingDirectory>
      </CustomBuild>
      <AdditionalRules>
        <CustomPostBuild/>
        <CustomPreBuild/>
      </AdditionalRules>
      <Completion EnableCpp11=\"no\" EnableCpp14=\"no\">
        <ClangCmpFlagsC/>
        <ClangCmpFlags/>
        <ClangPP/>
        <SearchPaths/>
      </Completion>
    </Configuration>
  </Settings>
</CodeLite_Project>
" > $PATH_TO_DEPLOY/$PROGRAM_NAME.project