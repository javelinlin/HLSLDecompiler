## HLSLDecompiler

Translate dxbc to hlsl source code. You can use it alone, or as a renderdoc shader processing tool to decompile shader. Although the decompiled result looks very like the disassembly, you can edit the decompiled source code and refresh to see the change in Renderdoc. It's very useful while learning and analyzing rendering techniques in games if you don't have source code.

### How to integrate into renderdoc

1. Put `hlsl_decompiler_wrapper.bat` and `cmd_Decompiler.exe` in the same directory
2. Renderdoc -> Tools -> Settings -> Shader Viewer -> Add
    | Field | Value |
    |------|:--------------:|
    | Name | DXBC->HLSL |
    | Tool Type | Custom Tool |
    | Executable | Set absolute path of `HLSLDecompiler/RenderDoc_DXBC2HLSL_shader_view_files/v2/hlsl_decompiler_wrapper.bat` |
    | Command Line | {input_file} {output_file} (**Notice the space between**) |
    | Input/Output | DXBC/HLSL |

3. Renderdoc -> Pipeline State View -> Choose Any Shader Stage -> View -> Disassembly type : HLSL (DXBC->HLSL)
4. Renderdoc -> Pipeline State View -> Choose Any Shader Stage -> Edit
5. Modify shader as you wish, and click Refresh button to see the change
