# stack_trace

Minimal use case of stacktrace not working

## Results with FSF Gnat 10.3.1 (similarly with 11.2.1)

```
PS D:\dev\ada\stack_trace> alr toolchain
CRATE         VERSION  STATUS    NOTES
gprbuild      21.0.1   Default
gprbuild      2021.0.0 Available Detected at D:\apps\GNAT\2021\bin\gprbuild.exe
gnat_native   10.3.1   Default
gnat_native   11.2.1   Available
gnat_external 2021.0.0 Available Detected at D:\apps\GNAT\2021\bin\gnat.exe
```


```
PS D:\dev\ada\stack_trace> alr run
Bind
   [gprbind]      stack_trace.bexch
   [Ada]          stack_trace.ali
Link
   [link]         stack_trace.adb
raised STACK_TRACE.BAD : stack_trace.adb:12
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f721710 at ???
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f75ae39 at ???
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f721422 at ???
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f72113b at ???
[C:\Windows\System32\KERNEL32.DLL]
0x7ffa3f827032
[C:\Windows\SYSTEM32\ntdll.dll]
0x7ffa416e264f

Exception traceback: [D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f721710 at ???
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f75ae39 at ???
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f721422 at ???
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x7ff66f72113b at ???
[C:\Windows\System32\KERNEL32.DLL]
0x7ffa3f827032
[C:\Windows\SYSTEM32\ntdll.dll]
0x7ffa416e264f
```

## with GNAT CE

```
PS D:\dev\ada\stack_trace> alr with gnat_external
Requested changes:

   + gnat_external ^2021.0.0 (add)

Changes to dependency solution:

   New solution is incomplete.
   ~ gnat          =11.2.1  (external,local)
   + gnat_external 2021.0.0 (new)

Do you want to proceed?
[Y] Yes  [N] No  (default is No) y
warn: Generating possibly incomplete environment because of missing dependencies
Note: Deploying release gnat_external=2021.0.0...
Warning: The following external dependencies are unavailable within Alire:
Warning:    gnat=11.2.1
Warning: They should be made available in the environment by the user.
Warning: Generating possibly incomplete configuration because of missing dependencies

PS D:\dev\ada\stack_trace> alr run
warn: Generating possibly incomplete environment because of missing dependencies
Compile
   [Ada]          stack_trace.adb
Bind
   [gprbind]      stack_trace.bexch
   [Ada]          stack_trace.ali
Link
   [link]         stack_trace.adb
raised STACK_TRACE.BAD : stack_trace.adb:12
[D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x4016fb Stack_Trace.Foo at stack_trace.adb:12
0x401705 Stack_Trace.Bar at stack_trace.adb:18
0x401758 Stack_Trace at stack_trace.adb:21
0x401d3c Main at b__stack_trace.adb:250
0x401423 __tmainCRTStartup at ???
0x40113b mainCRTStartup at ???
[C:\Windows\System32\KERNEL32.DLL]
0x7ffa3f827032
[C:\Windows\SYSTEM32\ntdll.dll]
0x7ffa416e264f

Exception traceback: [D:\dev\ada\stack_trace\bin\stack_trace.exe]
0x4016fb Stack_Trace.Foo at stack_trace.adb:12
0x401705 Stack_Trace.Bar at stack_trace.adb:18
0x401758 Stack_Trace at stack_trace.adb:21
0x401d3c Main at b__stack_trace.adb:250
0x401423 __tmainCRTStartup at ???
0x40113b mainCRTStartup at ???
[C:\Windows\System32\KERNEL32.DLL]
0x7ffa3f827032
[C:\Windows\SYSTEM32\ntdll.dll]
0x7ffa416e264f
```