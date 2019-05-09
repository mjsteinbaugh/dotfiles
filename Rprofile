# R startup profile
#
# Tested on Linux, macOS, and Windows.



# Notes                                                                     {{{1
# ==============================================================================

# help(topic = "Rprofile")

# Example profiles, for reference:
# - Stephen Turner's profile
#   http://gettinggeneticsdone.blogspot.com/2013/07/customize-rprofile.html
# - Jim Hester's profile
#   https://github.com/jimhester/dotfiles/blob/master/R/Rprofile
# - Efficient R programming
#   https://csgillespie.github.io/efficientR/set-up.html

# Never set `options(stringsAsFactors = FALSE)`.
# Code will be non-portable.

# If devtools runs into an unzip error, set this option:
# - unzip = "/usr/bin/unzip"

# Useful installation options (but leave disabled by default):
# - install.packages.check.source = "no"
# - install.packages.compile.from.source = "binary"
# - repos = BiocManager::repositories()



# Initialization at start of an R session                                   {{{1
# ==============================================================================

# help(topic = "Startup", package = "base")

.First <- function() {
    # Get the R version without patch (e.g. 3.6).
    r_ver <- paste(
        R.version[["major"]],
        substr(x = R.version[["minor"]], start = 1, stop = 1),
        sep = "."
    )

    # Check if session is running inside RStudio.
    if (isTRUE(nzchar(Sys.getenv("RSTUDIO_USER_IDENTITY")))) {
        rstudio <- TRUE
    } else {
        rstudio <- FALSE
    }

    # Pre-flight checks                                                     {{{2
    # --------------------------------------------------------------------------

    # Check that the local library matches the R version.
    libs <- .libPaths()
    lib_pattern <- file.path(
        paste0(Sys.getenv("R_PLATFORM"), "-library"),
        r_ver
    )
    usr_lib <- grepl(pattern = lib_pattern, x = libs)
    if (!any(usr_lib)) {
        stop(paste0(
            "Failed to detect ", r_ver, " user library.", "\n",
            "Check R_LIBS_USER configuration in ~/.Renviron file.", "\n",
            "Looking for: ", lib_pattern, "\n\n",
            ".libPaths():", "\n",
            paste(libs, collapse = "\n")
        ))
    }

    # Check for expected compilers.
    if (Sys.getenv("HMS_CLUSTER") == "o2") {
        # module load gcc/6.2.0
        gcc_bin_dir <- "/n/app/gcc/6.2.0/bin"
        stopifnot(identical(
            x = Sys.which(c("gcc", "g++", "gfortran")),
            y = c(
                "gcc"      = file.path(gcc_bin_dir, "gcc"),
                "g++"      = file.path(gcc_bin_dir, "g++"),
                "gfortran" = file.path(gcc_bin_dir, "gfortran")
            )
        ))
        # module load R/3.5.1
        stopifnot(identical(
            Sys.which("R"),
            c(R = "/n/app/R/3.5.1/bin/R")
        ))
        # module load hdf5/1.10.1
        stopifnot(identical(
            Sys.which("h5cc"),
            c(h5cc = "/n/app/hdf5/1.10.1/bin/h5cc")
        ))
    } else if (Sys.info()[["sysname"]] == "Darwin") {
        # Use recommended CRAN compiler settings.
        if (r_ver == "3.5") {
            clang_ver <- "6"
        } else if (r_ver == "3.6") {
            clang_ver <- "7"
        }
        clang_bin_dir <-
            file.path("", "usr", "local", paste0("clang", clang_ver), "bin")
        stopifnot(identical(
            x = Sys.which(c("clang", "clang++", "gfortran")),
            y = c(
                "clang"    = file.path(clang_bin_dir, "clang"),
                "clang++"  = file.path(clang_bin_dir, "clang++"),
                "gfortran" = "/usr/local/gfortran/bin/gfortran"
            )
        ))
    } else if (Sys.info()[["sysname"]] == "Linux") {
        stopifnot(identical(
            x = Sys.which(c("gcc", "g++", "gfortran")),
            y = c(
                "gcc"      = "/usr/bin/gcc",
                "g++"      = "/usr/bin/g++",
                "gfortran" = "/usr/bin/gfortran"
            )
        ))
    }

    # Check for active conda. Can cause compilation issues. Issue a warning
    # here, otherwise bcbio unit tests will fail to run.
    if (Sys.which("conda") != "") {
        warning(paste(
            "conda detected.",
            "Run `conda deactivate` prior to starting R.",
            sep = "\n"
        ))
    }

    # Global options                                                        {{{2
    # --------------------------------------------------------------------------

    # Seed                                                                  {{{3
    # Always set seed for reproducibility.
    seed <- 1454944673L
    set.seed(seed)

    # File permissions                                                      {{{3
    # Fix default file permissions in RStudio.
    # RStudio doesn't pick up the system umask, which is annoying.
    if (isTRUE(rstudio)) {
        Sys.umask("0002")
    }

    # Console and interface                                                 {{{3
    options(
        browserNLdisabled = TRUE,
        # Remove "+" line prefix in output, making code easier to copy.
        continue = " ",
        max.print = 1000L,
        menu.graphics = FALSE,
        prompt = "> ",
        show.signif.stars = FALSE,
        width = 80L
    )

    # Debugging                                                             {{{3
    # Improve the warnings and include backtrace of call stack.
    options(
        deparse.max.lines = 3L,
        showErrorCalls = TRUE,
        showWarnCalls = TRUE,
        warn = 1L,
        # 8170 is the maximum warning length.
        warning.length = 8170L
    )

    # Stricter debugging                                                    {{{3
    # Note that edgeR and pheatmap currently fail for these (too verbose).
    # > options(
    # >     warnPartialMatchAttr = TRUE,
    # >     warnPartialMatchDollar = TRUE
    # > )

    # Stack trace                                                           {{{3
    # Improve stack traces for error messages.
    #
    # Use either:
    # - `rlang::entrace()` (recommended)
    # - `utils::recover()`
    #
    # See also:
    # - https://twitter.com/krlmlr/status/1086995664591044608
    # - https://gist.github.com/krlmlr/33ec72d196b1542b9c4f9497d981de49
    #
    # Verbose error debugging is currently crashing RStudio 1.2 unless
    # `rstudio.errors.suppressed` is defined.
    #
    # Related issues:
    # - https://github.com/rstudio/rstudio/issues/4723
    # - https://github.com/rstudio/rstudio/pull/4726
    if (isTRUE(rstudio)) {
        options(rstudio.errors.suppressed = FALSE)
    }
    options(
        error = quote(rlang::entrace()),
        rlang_backtrace_on_error = "full"
    )

    # Repositories                                                          {{{3
    # Stop asking about which CRAN repo to use for `install.packages()`.
    # Consider using a versioned MRAN snapshot for increased reproducibility.
    repos <- getOption("repos")
    repos["CRAN"] <- "https://cloud.r-project.org"
    options(repos = repos)

    # Alternatively, this lets you install Bioconductor packages using
    # `install.packages()`, but this causes a slight R session load delay.
    # > options(repos = BiocManager::repositories())

    # Author                                                                {{{3
    # Set default author, for R Markdown templates.
    options(
        author = "Michael Steinbaugh",
        email = "mike@steinbaugh.com"
    )

    # acidverse                                                             {{{3
    # Easy read-write into dated subdirectories, for improved data provenance.
    # > options(acid.save.ext = "rds")
    # > options(
    # >     acid.save.dir = file.path(
    # >         getOption("acid.save.ext"),
    # >         Sys.Date()
    # >     )
    # > )
    # > options(acid.load.dir = getOption("acid.save.dir"))

    # crayon                                                                {{{3
    options(
        crayon.enabled = TRUE,
        crayon.colors = 256L
    )

    # goalie                                                                {{{3
    # Enable this for more verbose code debugging. Disabled by default.
    # > options(
    # >     goalie.traceback = TRUE
    # > )

    # httr                                                                  {{{3
    # Enable OAuth token generation using httr on a remote R server.
    # This is used by googlesheets, for example.
    options(
        httr_oob_default = TRUE
    )

    # parallel                                                              {{{3
    # Improve the default multi-core settings.
    # Minimum of 2 cores, maximum of 16 cores.
    # `BiocParallel::MulticoreParam()` should inherit this setting.
    options(
        mc.cores = min(max(2L, parallel::detectCores() - 2L), 16L)
    )

    # readr                                                                 {{{3
    options(
        readr.num_columns = 0L,
        readr.show_progress = FALSE
    )

    # Interactive options and environment                                   {{{2
    # --------------------------------------------------------------------------

    # Assign shortcuts and session information to a hidden environment.
    # Custom functions are to be saved in bb8 package instead of here.

    if (interactive()) {
        .env <- new.env()

        # Stash the seed defined above in the environment.
        .env$seed <- seed

        .env$available <- function(...) {
            available::available(...)
        }

        .env$bb8 <- function(...) {
            bb8::bb8(...)
        }

        .env$BiocCheck <- function(package = ".", ...) {
            BiocCheck::BiocCheck(package = package, ...)
        }

        .env$build <- function(..., vignettes = FALSE) {
            devtools::build(..., vignettes = vignettes)
        }

        .env$build_articles <- function(...) {
            pkgdown::build_articles(...)
        }

        .env$build_home <- function(...) {
            pkgdown::build_home(...)
        }

        .env$build_news <- function(...) {
            pkgdown::build_news(...)
        }

        .env$build_reference <- function(...) {
            pkgdown::build_reference(...)
        }

        .env$build_reference_index <- function(...) {
            pkgdown::build_reference_index(...)
        }

        .env$build_site <- function(..., document = FALSE, preview = FALSE) {
            unlink(file.path("docs", "reference"), recursive = TRUE)
            pkgdown::build_site(..., document = document, preview = preview)
        }

        .env$build_vignettes <- function(..., clean = FALSE) {
            devtools::build_vignettes(..., clean = clean)
        }

        .env$check <- function() {
            rcmdcheck::rcmdcheck()
            BiocCheck::BiocCheck()
        }

        .env$cd <- function(...) {
            base::setwd(...)
        }

        .env$clear <- function() {
            cat("\f")
        }

        .env$clearWarnings <- function() {
            assign("last.warning", NULL, envir = baseenv())
        }

        .env$devinstall <- function(..., dependencies = FALSE) {
            devtools::install(..., dependencies = dependencies)
        }

        .env$document <- function(...) {
            devtools::document(...)
        }

        .env$findAndReplace <- function(...) {
            bb8::findAndReplace(...)
        }

        .env$install <- function(..., dependencies = TRUE) {
            BiocManager::install(..., dependencies = dependencies)
        }

        .env$install_github <- function(..., upgrade = "never") {
            remotes::install_github(..., upgrade = upgrade)
        }

        .env$lint_package <- function(...) {
            lintr::lint_package(...)
        }

        # pkgload::load_all(helpers = FALSE, attach_testthat = FALSE)
        .env$load_all <- function() {
            devtools::load_all()
        }

        # macOS: Copy to clipboard.
        .env$pbcopy <- function(x) {
            stopifnot(Sys.info()[[1L]] == "Darwin")
            capture.output(x, file = pipe("pbcopy"))
        }

        .env$printComment <- function(...) {
            bb8::printComment(...)
        }

        .env$rcmdcheck <- function(...) {
            rcmdcheck::rcmdcheck(...)
        }

        .env$render <- function(...) {
            rmarkdown::render(...)
        }

        .env$report <- function(...) {
            # covr doesn't currently install DT but requires it for `report()`.
            library(DT)
            covr::report(...)
        }

        .env$roxygenize <- function(...) {
            roxygen2::roxygenise(...)
        }

        # Disabling `run = TRUE` by default.
        # Otherwise, this will attempt to run code inside `\dontrun{}` blocks.
        # See https://github.com/r-lib/devtools/issues/1990.
        .env$run_examples <- function(
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
        }

        .env$script_path <- function() {
            rstudioapi::getSourceEditorContext()$path
        }

        .env$test <- function(...) {
            require(testthat)
            require(patrick)
            devtools::test(...)
        }

        # Update installed packages.
        # Don't use `update()`; conflicts with `stats::update()`.
        # Don't use `upgrade()`; conflicts with `utils::upgrade()`.
        .env$update_all <- function() {
            options(
                R_REMOTES_UPGRADE = "always",
                repos = BiocManager::repositories()
            )
            BiocManager::install(update = TRUE, ask = FALSE)
            remotes::update_packages()
            update.packages(ask = FALSE, checkBuilt = TRUE)
        }

        .env$use_data <- function(..., overwrite = TRUE) {
            usethis::use_data(..., overwrite = overwrite)
        }

        .env$valid <- function(...) {
            BiocManager::valid(...)
        }

        if (isTRUE(rstudio)) {
            # RStudio `View()` doesn't work with S4 DataFrame.
            .env$View2 <- function(...) {
                View(as.data.frame(...))
             }
        }

        attach(.env)

        # Completion                                                        {{{3
        # Turn on completion of installed package names.
        utils::rc.settings(ipck = TRUE)

        # Secrets                                                           {{{3
        # Load secret variables that we don't want to commit in shared Renviron.
        if (file.exists("~/.Rsecrets")) {
            source("~/.Rsecrets")
        } else {
            cat(
                "Failed to detect `~/.Rsecrets` file.",
                "GitHub package installs will be rate limited.",
                "",
                sep = "\n"
            )
        }

        # Session info                                                      {{{3
        # Show useful session information in console at load.
        if (isTRUE(rstudio)) {
           cat("R is running inside RStudio.\n\n")
        }
        cat(
            "User Library:",
            normalizePath(Sys.getenv("R_LIBS_USER")),
            "",
            "Working Directory:",
            normalizePath(getwd()),
            "",
            sep = "\n"
        )
    }
}



# Initialization at end of an R session                                     {{{1
# ==============================================================================

.Last <- function() {
    if (interactive()) {
        message("Goodbye at ", date(), "\n")
    }
}



# turn on folds
# vim: fdm=marker
