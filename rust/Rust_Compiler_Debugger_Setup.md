## Rust Compiler / Debugger Setup 

### OSX

* Install Rust
* Install VSCode
* Install VS Code Extensions
  * CodeLLDB (OSX/Linux)
  * Rust Extension

* Configure VS Code
  * Run / Add Configuration (Create **launch.json** in **.vscode**)
  * (**Optional **)  Manually change executable name under **program** in **"request": "launch"**

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug executable 'server'",
            "cargo": {
                "args": [
                    "build",
                    "--bin=server",
                    "--package=server"
                ],
                "filter": {
                    "name": "server",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        },
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug unit tests in executable 'server'",
            "cargo": {
                "args": [
                    "test",
                    "--no-run",
                    "--bin=server",
                    "--package=server"
                ],
                "filter": {
                    "name": "server",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        },
        {
            "type": "lldb",
            "request": "launch",
          	"program": 
            "name": "Debug executable 'mars_calc'",
            "cargo": {
                "args": [
                    "build",
                    "--bin=mars_calc",
                    "--package=mars_calc"
                ],
                "filter": {
                    "name": "mars_calc",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        },
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug unit tests in executable 'mars_calc'",
            "cargo": {
                "args": [
                    "test",
                    "--no-run",
                    "--bin=mars_calc",
                    "--package=mars_calc"
                ],
                "filter": {
                    "name": "mars_calc",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        },
        {
            "type": "lldb",
            "request": "launch",
          
            "name": "Debug executable 'memory_management'",
            "cargo": {
                "args": [
                    "build",
                    "--bin=memory_management",
                    "--package=memory_management"
                ],
                "filter": {
                    "name": "memory_management",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        },
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug unit tests in executable 'memory_management'",
            "cargo": {
                "args": [
                    "test",
                    "--no-run",
                    "--bin=memory_management",
                    "--package=memory_management"
                ],
                "filter": {
                    "name": "memory_management",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}"
        }
    ]
}
```



