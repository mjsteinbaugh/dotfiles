## Mike's R startup profile
## Updated 2019-10-23.



## Load shared profile                                                      {{{1
## =============================================================================

## This will be handled automatically when 'Rprofile.site' file is installed.
## Otherwise, we're providing fall back support here for local installations,
## when koopa is installed at '~/.local/share/koopa'.

## Note that some useful functions and globals (e.g. seed) are defined in a
## hidden environment named ".env".

if (!isTRUE(getOption("rprofile.site"))) {
    file <- file.path(
        "~",
        ".config",
        "koopa",
        "R",
        "Rprofile.site"
    )
    if (!file.exists(file)) {
        stop(paste0("Failed to locate ", file, "."))
    }
    source(file)
    rm(file)
}

stopifnot(isTRUE(getOption("rprofile.site")))



## User information                                                         {{{1
## =============================================================================

## These values are used in many of my R Markdown templates.

options(
    author = "Michael Steinbaugh",
    email = "mike@steinbaugh.com"
)



## Interactive                                                              {{{1
## =============================================================================

if (interactive()) {
    if (.isInstalled("bb8")) {
        options(
            defaultPackages = c(getOption("defaultPackages"), "bb8")
        )
    }

    if (.isInstalled("basejump")) {
        options(
            acid.save.ext = "rds",
            acid.test.extra = TRUE
        )
        options(
            acid.save.dir = file.path(getOption("acid.save.ext"), Sys.Date())
        )
        options(
            acid.load.dir = getOption("acid.save.dir")
        )
    }

    ## > if (.isInstalled("goalie")) {
    ## >     options(goalie.traceback = TRUE)
    ## > }
}
