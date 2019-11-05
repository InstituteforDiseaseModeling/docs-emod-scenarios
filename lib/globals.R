PROJECT_ROOT = Sys.getenv('PROJECT_ROOT', unset=NA)
EMOD_INPUT_ROOT = Sys.getenv('EMOD_INPUT_ROOT', unset=NA)

if(is.na(PROJECT_ROOT)){
    PROJECT_ROOT <- system('git rev-parse --show-toplevel', intern=TRUE)
    Sys.setenv(PROJECT_ROOT=PROJECT_ROOT)
}

if(is.na(EMOD_INPUT_ROOT)) {
    EMOD_INPUT_ROOT <- file.path(PROJECT_ROOT, 'Demographics_Files')
    Sys.setenv(EMOD_INPUT_ROOT=EMOD_INPUT_ROOT)
}