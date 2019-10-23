## Mike's R startup profile
## Updated 2019-10-22.



## Load shared profile                                                      {{{1
## =============================================================================

## This will be handled automatically when 'Rprofile.site' file is installed.
## Otherwise, we're providing fall back support here for local installations,
## when koopa is installed at '~/.local/share/koopa'.

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
    ## Load bb8 functions and reexports by default.
    options(defaultPackages = c(getOption("defaultPackages"), "bb8"))

    ## Alternatively, here's how to load bb8 functions into hidden environment.
    ## > stopifnot(isTRUE(".env" %in% search()))
    ## > envir <- as.environment(".env")
    ## > x <- utils::read.table(
    ## >     file = system.file("NAMESPACE", package = "bb8"),
    ## >     stringsAsFactors = FALSE
    ## > )
    ## > x <- sub("^export\\((.+)\\)$", "\\1", x[[1L]])
    ## > invisible(lapply(
    ## >     X = x,
    ## >     FUN = function(x) {
    ## >         assign(
    ## >             x = x,
    ## >             value = function(...) {
    ## >                 fun <- get(
    ## >                     x = x,
    ## >                     envir = asNamespace("bb8"),
    ## >                     inherits = TRUE
    ## >                 )
    ## >                 stopifnot(is.function(fun))
    ## >                 fun(...)
    ## >             },
    ## >             envir = envir
    ## >         )
    ## >     }
    ## > ))
    ## > rm(envir)

    ## Easy read-write into dated subdirectories, for improved data provenance.
    options(acid.save.ext = "rds")
    options(acid.save.dir = file.path(getOption("acid.save.ext"), Sys.Date()))
    options(acid.load.dir = getOption("acid.save.dir"))

    ## Enable this for more thorough unit testing.
    options(acid.test.extra = TRUE)

    ## Enable this for more verbose code debugging.
    options(goalie.traceback = TRUE)
}
