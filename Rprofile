# R startup profile
#
# Tested on Linux, macOS, and Windows.
#
# Stephen Turner's profile:
# http://gettinggeneticsdone.blogspot.com/2013/07/customize-rprofile.html
#
# Jim Hester's profile:
# https://github.com/jimhester/dotfiles/blob/master/R/Rprofile
#
# Efficient R programming:
# https://csgillespie.github.io/efficientR/set-up.html

# Notes ========================================================================
# Don't set `stringsAsFactors = FALSE`.
# Code will be non-portable!

# If devtools runs into an unzip error, set this:
# unzip = "/usr/bin/unzip"

# Check compilers are installed ================================================
if (Sys.getenv("HMS_CLUSTER") == "o2") {
    # module load gcc/6.2.0
    stopifnot(identical(
        x = Sys.which(c("gcc", "g++", "gfortran")),
        y = c(
            "gcc" =      "/n/app/gcc/6.2.0/bin/gcc",
            "g++" =      "/n/app/gcc/6.2.0/bin/g++",
            "gfortran" = "/n/app/gcc/6.2.0/bin/gfortran"
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
    stopifnot(identical(
        x = Sys.which(c("clang", "clang++", "gfortran")),
        y = c(
            "clang" =    "/usr/local/clang6/bin/clang",
            "clang++" =  "/usr/local/clang6/bin/clang++",
            "gfortran" = "/usr/local/gfortran/bin/gfortran"
        )
    ))
} else if (Sys.info()[["sysname"]] == "Linux") {
    stopifnot(identical(
        x = Sys.which(c("gcc", "g++", "gfortran")),
        y = c(
            "gcc" =      "/usr/bin/gcc",
            "g++" =      "/usr/bin/g++",
            "gfortran" = "/usr/bin/gfortran"
        )
    ))
}

# No conda allowed! Can cause compilation issues.
stopifnot(Sys.which("conda") == "")

# Invisible utility functions ==================================================
# Assign shortcuts to a hidden environment.
.env <- new.env()

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

.env$build_site <- function(..., document = FALSE) {
    unlink("docs", recursive = TRUE)
    pkgdown::build_site(..., document = document)
}

.env$build_vignettes <- function(...) {
    devtools::build_vignettes(...)
}

.env$catVec <- function(x) {
    x <- paste0("\"", x, "\"")
    x <- paste(x, collapse = ",\n")
    cat(x)
}

.env$check <- function(
    ...,
    document = FALSE,
    vignettes = FALSE
) {
    devtools::check(
        ...,
        document = document,
        vignettes = vignettes
    )
    # This will error if directory doesn't match package name.
    # BiocCheck::BiocCheck(".")
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

.env$export <- function(...) {
    basejump::export(...)
}

# Find and replace across a directory.
.env$findAndReplace <- function(
    pattern,
    replacement,
    dir = ".",
    recursive = FALSE
) {
    files <- list.files(
        path = dir,
        pattern = "(r|R)$",
        full.names = TRUE,
        recursive = recursive
    )
    invisible(parallel::mclapply(
        X = files,
        FUN = function(file) {
            x <- readr::read_lines(file)
            x <- gsub(pattern = pattern, replacement = replacement, x = x)
            readr::write_lines(x, path = file)
        }
    ))
}

# macOS: Open Finder to the current directory.
.env$finder <- function(path = ".") {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    stopifnot(is.character(path) && length(character) == 1L)
    system(paste("open", path))
}

.env$import <- function(...) {
    basejump::import(...)
}

.env$install <- function(...) {
    BiocManager::install(...)
}

.env$install_github <- function(..., upgrade = "never") {
    remotes::install_github(..., upgrade = upgrade)
}

.env$lint_package <- function(...) {
    lintr::lint_package(...)
}

.env$loadData <- function(...) {
    basejump::loadData(...)
}

# pkgload::load_all(helpers = FALSE, attach_testthat = FALSE)
.env$load_all <- function() {
    devtools::load_all()
}

# Get free memory statistics.
# Currently this only works for Linux.
#
# - `help(topic = "Memory", package = "base")`
# - `help(topic = "Memory-limits", package = "base")`
#
# - `utils:::format.object_size()`
# - `print:::print.bytes()`
#
# - https://stackoverflow.com/a/6457769
# - https://stackoverflow.com/a/29787527
# - https://stat.ethz.ch/R-manual/R-devel/library/base/html/Memory-limits.html
# - http://adv-r.had.co.nz/memory.html
.env$memfree <- function() {
    message("Running garbage collection first with base::gc().")
    print(gc(verbose = TRUE, full = TRUE))
    mem_used <- capture.output(print(pryr::mem_used()))
    mem_free <- utils:::format.object_size(as.numeric(
        system("awk '/MemFree/ {print $2}' /proc/meminfo", intern = TRUE)
    ), "auto")
    message(paste0(
        "Memory used: ", mem_used, " (pryr::mem_used)\n",
        "Memory free: ", mem_free, " (awk MemFree)"
    ))
}

# macOS: Copy to clipboard.
.env$pbcopy <- function(x) {
    stopifnot(Sys.info()[[1L]] == "Darwin")
    capture.output(x, file = pipe("pbcopy"))
}

.env$rcmdcheck <- function(...) {
    rcmdcheck::rcmdcheck(...)
}

.env$report <- function(...) {
    # covr doesn't currently install DT but requires it for this function.
    library(DT)
    covr::report(...)
}

.env$roxygenize <- function(...) {
    roxygen2::roxygenise(...)
}

.env$run_examples <- function(..., fresh = TRUE) {
    devtools::run_examples(..., fresh = fresh)
}

.env$saveData <- function(...) {
    basejump::saveData(...)
}

.env$script_path <- function() {
    rstudioapi::getSourceEditorContext()$path
}

.env$test <- function(...) {
    require(testthat)
    require(patrick)
    devtools::test(...)
}

# Check installed packages
.env$update_packages <- function() {
    remotes::update_packages()
    # update.packages(
    #     ask = TRUE,
    #     checkBuilt = TRUE,
    #     repos = BiocManager::repositories()
    # )
}

.env$valid <- function(...) {
    BiocManager::valid(...)
}

.env$View2 <- function(...) {
    View(as.data.frame(...))
}

# Set seed for reproducibility =================================================
.env$seed <- 1454944673L
set.seed(.env$seed)

# R 3.5.1
# cat(head(.Random.seed, n = 3L), sep = "\n")
# 403
# 624
# 1853863629
# -1353004246

# Initilization at start of an R session =======================================
# help(topic = "Startup", package = "base")
.First <- function() {
    # Console options.
    options(
        # Kill annoying "+" in console output.
        continue = " ",
        max.print = 1000L,
        # Unicode character has improved legibility (see zsh pure).
        # However it doesn't work well in Putty, so disable.
        # prompt = "❯ ",
        prompt = "> ",
        show.signif.stars = FALSE,
        width = 80L
    )

    # Set default author, for R Markdown templates.
    options(
        author = "Michael Steinbaugh",
        email = "mike@steinbaugh.com"
    )

    # basejump
    options(
        basejump.save.dir = file.path("data", Sys.Date()),
        basejump.save.ext = "rds"
    )

    # crayon
    options(
        crayon.enabled = TRUE,
        crayon.colors = 256L
    )

    # httr
    # Enable OAuth token generation using httr on a remote R server.
    # This is used by googlesheets, for example.
    options(
        httr_oob_default = TRUE
    )

    # readr
    options(
        readr.num_columns = 0L,
        readr.show_progress = FALSE
    )

    # Disable settings that can be problematic across platforms.
    options(
        browserNLdisabled = TRUE,
        # Menu graphics can crash R.
        menu.graphics = FALSE
    )

    # Improve the warnings and include backtrace of call stack.
    options(
        deparse.max.lines = 3L,
        showErrorCalls = TRUE,
        showWarnCalls = TRUE,
        warn = 1L,
        # Note that edgeR and pheatmap currently fail for these.
        # warnPartialMatchAttr = TRUE,
        # warnPartialMatchDollar = TRUE,
        # 8170 is the maximum warning length.
        warning.length = 8170L
    )
    # Improve stack traces for error messages.
    # - https://twitter.com/krlmlr/status/1086995664591044608
    # - https://gist.github.com/krlmlr/33ec72d196b1542b9c4f9497d981de49
    options(
        error = quote(rlang::entrace()),
        # Can use either "collapse", "branch", or "full".
        rlang__backtrace_on_error = "full"
    )

    # Package installation options.
    # Leave these disabled by default.
    # Can be helpful for troublesome packages.
    # options(
    #     install.packages.check.source = "no",
    #     install.packages.compile.from.source = "binary",
    #     repos = BiocManager::repositories()
    # )

    if (interactive()) {
        attach(.env)

        # Load secret variables that we don't want in Renviron.
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

        # Turn on completion of installed package names.
        utils::rc.settings(ipck = TRUE)

        # Check for developer environment.
        devel <- grepl("devel$", Sys.getenv("R_LIBS_USER"))

        # Set developer-specific profile.
        if (isTRUE(devel)) {
            # Enable automatic package updates from home directory.
            if (identical(
                x = normalizePath(getwd()),
                y = normalizePath("~")
            )) {
                # Automatically update packages.
                try(BiocManager::install(ask = TRUE))
                suppressWarnings(utils::update.packages(ask = TRUE))
            }
        }

        # Check for developer library in git repos.
        # if (
        #     grepl("/git/", getwd()) &&
        #     !isTRUE(devel)
        # ) {
        #     warning("Developer library not detected.")
        # }

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

# Initilization at end of an R session =========================================
.Last <- function() {
    # Here's how to write out R history to a file.
    # https://stackoverflow.com/a/1357432i
    #
    # In shell config:
    # export R_HISTFILE=~/.Rhistory
    #
    # if (!any(commandArgs() == "--no-readline") && interactive()) {
    #     try(utils::savehistory(Sys.getenv("R_HISTFILE")))
    # }

    if (interactive()) {
        message("Goodbye at ", date(), "\n")
    }
}
