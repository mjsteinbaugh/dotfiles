## Mike's R startup profile
## Updated 2019-10-09.



## Load shared profile                                                      {{{1
## =============================================================================

## This will be handled automatically when `Rprofile.site` file is installed.
## Otherwise, we're providing fall back support here for local installations,
## when koopa is installed at `~/.local/share/koopa`.

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



## acidverse                                                                {{{1
## =============================================================================

## Easy read-write into dated subdirectories, for improved data provenance.
## > options(acid.save.ext = "rds")
## > options(
## >     acid.save.dir = file.path(
## >         getOption("acid.save.ext"),
## >         Sys.Date()
## >     )
## > )
## > options(acid.load.dir = getOption("acid.save.dir"))

## Enable this for more thorough unit testing.
## > options(acid.test.extra = TRUE)

## Enable this for more verbose code debugging.
## > options(
## >     goalie.traceback = TRUE
## > )



## Interactive                                                              {{{1
## =============================================================================

## Assign shortcuts and session information to a hidden environment.
## Custom functions are to be saved in bb8 package instead of here.

if (interactive()) {
    stopifnot(isTRUE(".env" %in% search()))
    envir <- as.environment(".env")

    ## Run `BiocCheck::usage()` for options.
    ## See also Rcheck bioc-check script.
    ## https://github.com/acidgenomics/Rcheck/blob/master/checks/bioc-check
    assign(
        x = "BiocCheck",
        value = function(package = ".", ...) {
            BiocCheck::BiocCheck(
                package = package,
                `no-check-R-ver` = TRUE,
                `no-check-bioc-help` = TRUE,
                `no-check-remotes` = TRUE,
                `no-check-version-num` = TRUE,
                `no-check-vignettes` = TRUE,
                ...
            )
        },
        envir = envir
    )

    assign(
        x = "available",
        value = function(...) {
            available::available(...)
        },
        envir = envir
    )

    assign(
        x = "bb8",
        value = function(...) {
            bb8::bb8(...)
        },
        envir = envir
    )

    assign(
        x = "build",
        value = function(..., vignettes = FALSE) {
            devtools::build(..., vignettes = vignettes)
        },
        envir = envir
    )

    assign(
        x = "build_articles",
        value = function(...) {
            pkgdown::build_articles(...)
        },
        envir = envir
    )

    assign(
        x = "build_home",
        value = function(...) {
            pkgdown::build_home(...)
        },
        envir = envir
    )

    assign(
        x = "build_news",
        value = function(...) {
            pkgdown::build_news(...)
        },
        envir = envir
    )

    assign(
        x = "build_reference",
        value = function(...) {
            pkgdown::build_reference(...)
        },
        envir = envir
    )

    assign(
        x = "build_reference_index",
        value = function(...) {
            pkgdown::build_reference_index(...)
        },
        envir = envir
    )

    assign(
        x = "build_site",
        value = function(..., devel = FALSE, preview = FALSE) {
            unlink(file.path("docs", "reference"), recursive = TRUE)
            pkgdown::build_site(..., devel = devel, preview = preview)
        },
        envir = envir
    )

    assign(
        x = "build_vignettes",
        value = function(..., clean = FALSE) {
            devtools::build_vignettes(..., clean = clean)
        },
        envir = envir
    )

    assign(
        x = "check",
        value = function() {
            rcmdcheck()
            BiocCheck()
        },
        envir = envir
    )

    assign(
        x = "cd",
        value = function(...) {
            setwd(...)
        },
        envir = envir
    )

    assign(
        x = "clear",
        value = function() {
            cat("\f")
        },
        envir = envir
    )

    assign(
        x = "clearWarnings",
        value = function() {
            assign("last.warning", NULL, envir = baseenv())
        },
        envir = envir
    )

    assign(
        x = "devinstall",
        value = function(..., dependencies = FALSE) {
            devtools::install(..., dependencies = dependencies)
        },
        envir = envir
    )

    assign(
        x = "document",
        value = function(...) {
            devtools::document(...)
        },
        envir = envir
    )

    assign(
        x = "findAndReplace",
        value = function(...) {
            bb8::findAndReplace(...)
        },
        envir = envir
    )

    assign(
        x = "install",
        value = function(..., dependencies = TRUE) {
            BiocManager::install(..., dependencies = dependencies)
        },
        envir = envir
    )

    assign(
        x = "install_github",
        value = function(..., upgrade = "never") {
            remotes::install_github(..., upgrade = upgrade)
        },
        envir = envir
    )

    assign(
        x = "lint_package",
        value = function(...) {
            lintr::lint_package(...)
        },
        envir = envir
    )

    assign(
        x = "load_all",
        value = function() {
            ## > pkgload::load_all(helpers = FALSE, attach_testthat = FALSE)
            devtools::load_all()
        },
        envir = envir
    )

    assign(
        x = "printComment",
        value = function(...) {
            bb8::printComment(...)
        },
        envir = envir
    )

    assign(
        x = "rcmdcheck",
        value = function(...) {
            rcmdcheck::rcmdcheck(...)
        },
        envir = envir
    )

    assign(
        x = "render",
        value = function(...) {
            rmarkdown::render(...)
        },
        envir = envir
    )

    ## covr doesn't currently install DT but requires it for `report()`.
    assign(
        x = "report",
        value = function(...) {
            if (!requireNamespace("DT", quietly = TRUE)) {
                install.packages("DT")
            }
            covr::report(...)
        },
        envir = envir
    )

    assign(
        x = "roxygenize",
        value = function(...) {
            roxygen2::roxygenise(...)
        },
        envir = envir
    )

    ## Disabling `run = TRUE` by default.
    ## Otherwise, this will attempt to run code inside `\dontrun{}` blocks.
    ## See https://github.com/r-lib/devtools/issues/1990.
    assign(
        x = "run_examples",
        value = function(
            ...,
            document = FALSE,
            fresh = TRUE,
            run = FALSE,
            test = FALSE
        ) {
            devtools::run_examples(
                ...,
                document = document,
                fresh = fresh,
                run = run,
                test = test
            )
        },
        envir = envir
    )

    assign(
        x = "test",
        value = function(...) {
            require(testthat)
            require(patrick)
            devtools::test(...)
        },
        envir = envir
    )

    ## Update installed packages.
    ##
    ## Don't use `update()`; conflicts with `stats::update()`.
    ## Don't use `upgrade()`; conflicts with `utils::upgrade()`.
    ##
    ## If you run into dependency compilation issues, set `ask = TRUE` or
    ## `upgrade = "ask"` (for GitHub packages).
    assign(
        x = "update_all",
        value = function() {
            options(
                R_REMOTES_UPGRADE = "always",
                repos = BiocManager::repositories()
            )
            BiocManager::install(update = TRUE, ask = FALSE)
            remotes::update_packages()
            update.packages(ask = FALSE, checkBuilt = TRUE)
            BiocManager::valid()
        },
        envir = envir
    )

    # Note that we're always asking here, since it's useful for troubleshooting.
    assign(
        x = "update_packages",
        value = function(..., upgrade = "ask") {
            remotes::update_packages(..., upgrade = upgrade)
        }
    )

    assign(
        x = "use_data",
        value = function(..., overwrite = TRUE) {
            usethis::use_data(..., overwrite = overwrite)
        },
        envir = envir
    )

    assign(
        x = "valid",
        value = function(...) {
            BiocManager::valid(...)
        },
        envir = envir
    )

    ## macOS-specific                                                       {{{2
    ## -------------------------------------------------------------------------

    if (Sys.info()[[1L]] == "Darwin") {
        ## Copy to clipboard.
        assign(
            x = "pbcopy",
            value = function(x) {
                capture.output(x, file = pipe("pbcopy"))
            },
            envir = envir
        )
    }

    ## RStudio-specific                                                     {{{2
    ## -------------------------------------------------------------------------

    if (isTRUE(nzchar(Sys.getenv("RSTUDIO_USER_IDENTITY")))) {
        assign(
            x = "script_path",
            value = function() {
                rstudioapi::getSourceEditorContext()$path
            },
            envir = envir
        )

        ## RStudio `View()` doesn't work well with S4 DataFrame.
        assign(
            x = "View2",
            value = function(object) {
                if (is(object, "DataFrame")) {
                    object <- as.data.frame(object)
                }
                View(object)
            },
            envir = envir
        )
    }

    rm(envir)
}
