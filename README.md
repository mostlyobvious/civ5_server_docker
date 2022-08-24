# Civ5 Circus

Scripts and Dockerfiles to install and run a dedicated Civilization 5 server on a headless, GPU-less Linux machine.

## How does it work

So Civ 5 Server is a Windows-only GUI application, that needs to render frames with ~~OpenGL~~ Direct3D (translated to
OpenGL with wine)... This Docker setup creates a virtual X11 framebuffer for Civ to render to, provides a VNC server so
you can remote in, installs Mesa such that the CPU can render frames (so no GPU needed), and libstrangle so that Civ
only runs at 2 FPS, so rendering doesn't consume the CPU so much (though it still takes an enormous amount of CPU time).

## How do you use it

1. First, Civilization 5 needs to be installed into the `civ5game` directory, as well as the
   `CivilizationV_Server.exe` file from the Civ 5 SDK.  You can copy those files over yourself, or use provided script as
   `./install_civ5 <steam_username> <steam_password>`.

2. Then you build the game server container with `./build_server`

3. Fianlly you can launch the game server container with `./run_the_circus`.

4. After the container starts running, you should be able to remote in with VNC. The `./run_the_circus` script is set up to only
   allow connections from localhost, so you'll want to open up an SSH tunnel if remoting in from a different machine first:

   ```
   ssh -f user@server -NL 10411:127.0.0.1:10411 
   ```

   Then, you should be able to point your VNC client at `localhost:10411` and see Civ 5 running. Steam will also be running - it
   needs to stay running the background for Civ to not crash, though you don't need to log in to it.

5. Setup the game through the VNC connection, and hope that it works and people can connect.

# Ports you might need to open/let through a firewall

The 27016 UDP is the only port you need to allow incoming traffic through. 

