### Utilities ####
## Depends on lib/globals.R
emod <- function(config = "config.json", input = Sys.getenv("EMOD_INPUT_ROOT")) {
    emod_app = file.path(Sys.getenv("PROJECT_ROOT"), 'bin', 'Eradication')
    if (Sys.info()['sysname'] == 'Windows'){
        emod_app = file.path(Sys.getenv("PROJECT_ROOT"), 'bin', 'Eradication.exe')
    }
    command_line = sprintf("%s --config %s --input-path %s", emod_app, config, input)
    system(command_line)
}